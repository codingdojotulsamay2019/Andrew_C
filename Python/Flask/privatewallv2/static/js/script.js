$(document).ready(function(){
    $('#email').keyup(function(){
        var data = $("#regForm").serialize()   // capture all the data in the form in the variable data
        $.ajax({
            method: "POST",   // we are using a post request here, but this could also be done with a get
            url: "/email",
            data: data
        })
        .done(function(res){
             $('#emailMsg').html(res)  // manipulate the dom when the response comes back
        })
    })
    $('#lookup').keyup(function(){
        var data = $("#lookupemail").serialize()   // capture all the data in the form in the variable data
        $.ajax({
            method: "GET",   // we are using a post request here, but this could also be done with a get
            url: "/usersearch",
            data: data
        })
        .done(function(res){
             $('#emaillook').html(res)
        })
    })
    $('.msgboxsend').click(function(){   //This is just the last of a number of attempts to get
         $.ajax({                       //this block to work.
              url: $(this).closest(form).attr('action'),
              method: 'POST',
              data: $(this).closest('form').serialize()
         })
         .done(function(response){
             $('.send').closest('textarea').value = '';
         })
         .fail(function(response) {
             continue;
         })
         .always(function(data){
             console.log(data);
         })
        return false;  //This is not stopping form submission
    });
})
