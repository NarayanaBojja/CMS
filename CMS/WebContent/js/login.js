function loginUser() {

	var email = document.getElementById('userName').value;
	var password = document.getElementById('passWord').value;
	var message = "";
	if (email == "" || password == "") {
		message = "Please fill valid email and password before you proceed. <br>";
	}

	else {
		message = validateEmail(email);
	}

	if (message != "") {
		$(".isa_success_modal").css('display', 'none');
		$(".isa_error_modal").css('display', 'block');
		$("#loginModelErrorMessage").html(message);
		return false;

	}
	return true;
}

function validateEmail(email) {
	var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var message = "";

	if (!emailRegex.test(email)) {
		message = "Email is not valid. Please enter valid email.<br>";
	}

	return message;
}
