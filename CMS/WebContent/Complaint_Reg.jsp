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
<script type="text/javascript" src="./js/complaintRegister.js"></script>
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
				<li><a href="Products.jsp">PRODUCTS</a></li>

				<%
					if (role.equals("USER")) {
				%>
				<li class="active"><a href="Complaint_Reg.jsp">REGISTER A COMPLAINT</a></li>

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

		<!--  <form class="form-horizontal" role="form" action="complaint_register" method="post-->
		<form class="form-horizontal" role="form"
			onsubmit="return complaintRegister();" action="./complaint_register"
			method="post">
			<span style="color:red">${message}</span>
			<div id="div_loginModelSuccessMessage" class="isa_success_modal"
				style="display: none">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<span id="loginModelSuccessMessage"></span>
			</div>
			<div id="div_loginModelErrorMessage" class="isa_error_modal"
				style="display: none;  margin-left: 380px; margin-right: 400px; color: red;">
			
				<span id="loginModelErrorMessage"
					style="background-color: aliceblue;"></span>
			</div>
			<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">Name :</label>
				<div class="col-sm-10">
					<input class="form-control" placeholder="Name" type="text"
						id="name" name="name1">
				</div>
			</div>
			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label"> Email : </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" placeholder="Email"
						id="email" name="email1">
				</div>
			</div>
			<div class="form-group">
				<label for="Mobile" class="col-sm-2 control-label"> Subject:
				</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" placeholder="Subject"
						id="subject" name="subject1">
				</div>
			</div>

			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label">
					Department : </label>
				<div class="col-sm-10">
					<select name="dept" id="department">
						<option value="">Select</option>
						<option value="BOOKS">BOOKS</option>
						<option value="Finance">Finance</option>
					</select>
				</div>

			</div>
			<div class="form-group">
				<label for="Adress" class="col-sm-2 control-label">Message :</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" cols="20"
						placeholder="Address" name="address1" id="message">
 </textarea>
				</div>
			</div>

			<div class="form-group">
		
				<div class="col-sm-10">
					<input class="form-control" type="submit" class="btn btn-primary" style="margin-left: 195px;background-color: darkolivegreen; color: whitesmoke;"
						value="Register">
				</div>
			</div>

		</form>





	</div>



	<footer class="f1">
		<p style="color: white; text-align: center">&copy All copy rights
			reserved</p>
	</footer>


</body>
</html>
