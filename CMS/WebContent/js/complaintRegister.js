function complaintRegister() {
	var name = document.getElementById('name').value;
	var email = document.getElementById('email').value;
	var subject = document.getElementById('subject').value;
	var department = document.getElementById('department').value;
	var cmessage = document.getElementById('message').value;
	var message = "";
	if (name == "" || email == "" || subject == "" || department == ""
			|| cmessage == "") {
		message = "Please fill the fields before you proceed. <br>";
	}else{
		message = validateName(name);
		if (message == "") {
			message = validateEmail(email);
		}
	}

	if (message != "") {
		$(".isa_success_modal").css('display', 'none');
		$(".isa_error_modal").css('display', 'block');
		$("#loginModelErrorMessage").html(message);
		return false;

	}
	return true;
}


function validateName(name) {
	
	var message = "";
	var nameRegex = /^[A-Za-z\s]+$/;

	if (!nameRegex.test(name)) {
		message = "Name should contain only alphabates.<br>";
	}

	return message;
}

function validateEmail(email) {
	var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var message = "";

	if (!emailRegex.test(email)) {
		message = "Email is not valid. Please enter valid email.<br>";
	}

	return message;
}