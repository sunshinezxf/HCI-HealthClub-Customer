<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="model.VIP"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club vip index page" />
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
						Hello,&nbsp;
						<%=vip.getName()%>!
					</h1>
					<p>Welcome to your personal home page, your can see what you
						can do here.</p>
				</div>
				<div class="row">
					<div class="col-6 col-sm-6 col-lg-4">
						<h2>
							<s:a action="viewcard" namespace="/action">
								<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Membership Card</s:a>
						</h2>
						<p>You can either apply for a new one or check out all that
							you already have.</p>
					</div>
					<div class="col-6 col-sm-6 col-lg-4">
						<h2>
							<s:a action="viewprivacy" namespace="/action">
								<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>
							Registration Data
							</s:a>
						</h2>
						<p>Here you can check out your personal information and modify
							them.</p>
					</div>
					<div class="col-6 col-sm-6 col-lg-4">
						<h2>
							<s:a action="viewactivity" namespace="/action">
								<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Activity Record</s:a>
						</h2>
						<p>Here you can check out all the activities you have
							participated in.</p>
					</div>
					<div class="col-6 col-sm-6 col-lg-4">
						<h2>
							<s:a action="viewpay" namespace="/action">
								<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Payment Record</s:a>
						</h2>
						<p>Here you can check out all your payment record.</p>
					</div>
					<div class="col-6 col-sm-6 col-lg-4">
						<h2>
							<s:a>
								<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Withdraw VIP</s:a>
						</h2>
						<p>Here you can check out all your payment record.</p>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<s:a cssClass="list-group-item" action="viewcard"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Membership &nbsp;Card</s:a>
					<s:a cssClass="list-group-item" action="viewprivacy"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Registration &nbsp;Data</s:a>
					<s:a cssClass="list-group-item" action="viewactivity"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Activity &nbsp;Record</s:a>
					<s:a cssClass="list-group-item" action="viewpay"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Payment &nbsp;Record</s:a>
					<s:a cssClass="list-group-item" action="requestwithdraw"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Withdraw &nbsp;VIP</s:a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>