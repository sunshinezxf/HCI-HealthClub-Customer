<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8" import="util.Prompt"%>
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
<script type="text/javascript">
	function validate(node) {
		var content = node.value;
		var contentReg1 = /^[\d]{11}$/;
		var contentReg2 = /^[\d]{11}$/;

		if (!(contentReg1.test(content) || contentReg2.test(content))) {
			document.getElementById("nameTip").innerHTML = "Please Enter a Valid phone number!";
		} else {
			document.getElementById("nameTip").innerHTML = "";
		}
	}
</script>
<title>Health Club--find password</title>
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
	
		<div class="container module grid-layout">
			<strong>find password</strong>
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
			<s:form cssClass="form-register" action="findpass" name="findpass"
				method="post" namespace="/action">
				<span>Please input your telephone number</span>
				<input type="text" class="form-control"
					placeholder="Your Telephone Number" name="phone"
					onchange="validate(this);" />
				<span style="color: red;" id="nameTip"></span>

				<button class="btn btn-lg btn-primary btn-block button-commit login"
					type="submit">confirm</button>
			</s:form>
		</div>
	<footer class="container">&copy; Health Club&#8482;,&nbsp;2014</footer>
</body>
</html>