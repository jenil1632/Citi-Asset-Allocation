
(function ($) {
    "use strict";

    /*==================================================================
    [ Validate ]*/

	var check = true;
	var username_check = false;
	var password_check = false;
	var cpassword_check = false;
	var email_check = false;

    $('.validate-form').on('submit',function(){

		validate_username();
		validate_password();
		validate_cpassword();
		validate_email();
        return (username_check && password_check && cpassword_check && email_check);
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });
		function validate_email(){
			var email = $("#email").val();
			console.log(email);
			var email_len = $("#email").val().length;
			var input = $("#email");
			var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if(email_len == 0){
				$(input).parent().attr('data-validate', "Email is required");
				showValidate(input);
				email_check = false;				
			}
			else if(!filter.test(email)){
				$(input).parent().attr('data-validate', "Enter valid email address");
				showValidate(input);
				email_check = false;
			}
			else{
				hideValidate();
				email_check = true;
			}
		}
		function validate_username(){
			var username_len = $("#username").val().length;
			var input = $("#username");
			if(username_len == 0){
				$(input).parent().attr('data-validate', "Username is required");
				showValidate(input);
				username_check = false;				
			}
			else if(username_len < 5 || username_len > 20){
				$(input).parent().attr('data-validate', "Username should be between 5-20 characters");
				showValidate(input);
				username_check = false;
			}
			else{
				hideValidate();
				username_check = true;
			}
		}
		function validate_password(){
			var pass_len = $("#password").val().length;
			var input = $("#password");
			if(pass_len == 0){
				$(input).parent().attr('data-validate', "Password is required");
				showValidate(input);
				password_check = false;				
			}
			else{
				hideValidate();
				password_check = true;
			}
		}
		function validate_cpassword(){
			var cpass_len = $("#cpassword").val().length;
			var cpass = $("#cpassword").val();
			var pass = $("#password").val();
			var input = $("#cpassword");
			if(cpass_len == 0){
				$(input).parent().attr('data-validate', "Confirm the password");
				showValidate(input);
				cpassword_check = false;				
			}
			else if(cpass != pass){
				$(input).parent().attr('data-validate', "Passwords don't match");
				showValidate(input);
				cpassword_check = false;
			}
			else{
				hideValidate();
				cpassword_check = true;
			}
		}
/*    function validate (input) {
        if($(input).attr('type') == 'text' || $(input).attr('name') == 'username') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }
*/
    function showValidate(input) {
        var thisAlert = $(input).parent();
        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    

})(jQuery);