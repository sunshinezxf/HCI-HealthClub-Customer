<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club index page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />

<!-- add by xia -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css"
	rel="stylesheet">

<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<%=request.getContextPath()%>/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<%=request.getContextPath()%>/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<%=request.getContextPath()%>/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=request.getContextPath()%>/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/img/favicon.png">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/scripts.js"></script>
<!-- end -->
<title>Health Club--index</title>
</head>
<body>
	<s:div cssClass="navbar navbar-inverse navbar-fixed-top">
		<s:div cssClass="container">
			<s:div cssClass="navbar-header">
				<a href="<s:url value="/index.jsp"></s:url>"> <img alt="logo"
					src="<s:url value="/material/HealthClub.png"></s:url>" />
				</a>
			</s:div>
			<s:div cssClass="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<s:url value="/index.jsp"></s:url>">Home</a></li>
					<li><a href="<s:url value="/member/register.jsp"></s:url>">Register</a></li>
					<li><a href="<s:url value="/member/login.jsp"></s:url>">Login</a></li>
				</ul>
			</s:div>
		</s:div>
	</s:div>

	<div class="container" style="position:fixed;left:10%;top:15%; ">
	<center><h1>Health Club</h1></center>
	<br><br><br><br><br><br><br>
		<div class="carousel slide" id="carousel-195940">
			<ol class="carousel-indicators">
				<li class="active" data-slide-to="0" data-target="#carousel-195940"></li>
				<li data-slide-to="1" data-target="#carousel-195940"></li>
				<li data-slide-to="2" data-target="#carousel-195940"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img alt="" src="<s:url value="/material/top/1.jpg"></s:url>">
					<div class="carousel-caption">
						<h4>第一张图</h4>
						<p>~~</p>
					</div>
				</div>
				<div class="item">
					<img alt="" src="<s:url value="/material/top/2.jpg"></s:url>">
					<div class="carousel-caption">
						<h4>第二张图</h4>
						<p>！！！</p>
					</div>
				</div>
				<div class="item">
					<img alt="" src="<s:url value="/material/top/3.jpg"></s:url>">
					<div class="carousel-caption">
						<h4>第三张图</h4>
						<p>%%%%</p>
					</div>
				</div>
			</div>
			<a data-slide="prev" href="#carousel-195940"
				class="left carousel-control">‹</a> <a data-slide="next"
				href="#carousel-195940" class="right carousel-control">›</a>
		</div>
	</div>
</html>