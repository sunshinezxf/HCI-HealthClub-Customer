/**
 * @author zhang xu fan
 */

function keypress() {
	var code = event.keyCode;
	if (code >= 48 && code <= 57) {
		event.returnValue = true;
	} else {
		event.returnValue = false;
	}
}

function checkUsername() {
	var username_prompt = document.getElementById("username_span");
	if (!validate_username()) {
		username_prompt.innerHTML = "Oops, username not legal ";
		username_prompt.setAttribute("class", "alert alert-danger right_span");
	} else {
		username_prompt.innerHTML = "Good job, please go ahead";
		username_prompt.setAttribute("class", "alert alert-info right_span");
	}
	if (validate_username() && validate_password()) {
		var lgbtn = document.getElementById("lgbtn");
		lgbtn.removeAttribute("disabled");
	} else {
		var lgbtn = document.getElementById("lgbtn");
		lgbtn.setAttribute("disabled", "disabled");
	}
}

function checkPassword() {
	var password_prompt = document.getElementById("passwd_span");
	if (validate_password()) {
		password_prompt.innerHTML = "Password has input";
		password_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		password_prompt.innerHTML = "Password cannot be null";
		password_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate_username() && validate_password()) {
		var lgbtn = document.getElementById("lgbtn");
		lgbtn.removeAttribute("disabled");
	} else {
		var lgbtn = document.getElementById("lgtbn");
		lgbtn.setAttribute("disabled", "disabled");
	}
}

function validate_username() {
	var username = document.getElementById("username").value;
	var u_pattern = new RegExp("^[0-9]{8}$");
	var t_pattern = new RegExp("^[0-9]{11}$");
	var status = u_pattern.test(username) || t_pattern.test(username);
	if (status)
		return true;
	return false;
}

function validate_password() {
	var password = document.getElementById("password").value;
	if (password != null && password != "")
		return true;
	return false;

}