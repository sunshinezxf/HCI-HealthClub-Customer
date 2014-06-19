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
<script type="text/javascript">
function validate(){
	var name=document.getElementsByName("name")[0].value;
	var phone=document.getElementsByName("phone")[0].value;
	var credit=document.getElementsByName("credit")[0].value;
	var address=document.getElementsByName("address")[0].value;
	var password=document.getElementsByName("password")[0].value;
	var repassword=document.getElementsByName("repassword")[0].value;
	alert(name+","+phone+","+credit+",");
	var form = document.getElementById("registerForm");
	
	if(name!=""&&phone!=""&&credit!=""&&address!=""&&password!=""&&repassword!=""){
		form.submitted = true;
		document.getElementById("submit").style.background = "blue";
	}else{
		form.submitted = false;
		document.getElementById("submit").style.background = "grey";
	}
	
}

function init(){
	var form = document.getElementById("registerForm");
	form.submitted = false;
}
</script>
<title>Health Club--register</title>
</head>
<body ONLOAD="init();">
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
	<div style="margin-right:30%">
	<div class="grid-layout module" >
		<strong>Register</strong>
		<%
			String prompt = (String) session.getAttribute("prompt");
			if ((prompt == null) || prompt.equals("")) {
			} else {
		%>
		<div class="alert alert-success">
			<h1><%=prompt%></h1>
		</div>
		<%
			session.removeAttribute("prompt");
			}
		%>
		<hr>
		<s:form id="registerForm" cssClass="form-register" action="register" name="register"
			method="post" namespace="/action">
			<span>Please fill you information</span>
			<input type="text" class="form-control" placeholder="Name"
				name="name" / onChange="validate()">
			<div class="form-register-gender">
				<input type="radio" name="gender" value="male" / onClick="validate();">&nbsp; &nbsp;Male
			</div>
			<div class="form-register-gender">
				<input type="radio" name="gender" value="female" onClick="validate()"/>&nbsp;&nbsp;Female
			</div>
			<input type="text" class="form-control" placeholder="Cellphone"
				name="phone" onChange="validate()"/>
			<input type="text" class="form-control" placeholder="Age" name="age" onChange="validate()"/>
			<input type="text" class="form-control" placeholder="Address"
				name="address" onChange="validate()">
			<input type="text" class="form-control" placeholder="Credit Card"
				name="credit" onChange="validate()"/>
			<input type="password" class="form-control" placeholder="Password"
				name="password" onChange="validate()"/>
			<input type="password" class="form-control" placeholder="Confirm your Password"
				name="repassword" onChange="validate()"/>
			<center><button class="btn btn-lg btn-primary btn-block button-commit"
				type="submit" id="submit">Register</button></center>
		</s:form>
	</div>
</div>
</body>
</html>