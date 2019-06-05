from flask import Flask, render_template #, request, redirect-template
import random
app = Flask(__name__)
# ------------------------------------------------------------------------------
@app.route('/')
def home():
    return render_template('home.html')
# ------------------------------------------------------------------------------
@app.route('/run')
def run():
    return render_template('run.html')
# ------------------------------------------------------------------------------
@app.route('/bear')
def bear():
    return render_template('bear.html')
# ------------------------------------------------------------------------------
@app.route('/fight')
def fight():
    random_num = random.randint(0,2)
    if random_num == 0:
        outcome = 'you die'
        return render_template('fight_outcome.html',outcome=outcome)
    else:
        outcome = 'you live'
        return render_template('fight_outcome.html',outcome=outcome)
# ------------------------------------------------------------------------------
@app.route('/left') # stream
def stream():
    random_num = random.randint(0,2)
    if random_num == 0:
        outcome = 'you fall into the stream and drown'
        return render_template('stream.html',outcome=outcome)
    else:
        outcome = 'You are afraid of water so you must turn to fight the bear!'
        return render_template('stream.html',outcome=outcome, fight=True)
# ------------------------------------------------------------------------------
@app.route('/right') # tree
def tree():
    random_num = random.randint(0,2)
    if random_num == 0:
        outcome = 'slip under and get away'
        return render_template('tree.html',outcome=outcome)
    else:
        outcome = 'bear catches you and kills you'
        return render_template('tree.html',outcome=outcome)
# =============================================================================
if __name__=="__main__":
    app.run(debug=True)
