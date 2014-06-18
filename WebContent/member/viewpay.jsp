<%@page import="model.record.PayRecord"%>
<%@page import="java.util.ArrayList"%>
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
					alt=" ogo" src="<s:url value="/material/HealthClub.png"></s:url>"></a>
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
	<s:div cssClass="container">
		<s:div cssClass="row row-offcanvas row-offcanvas-right">
			<s:div cssClass="col-xs-12 col-sm-9">
				<p class="pull right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<s:div cssClass="jumbotron">
					<h1>
						Hello,&nbsp;
						<%=vip.getName()%>!
					</h1>
					<p>You can check out all your pay records here.</p>
				</s:div>
				<s:div cssClass="layout module">
					<%
						@SuppressWarnings("unchecked")
										ArrayList<PayRecord> recordList = (ArrayList<PayRecord>) request
												.getAttribute("recordList");
										if (recordList == null || recordList.size() == 0) {
					%>
					<h3><%=vip.getName()%>, you don't have any pay record till
						now.
					</h3>
					<%
						} else {
											int size = recordList.size();
					%>
					<h3>
						You have
						<%=size%>
						<%=(size == 1) ? "piece" : "pieces"%>
						of pay record.
					</h3>
					<s:iterator value="%{#request.recordList}" status="st">
						<s:div cssClass="card">
							<s:iterator value="%{#request.recordList.get(#st.index)}">
								<h4>
									Username:&nbsp;
									<s:property
										value="%{#request.recordList.get(#st.index).username}" />
									&nbsp;&nbsp; Card No:&nbsp;
									<s:property value="%{#request.recordList.get(#st.index).code}" />
									&nbsp;&nbsp; Price:&nbsp;
									<s:property value="%{#request.recordList.get(#st.index).price}" />
									&nbsp;&nbsp; Date:&nbsp;
									<s:property value="%{#request.recordList.get(#st.index).date}" />
									&nbsp;&nbsp; Type:&nbsp;
									<s:property
										value="%{#request.recordList.get(#st.index).payType}" />
								</h4>
							</s:iterator>
						</s:div>
					</s:iterator>
					<%
						}
					%>
				</s:div>
			</s:div>
			<s:div cssClass="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<s:div cssClass="list-group">
					<s:a cssClass="list-group-item" action="viewcard"
						namespace="/action">
						<s:param name="v_id" value="%{session.vip.v_id}"></s:param>Membership &nbsp;Card</s:a>
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
				</s:div>
			</s:div>
		</s:div>
	</s:div>
</body>
</html>