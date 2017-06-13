
jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        var newpassword = $(this).find('.newpassword').val();
        var email = $(this).find('.email').val();
        
        var num = $(this).find('.num').val();
        
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        } 
        if(newpassword == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '163px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.newpassword').focus();
            });
            return false;
        }
        if(email == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '232px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.email').focus();
            });
            return false;
        }
        
        if(num == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '163px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.num').focus();
            });
            return false;
        }
    });

    $('.page-container form .username, .page-container form .password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
