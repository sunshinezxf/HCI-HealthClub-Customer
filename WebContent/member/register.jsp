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
		<hr>
		<s:form cssClass="form-register" action="register" name="register"
			method="post" namespace="/action">
			<span>Please fill you information</span>
			<input type="text" class="form-control" placeholder="Name"
				name="name" />
			<div class="form-register-gender">
				<input type="radio" name="gender" value="male" />&nbsp; &nbsp;Male
			</div>
			<div class="form-register-gender">
				<input type="radio" name="gender" value="female" />&nbsp;
				&nbsp;Female
			</div>
			<input type="text" class="form-control" placeholder="Cellphone"
				name="phone" />
			<input type="text" class="form-control" placeholder="Age" name="age" />
			<input type="text" class="form-control" placeholder="Address"
				name="address">
			<input type="text" class="form-control" placeholder="Credit Card"
				name="credit" />
			<input type="password" class="form-control" placeholder="Password"
				name="password" />
			<button class="btn btn-lg btn-primary btn-block button-commit"
				type="submit">Register</button>
		</s:form>
	</div>

</body>
</html>