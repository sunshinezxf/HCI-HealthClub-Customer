<%@page import="util.Prompt"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club login page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<link rel="stylesheet"
	href="<s:url value="/css/bootstrap-theme.min.css"></s:url>" />
<title>Health Club--login</title>
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
		<strong>Login</strong>
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
		<s:form cssClass="form-register" action="login" name="login"
			method="post" namespace="/action">
			<span>Please input your login username and password</span>
			<s:div cssClass="box">
				<input type="text" class="form-control" placeholder="Login Username"
					name="username" id="username" onkeypress=keypress()
					onchange=checkUsername() autofocus="autofocus" />
				<span id="username_span" class="right_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="password" class="form-control"
					placeholder="Login Password" name="password" id="password"
					oninput=checkPassword() />
				<span id="passwd_span"></span>
			</s:div>
			<button class="btn btn-lg btn-primary btn-block button-commit login"
				disabled="disabled" type="submit" id="lgbtn">Login</button>
		</s:form>
	</div>
	<script src="<s:url value="/js/validate/login_validate.js"></s:url>"
		type="text/javascript">
		
	</script>
</body>
</html>