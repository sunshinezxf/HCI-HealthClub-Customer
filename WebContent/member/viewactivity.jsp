<%@page import="model.Activity"%>
<%@page import="model.card.VIPCard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.VIP"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club view card page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<%
	VIP vip = (VIP) session.getAttribute("vip");
%>
<title>Health Club--<%=vip.getName()%></title>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<s:url value="/member/index.jsp"></s:url>"><img
					alt=" ogo" src="<s:url value="/material/HealthClub.png"></s:url>" /></a>
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
					<p>You can manage all your reservation here.</p>
				</div>
				<div class="layout module">
					<%
						@SuppressWarnings("unchecked")
						ArrayList<Activity> list = (ArrayList<Activity>) request
								.getAttribute("reserved");
						if (list == null || list.size() == 0) {
					%>
					<h3>
						Oops,
						<%=vip.getName()%>, you don't have any reservation at the moment.
					</h3>
					<%
						} else {
							int size = list.size();
					%>
					<h3>
						You have reserved
						<%=size%>
						<%=(size == 1) ? "activity" : "activities"%>.
					</h3>
					<s:iterator value="%{#request.reserved}" status="st">
						<div class="card">
							<s:iterator value="%{#request.reserved.get(#st.index)}">
								<s:a cssClass="btn btn-lg btn-primary delete"
									action="cancelactivity" namespace="/action">
									<s:param name="ac_id"
										value="%{#request.reserved.get(#st.index).ac_id}"></s:param>
									<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Cancel
								</s:a>
								<h4>
									Activity Name:
									<s:property value="%{#request.reserved.get(#st.index).ac_name}" />
								</h4>
								<h4>
									Location:
									<s:property
										value="%{#request.reserved.get(#st.index).place.location}" />
								</h4>
								<h4>
									Start:
									<s:property
										value="%{#request.reserved.get(#st.index).startDate}" />
								</h4>
								<h4>
									End:
									<s:property value="%{#request.reserved.get(#st.index).endDate}" />
								</h4>
							</s:iterator>
						</div>
					</s:iterator>
					<%
						}
					%>
				</div>
				<s:div cssClass="layout module">
					<%
						@SuppressWarnings("unchecked")
							ArrayList<Activity> other = (ArrayList<Activity>) request
									.getAttribute("other");
							if (other == null || other.size() == 0) {
					%>
					<h3>Oops, There is no activity left!</h3>
					<%
						} else {
					%>
					<h3>You can also choose the following activities.</h3>
					<hr>
					<s:iterator value="%{#request.other}" status="st">
						<div class="card">
							<s:iterator value="%{#request.other.get(#st.index)}">
								<s:a cssClass="btn btn-lg btn-primary delete"
									action="reserveactivity" namespace="/action">
									<s:param name="ac_id"
										value="%{#request.other.get(#st.index).ac_id}"></s:param>
									<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Reserve
								</s:a>
								<h4>
									Activity Name:
									<s:property value="%{#request.other.get(#st.index).ac_name}" />
								</h4>
								<h4>
									Location:
									<s:property
										value="%{#request.other.get(#st.index).place.location}" />
								</h4>
								<h4>
									Start:
									<s:property value="%{#request.other.get(#st.index).startDate}" />
								</h4>
								<h4>
									End:
									<s:property value="%{#request.other.get(#st.index).endDate}" />
								</h4>
							</s:iterator>
						</div>
					</s:iterator>
					<%
						}
					%>
				</s:div>
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<s:a cssClass="list-group-item" action="viewcard"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Membership &nbsp;Card
					</s:a>
					<s:a cssClass="list-group-item" action="viewprivacy"
						namespace="/action">
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