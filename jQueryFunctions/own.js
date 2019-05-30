$('document').ready(function(){
    $('.fadeIn .actionBox p').hide();
    $('.slideToggle button').click(function(){
        $('.slideToggle .actionBox p').slideToggle('fast');
    });

    $('.fadeIn button').click(function(){
        $('.fadeIn .actionBox p').fadeIn("slow");
    });

    $('.fadeOut button').click(function(){
        $('.fadeOut .actionBox p').fadeOut("fast");
            $('.fadeOut .actionBox h1').addClass('red');
    });

    $('.before button').click( function() {
        $('.before p').before("<span>I'm Before the Paragraph</span>");
    });

    $('.after button').click( function() {
        $('.after p').after("<span>I'm After the Paragraph</span>");
    });

});
