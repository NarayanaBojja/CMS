<%-- 
    Document   : home
    Created on : Sep 22, 2017, 10:27:09 PM
    Author     : grace
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Complaint Management portal</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./js/logout.js"></script>
<style>
.body1 {
	background-image: url("images/bg2.jpg");
}

header {
	border: 2px solid green;
	height: 100px;
	background-color: darkkhaki;
}

.hg {
	padding-left: 100px;
	color: firebrick;
}

.navbar {
	background-color: khaki;
	color: black;
}

.navbar li {
	
}

.image-responsive {
	border: 2px solid red;
}

.f1 {
	background-image: url("images/b3.jpg");
	height: 10%;
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 1rem;
	text-align: center;
}
</style>
</head>
<body class="body1">


	<div class="container">
		<header>
			<img src="images/logo.jpg" height="80px" width="80px"
				style="float: left">
			<h1 class="hg">Customer Complaint Management System
		</header>
		<nav class="navbar navbar-inverse">

			<div class="navbar-header">
				<a class="navbar-brand" href="Home.jsp"><glyphicon
						glyphicon-home></a>
			</div>
			<!--Left Align-->
			<ul class="nav navbar-nav">
				<li class="active"><a href="Home.jsp">HOME</a></li>
				<li><a href="About_Us.jsp">ABOUT US</a></li>
				<li><a href="Products.jsp">PRODUCTS</a></li>

				<c:if test="${sessionScope.user.role == 'USER'}">
					<li><a href="Complaint_Reg.jsp">REGISTER A COMPLAINT</a></li>
				</c:if>

				<c:if test="${sessionScope.user.role == 'ADMIN'}">

					<li><a href="./ac">COMPLAINTS</a></li>

				</c:if>


				<c:if test="${sessionScope.user.role == 'STAFF'}">

					<li><a href="./staffComplaints">COMPLAINTS</a></li>

				</c:if>

				<li><a href="Contact.jsp">CONTACT US</a></li>

			</ul>

			<c:if test="${sessionScope.user.name != null}">

				<div style="position: absolute; right: 20px; top: 2px">
					<p class="navbar-text">
						<a href="Login.jsp" class="navbar-link" onclick="deleteAllCookies()">Logout</a>
					</p>
				</div>

			</c:if>


		</nav>
		<div class="carousel" id="slider1" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#slider1" data-slide-to="0" class="active"></li>
				<li data-target="#slider1" data-slide-to="1"></li>
				<li data-target="#slider1" data-slide-to="2"></li>
				<li data-target="#slider1" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/manage.png" alt="customer" style="height: 200px">
					<div class="carousel-caption">
						<h1>A satisfied customer is the best business strategy of a ~
							Michael LeBoeuf, Business Author</h1>
					</div>
				</div>
				<div class="item">
					<img src="images/manage3.jpg" alt="granite stone"
						style="height: 200px">
					<div class="carousel-caption">
						<h1>"Customer service is the new marketing." ~ Derek Sivers,
							Founder CD Baby</h1>
					</div>
				</div>
				<div class="item">
					<img src="images/book3.jpg" alt="beloved customer"
						style="height: 200px">

					<div class="carousel-caption">
						<h1>"The customer’s perception is your reality." ~ Kate
							Zabriskie</h1>
					</div>
				</div>
				<div class="item">
					<img src="images/manage1.jpg" alt="Marble stone"
						style="height: 200px">
					<div class="carousel-caption">
						<h1>"Make a customer, not a sale." ~ Katherine Barchetti</h1>
					</div>
				</div>

				<a class=" right carousel-control" href="#slider1" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a> <a class=" left carousel-control" href="#slider1" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a>
			</div>
		</div>

	</div>


	<footer class="f1">
		<p style="color: white; text-align: center">&copy All copy rights
			reserved</p>
	</footer>
</body>
</html>
