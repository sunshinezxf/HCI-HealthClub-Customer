<%@page import="model.Gender"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="model.VIP"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club vip view privacy page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<%
	VIP vip = (VIP) session.getAttribute("vip");
%>
<title>Health Club--<%=vip.getName()%></title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<s:url value="/member/index.jsp"></s:url>"><img
					alt="logo" src="<s:url value="/material/HealthClub.png"></s:url>" /></a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<s:url value="/member/index.jsp"></s:url>">Home</a></li>
					<li><s:a action="viewprivacy" namespace="/action">
							<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Personal Information</s:a></li>
					<li><s:a action="quit" namespace="/action">Quit</s:a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>
						Hello, &nbsp;
						<%=vip.getName()%>!
					</h1>
					<p>You can check your registration data here.</p>
				</div>
				<s:form cssClass="layout module card" action="confirmprivacy"
					namespace="/action">
					<div class="information">
						<h4>
							Username:&nbsp;<%=vip.getUsername()%></h4>
						<input type="text" type="text" style="display: none;"
							value=<%=vip.getUsername()%> name="username">
					</div>
					<div class="information">
						<h4>Name:</h4>
						<input type="text" class="form-control" value=<%=vip.getName()%>
							name="name">
					</div>
					<div class="information">
						<h4>Gender:&nbsp;</h4>
						<div class="form-register-gender">
							<input type="radio" name="gender" value="male" name="gender" />&nbsp;
							&nbsp;Male
						</div>
						<div class="form-register-gender">
							<input type="radio" name="gender" value="female" name="gender" />&nbsp;
							&nbsp;Female
						</div>
					</div>
					<br>
					<div class="information">
						<h4>Cellphone:&nbsp;</h4>
						<input type="text" class="form-control"
							value=<%=vip.getPhone().getNo()%> name="phone">
					</div>
					<div class="information">
						<h4>Age:&nbsp;</h4>
						<input type="text" class="form-control" value=<%=vip.getAge()%>
							name="age">
					</div>
					<div class="information">
						<h4>Address:&nbsp;</h4>
						<input type="text" class="form-control"
							value=<%=vip.getAddress()%> name="address" />
					</div>
					<div class="information">
						<h4>Credit No:&nbsp;</h4>
						<input type="text" class="form-control"
							value=<%=vip.getCreditCard().getCr_no()%> name="cr_no">
					</div>
					<br>
					<button type="submit" class="btn btn-lg btn-primary">Confirm</button>
				</s:form>
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<s:a cssClass="list-group-item" action="viewcard"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Membership &nbsp;Card</s:a>
					<s:a cssClass="list-group-item" action="viewprivacy">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Registration &nbsp;Data</s:a>
					<s:a cssClass="list-group-item" action="viewactivity"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Activity &nbsp;Record</s:a>
					<s:a cssClass="list-group-item" action="viewpay"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Payment &nbsp;Record</s:a>
					<s:a cssClass="list-group-item" action="withdraw"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Withdraw &nbsp;VIP</s:a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>