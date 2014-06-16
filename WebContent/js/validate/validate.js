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
	var username = document.getElementById("username").value;
	var u_pattern = new RegExp("^[0-9]{8}$");
	var t_pattern = new RegExp("^[0-9]{11}$");
	var status = u_pattern.test(username) || t_pattern.test(username);
	var username_prompt = document.getElementById("username_span");
	if (!status) {
		username_prompt.innerHTML = "Oops, username not legal ";
		username_prompt.setAttribute("class", "alert alert-danger right_span");
	} else {
		username_prompt.innerHTML = "Good job, please go ahead";
		username_prompt.setAttribute("class", "alert alert-info right_span");
	}
}

function checkPassword() {

}