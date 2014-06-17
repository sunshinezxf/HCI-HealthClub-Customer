<%@page import="util.Prompt"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club register page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<title>Health Club--register</title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<s:url value="/index.jsp"></s:url>"><img alt="logo"
					src="<s:url value="/material/HealthClub.png"></s:url>" /></a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<s:url value="/index.jsp"></s:url>">Home</a></li>
					<li><a href="<s:url value="/member/register.jsp"></s:url>">Register</a></li>
					<li><a href="<s:url value="/member/login.jsp"></s:url>">Login</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="grid-layout module">
		<strong>Register</strong>
		<%
			Prompt prompt = (Prompt) request.getAttribute("prompt");
			if (prompt != null) {
				if (prompt.getState() == true) {
		%>
		<div class="alert alert-success">
			<h1><%=prompt.getMessage()%></h1>
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<h1><%=prompt.getMessage()%></h1>
		</div>
		<%
			}
			}
		%>
		<hr>
		<s:form cssClass="form-register" action="register" name="register"
			method="post" namespace="/action">
			<span>Please fill you information</span>
			<s:div cssClass="box">
				<input type="text" class="form-control" placeholder="Name"
					name="name" id="reg_name" style="ime-mode: disabled"
					onkeyup="this.value=this.value.replace(/[\u4e00-\u9fa5]/g,'')"
					onchange=checkName() />
				<span id="reg_name_span"></span>
			</s:div>
			<s:div cssClass="box">
				<div class="form-register-gender">
					<input type="radio" name="gender" value="male" checked="checked" />&nbsp;
					&nbsp;Male
				</div>
				<div class="form-register-gender">
					<input type="radio" name="gender" value="female" />&nbsp;
					&nbsp;Female
				</div>
				<span id="reg_gender_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="text" class="form-control" placeholder="Cellphone"
					name="phone" id="reg_phone" onchange=checkPhone() />
				<span id="reg_phone_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="text" class="form-control" placeholder="Age" name="age"
					id="reg_age" onchange=checkAge() />
				<span id="reg_age_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="text" class="form-control" placeholder="Address"
					name="address" id="reg_address" onchange=checkAddress() />
				<span id="reg_addr_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="text" class="form-control" placeholder="Credit Card"
					name="credit" id="reg_credit" onchange=checkCredit() />
				<span id="reg_credit_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="password" class="form-control" placeholder="Password"
					name="password" id="reg_passwd" onchange=checkPassword() />
				<span id="reg_passwd_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="password" class="form-control"
					placeholder="Confirm Password" id="con_reg_passwd"
					oninput=checkConfirm() />
				<span id="con_reg_passwd_span"></span>
			</s:div>
			<button class="btn btn-lg btn-primary btn-block button-commit rg"
				type="submit" disabled="disabled" id="rgbtn">Register</button>
		</s:form>
	</div>
	<script src="<s:url value="/js/validate/reg_validate.js"></s:url>"
		type="text/javascript">
		
	</script>
</body>
</html>