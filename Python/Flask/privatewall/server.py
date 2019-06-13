from flask import Flask, render_template, request, redirect, session, flash
from mysqlconnection import connectToMySQL
from flask_bcrypt import Bcrypt
import re

EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
#Need Flask, render_template allows use of templated html files
#request for incoming request (form) data
#redirect for redirection to target location.
#session for storing state data
#flash for flash messages used for errors in form completion
#re for regex
#bcrypt for hashing

app = Flask(__name__)    # Create a new instance of the Flask class called "app"
app.secret_key = 'keep it secret, keep it safe' #set a secret key for security purposes
bcrypt = Bcrypt(app)


@app.route('/')
def domainroot(): #for domain level request. Default landing page.
    session['userid'] = 'none'
    return render_template('index.html')


@app.route('/registration', methods=['POST'])
def create():
    is_valid = True
    if len(request.form['fname']) < 2 or request.form['fname'].isalpha == False:
        is_valid = False
        flash("Please enter a valid first name", 'vfname')
    if len(request.form['lname']) < 2 or request.form['lname'].isalpha == False:
        is_valid = False
        flash("Please enter a valid last name", 'vlname')
    if not EMAIL_REGEX.match(request.form['email']):    # test whether a field matches the pattern
        flash("Invalid email address!", 'vemail')
        return redirect('/')
    mysql = connectToMySQL("login")
    query = "SELECT * FROM users WHERE email = %(email)s;"
    data = { "email" : request.form["email"] }
    result = mysql.query_db(query, data)
    if result == request.form['email']:
        flash("Email address already used!", 'vemail')
        return redirect('/')
    if len(request.form['password']) < 8:
        is_valid = False
        flash("Password should be at least 9 characters and contain two symbols of the elder powers", 'vpass')
    if request.form['password'] != request.form['cpassword']:
        is_valid = False
        flash("Passwords do not match", 'vmatch')


    if 'is_valid' == False:
        return redirect("/")
    else:
        flash("SUCCESS!", 'vsuccess')
        pw_hash = bcrypt.generate_password_hash(request.form['password'])
        print(pw_hash)
        mysql = connectToMySQL("login")
        query = "INSERT INTO users (first_name, last_name, email, password) VALUES (%(fn)s, %(ln)s, %(em)s, %(password_hash)s);"
        data = { "fn" : request.form['fname'],
                "ln" : request.form['lname'],
                "em" : request.form['email'],
                "password_hash" : pw_hash }
        mysql.query_db(query, data)

    return redirect("/")

@app.route('/login', methods=['GET'])
def fail():
    return redirect('/')

@app.route('/login', methods=['POST'])
def login():
    # see if the username provided exists in the database
    mysql = connectToMySQL("login")
    query = "SELECT * FROM users WHERE email = %(email)s;"
    data = { "email" : request.form["email"] }
    result = mysql.query_db(query, data)
    if len(result) > 0:
        if bcrypt.check_password_hash(result[0]['password'], request.form['password']):
            session['userid'] = result[0]['id']
            session['name'] = result[0]['first_name']
            return redirect('/wall')
    # if we didn't find anything in the database by searching by username or if the passwords don't match,
    # flash an error message and redirect back to a safe route
    flash("You could not be logged in", 'login')
    return redirect("/")


@app.route('/wall')
def wall():
    if session['userid'] == 'none':
        return redirect('/')
    mysql = connectToMySQL("login")
    query = "SELECT messages.id, messages.message, users2.first_name, messages.created_at FROM messages LEFT JOIN users ON receiver_id = users.id JOIN users as users2 ON sender_id = users2.id  WHERE users.id = %(user_id)s ORDER BY messages.created_at DESC LIMIT 3;"
    data = {"user_id" : session['userid']}
    result = mysql.query_db(query, data)
    mysql2 = connectToMySQL("login")
    query = "SELECT * FROM users"
    data = {"user_id" : session['userid']}
    fusers = mysql2.query_db(query, data)
    return render_template('wall.html', messages = result, users = fusers)

@app.route('/messages/create', methods=['POST'])
def create_msg():
    mysql = connectToMySQL("login")
    query = "INSERT INTO messages (message, sender_id, receiver_id, created_at, updated_at) VALUES (%(ms)s, %(sid)s, %(rid)s), NOW(), NOW();"
    data = { "ms" : request.form['msg'],
            "sid" : session['userid'],
            "rid" : request.form['rid'],
            }
    msgout = mysql.query_db(query, data)
    return redirect('/wall')

@app.route('/messages/<id>/delete')
def delete_msg(id):
    mysql = connectToMySQL("login")
    query = "DELETE FROM messages WHERE messages.id = %(msi)s;"
    data = { "msi" : id
            }
    msgout = mysql.query_db(query, data)
    return redirect('/wall')



@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')



@app.route('/', defaults={'path': ''})  #catches all other unspecified routes
@app.route('/<path:path>')              #Useful as a 404 response
def deliver404(path):
    return 'Your princess is in another castle.'


if __name__=="__main__":   # Ensure this file is being run directly and not from a different module
    app.run(debug=True)
