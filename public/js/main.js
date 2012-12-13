$(document).ready(function() {
	

	function validateEmail(email) { 
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}

	function validate_email() {

		// form validation here:
		var email = $('#email').val();
		if (!validateEmail(email)) {
			alert("Please enter a valid email address.");
			return false;
		}
		// if error return false
		// if ok, return true
		return true;
	}

	$('form#sign-up-form').bind("submit", validate_email);
});
