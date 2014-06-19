/**
 * @author zhang xu fan
 */
function checkName() {
	var name_prompt = document.getElementById("reg_name_span");
	if (validate_name()) {
		name_prompt.innerHTML = "Welcome, "
				+ document.getElementById("reg_name").value;
		name_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		name_prompt.innerHTML = "Oops, name cannot be null";
		name_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_name() {
	var reg_name = document.getElementById("reg_name").value;
	if (reg_name != null && reg_name != "") {
		return true;
	}
	return false;
}

function phone_input() {
	var code = event.keyCode;
	if (code >= 48 && code <= 57) {
		event.returnValue = true;
	} else {
		event.returnValue = false;
	}
}

function checkPhone() {
	var phone_state = validate_phone();
	var phone_prompt = document.getElementById("reg_phone_span");
	if (phone_state) {
		phone_prompt.innerHTML = "greate, phone format correct";
		phone_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		phone_prompt.innerHTML = "Oops, phone number incorrect";
		phone_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_phone() {
	var reg_phone = document.getElementById("reg_phone").value;
	var phone_pattern = new RegExp("^[0-9]{11}$");
	var result = phone_pattern.test(reg_phone);
	return result;
}

function checkAge() {
	var age_prompt = document.getElementById("reg_age_span");
	if (validate_age()) {
		age_prompt.innerHTML = "within age limitation";
		age_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		age_prompt.innerHTML = "age must be between 10 ~ 60";
		age_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_age() {
	var age = document.getElementById("reg_age").value;
	if (age < 10 || age > 60)
		return false;
	return true;
}

function checkAddress() {
	var addr_prompt = document.getElementById("reg_addr_span");
	if (validate_address()) {
		addr_prompt.innerHTML = "OK, you are from Earth";
		addr_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		addr_prompt.innerHTML = "Address cannot be null";
		addr_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_address() {
	var addr = document.getElementById("reg_address").value;
	if (addr != null && addr != "")
		return true;
	return false;
}

function checkCredit() {
	var credit_prompt = document.getElementById("reg_credit_span");
	if (validate_credit()) {
		credit_prompt.innerHTML = "credit format correct";
		credit_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		credit_prompt.innerHTML = "credit can only contain numbers";
		credit_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_credit() {
	var credit = document.getElementById("reg_credit").value;
	var credit_pattern = new RegExp("^[0-9]+$");
	var state = credit_pattern.test(credit);
	return state;
}

function checkPassword() {
	var password_prompt = document.getElementById("reg_passwd_span");
	if (validate_password()) {
		password_prompt.innerHTML = "good, confirm your password";
		password_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		password_prompt.innerHTML = "Oops, password cannot be null";
		password_prompt.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_password() {
	var password = document.getElementById("reg_passwd").value;
	if (password != null && password != "")
		return true;
	return false;
}

function checkConfirm() {
	var con_passwd_prompt = document.getElementById("con_reg_passwd_span");
	if (validate_confirm()) {
		con_passwd_prompt.innerHTML = "OK, remember password";
		con_passwd_prompt.setAttribute("class", "alert alert-info right_span");
	} else {
		con_passwd_prompt.innerHTML = "Oops, re-confirm password";
		con_passwd_prompt
				.setAttribute("class", "alert alert-danger right_span");
	}
	if (validate()) {
		var register = document.getElementById("rgbtn");
		register.removeAttribute("disabled");
	} else {
		var register = document.getElementById("rgbtn");
		register.setAttribute("disabled", "disabled");
	}
}

function validate_confirm() {
	var password = document.getElementById("reg_passwd").value;
	var con_password = document.getElementById("con_reg_passwd").value;
	if (password == con_password)
		return true;
	return false;
}

function validate() {
	return validate_name() && validate_phone() && validate_age()
			&& validate_address() && validate_credit() && validate_password()
			&& validate_confirm();
}