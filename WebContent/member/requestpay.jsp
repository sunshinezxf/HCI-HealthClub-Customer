<%@page import="model.card.VIPCard"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.VIP"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club confirm pay page" />
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
	<s:div cssClass="navbar navbar-inverse navbar-fixed-top">
		<s:div cssClass="container">
			<s:div cssClass="navbar-header">
				<a href="<s:url value="/member/index.jsp"></s:url>"><img
					alt="logo" src="<s:url value="/material/HealthClub.png"></s:url>"></a>
			</s:div>
			<s:div cssClass="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<s:url value="/member/index.jsp"></s:url>">Home</a></li>
					<li><s:a action="viewprivacy" namespace="/action">
							<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Personal Information</s:a></li>
					<li><s:a action="quit" namespace="/action">Quit</s:a></li>
				</ul>
			</s:div>
		</s:div>
	</s:div>
	<s:div cssClass="container">
		<s:div cssClass="row row-offcanvas row-offcanvas-right">
			<s:div cssClass="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<s:div cssClass="jumbotron">
					<h1>
						Hello,&nbsp;<%=vip.getName()%>!
					</h1>
					<p>You are now trying to pay the card.</p>
				</s:div>
				<s:div cssClass="layout module">
					<%
						VIP display = (VIP) request.getAttribute("vip");
										VIPCard card = display.getCardList().get(0);
					%>
				Confirm Pay
				<s:div cssClass="card">
						<s:a cssClass="btn btn-lg btn-primary delete" action="pay"
							namespace="/action">
							<s:param name="c_id" value="%{#request.vip.cardList.get(0).c_id}"></s:param>
							<s:param name="v_id" value="%{#request.vip.v_id}"></s:param>Confirm</s:a>
						<h4>
							Card No:
							<%=card.getCode()%></h4>
						<h4>
							Card Type:
							<%=card.getType()%></h4>
						<h4>
							Owner Name:
							<%=display.getName()%></h4>
						<h4>
							Rent:
							<%=card.getRent()%></h4>
						<h4>
							Credit No:
							<%=display.getCreditCard().getCr_no()%></h4>
					</s:div>
				</s:div>
			</s:div>
			<s:div cssClass="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<s:div cssClass="list-group">
					<s:a cssClass="list-group-item" action="viewcard"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Membership &nbsp;Card</s:a>
					<s:a cssClass="list-group-item" action="viewprivacy"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Registration &nbsp;Data</s:a>
					<s:a cssClass="list-group-item" action="viewactivity"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Activity &nbsp;Record</s:a>
					<s:a cssClass="list-group-item" action="viewpayment"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Payment &nbsp;Record</s:a>
					<s:a cssClass="list-group-item" action="requestwithdraw" namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Withdraw &nbsp;VIP</s:a>
				</s:div>
			</s:div>
		</s:div>
	</s:div>
	<footer class="container">&copy; Health Club&#8482;,&nbsp;2014</footer>
</body>
</html>