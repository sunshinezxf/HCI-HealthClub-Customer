<%@page import="model.card.CardType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.VIP"%>
<%@page import="model.card.VIPCard"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<s:url value="/member/index.jsp"></s:url>"><img
					alt="logo" src="<s:url value="/material/HealthClub.png"></s:url>"></a>
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
					<p>You can manage all your membership cards or apply for a new
						one.</p>
				</div>
				<div class="layout module">
					<%
						ArrayList<VIPCard> list = vip.getCardList();
						if (list == null) {
					%>
					<h3><%=vip.getName()%>, you don't have any vip card at the
						moment.
					</h3>
					<%
						} else {
							int size = list.size();
					%>
					<h3>
						You have
						<%=size%>
						<%=(size == 1) ? "card" : "cards"%>.
					</h3>
					<s:iterator value="vip.cardList" status="st">
						<div class="card">
							<s:iterator value="vip.cardList.get(#st.index)">
								<s:a cssClass="btn btn-lg btn-primary delete"
									action="deletecard" namespace="/action">
									<s:param name="c_id" value="vip.cardList.get(#st.index).c_id"></s:param>Delete
								</s:a>
								<h4>
									Card No:
									<s:property value="vip.cardList.get(#st.index).code" />
								</h4>
								<h4>
									Card Type:
									<s:property value="vip.cardList.get(#st.index).type" />
								</h4>
								<h4>
									Activated:
									<s:if test="vip.cardList.get(#st.index).activated==true">
										Already Activated
									</s:if>
									<s:else>
										Not Yet Activated<s:a cssClass="activate"
											action="requestactivate" namespace="/action">
											<s:param name="c_id" value="vip.cardList.get(#st.index).c_id"></s:param>
											<s:param name="v_id" value="vip.v_id"></s:param>activate</s:a>
									</s:else>
								</h4>
								<h4>
									Payed:
									<s:if test="vip.cardList.get(#st.index).payed==true">
										Already Payed This Month
									</s:if>
									<s:else>
										Not Yet Payed<s:a cssClass="activate" action="requestpay"
											namespace="/action">
											<s:param name="c_id" value="vip.cardList.get(#st.index).c_id"></s:param>
											<s:param name="v_id" value="vip.v_id"></s:param>pay</s:a>
									</s:else>
								</h4>
								<h4>
									Activate Price: $
									<s:property value="vip.cardList.get(#st.index).activatePrice" />
								</h4>
								<h4>
									Rent: $
									<s:property value="vip.cardList.get(#st.index).rent" />
								</h4>
							</s:iterator>
						</div>
					</s:iterator>
					<%
						}
					%>
					<s:a cssClass="btn btn-lg btn-primary" action="applysg"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Apply SG Card</s:a>
					<s:a cssClass="btn btn-lg btn-primary" action="applyhm"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Apply HM Card</s:a>
				</div>
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
					<s:a cssClass="list-group-item" action="requestwithdraw"
						namespace="/action">
						<s:param name="v_id" value="%{#session.vip.v_id}"></s:param>Withdraw &nbsp;VIP</s:a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
