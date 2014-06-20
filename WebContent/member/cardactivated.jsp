<%@page import="model.VIP"%>
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
<meta name="author" content="wu yun yi" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<link rel="stylesheet"
	href="<s:url value="/css/bootstrap-theme.min.css"></s:url>" />

<title>HealthClub--not activated</title>
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

	<s:div cssClass="container">
		<s:div cssClass="row row-offcanvas row-offcanvas-right">
			<s:div cssClass="col-xs-12 col-sm-9">
	          <s:div cssClass="jumbotron">
					<%
						VIP vip = (VIP) session.getAttribute("vip");
					%>
					<h1>
						Hello,&nbsp;<%=vip.getName()%>!
					</h1>
					<p>This is the result page of your previous operation.</p>
			  </s:div>
			   <div class="container grade layout" >
			         <s:div cssClass="module alert alert-danger">
					<h1>Card has not been activated, click to activate it.</h1>
				    </s:div>
			  	    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
	                            <s:a cssClass="btn btn-primary btn-lg" action="viewcard"
						         namespace="/action">
						       <s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Membership &nbsp;Card
					            </s:a>     
	                 </div>
	             </div>

			</s:div>
		</s:div>
	</s:div>
	<footer class="container">&copy; Health Club&#8482;,&nbsp;2014</footer>
</body>
</html>