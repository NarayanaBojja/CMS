<%-- 
    Document   : home
    Created on : Sep 22, 2017, 10:27:09 PM
    Author     : grace
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	<%
		String role = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie ck : cookies) {
				if (ck.getName().equalsIgnoreCase("role")) {
					role = ck.getValue();
					System.out.println(role);
				}
			}
		}
	%>
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
				<li ><a href="Home.jsp">HOME</a></li>
				<li><a href="About_Us.jsp">ABOUT US</a></li>
				<li class="active"><a href="Products.jsp">PRODUCTS</a></li>

				<%
					if (role.equals("USER")) {
				%>
				<li><a href="Complaint_Reg.jsp">REGISTER A COMPLAINT</a></li>

				<%
					}
				%>
				<%
					if (role.equals("ADMIN")) {
				%>
				<li><a href="./ac">COMPLAINTS</a></li>

				<%
					}
				%>

				<%
					if (role.equals("STAFF")) {
				%>

				<li><a href="./staffComplaints">COMPLAINTS</a></li>
				<%
					}
				%>



				<li><a href="Contact.jsp">CONTACT US</a></li>

			</ul>

			<div style="position: absolute; right: 20px; top: 2px">
				<p class="navbar-text">
					<a href="Login.jsp" class="navbar-link" onclick="deleteAllCookies()">Logout</a>
				</p>
			</div>

		</nav>

		<div class="row">
			<div class="col-sm-4 col-sm-4 col-sm-4">
				<img src="images/book1.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book2.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book3.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-sm-4 col-sm-4">
				<img src="images/book4.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book5.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book6.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-4 col-sm-4 col-sm-4">
				<img src="images/book7.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book8.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book9.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-sm-4 col-sm-4">
				<img src="images/book10.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book11.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100"><img
					src="images/book12.jpg" class="image-responsive"
					style="border: 2px solid red;" height="100px" width="100">
			</div>
		</div>
	</div>

	<footer class="f1">
		<p style="color: white; text-align: center">&copy All copy rights
			reserved</p>
	</footer>
</body>
</html>
