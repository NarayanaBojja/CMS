<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS | Resolve Complaint</title>
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
	position: static;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 1rem;
	text-align: center;
}
</style>
</head>
<body class="body1" >
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
		<header> <img src="images/logo.jpg" height="80px"
			width="80px" style="float: left">
		<h1 class="hg">Customer Complaint Management System
		</header>
		<nav class="navbar navbar-inverse">

		<div class="navbar-header">
			<a class="navbar-brand" href="Home.jsp"><glyphicon glyphicon-home></a>
		</div>
		<!--Left Align-->
		<ul class="nav navbar-nav">
			<li class="active"><a href="Home.jsp">HOME</a></li>
			<li><a href="About_Us.jsp">ABOUT US</a></li>
			<li><a href="Products.jsp">PRODUCTS</a></li>

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

		<form class="form-horizontal" role="form"
			action="./resolveComplaint" method="post">
			<span style="color:red">${message}</span>
			<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">Name :</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" value="${complaint.name}"  name="name1">
					<input type="hidden" name="token" value=${complaint.token} />
				</div>
			</div>
			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label"> Email : </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" value="${complaint.email}" name="cemail">
				</div>
			</div>
			<div class="form-group">
				<label for="Mobile" class="col-sm-2 control-label"> Subject:
				</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" value="${complaint.subject}"  name="subject1">
				</div>
			</div>

			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label">
					Department : </label>
				<div class="col-sm-10">
					<select name="dept">
						<option value="${complaint.type}">${complaint.type}</option>
						<!-- <option value="BOOKS">BOOKS</option>
						<option value="Finance">Finance</option> -->
					</select>
				</div>

			</div>
			<div class="form-group">
				<label for="Adress" class="col-sm-2 control-label">Customer
					Compliant :</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" cols="20"
						 placeholder="Address" name="address1">${complaint.message}</textarea>
				</div>
			</div>

			<div class="form-group">
				<label for="Adress" class="col-sm-2 control-label">Message :</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" cols="20"
						placeholder="Type your Message" name="message"></textarea>
				</div>
			</div>

			<div class="form-group">

				<div class="col-sm-10">
					<input class="form-control" type="submit" class="btn btn-primary" style=" margin-left: 195px; background-color: darkolivegreen; color: whitesmoke;"
						value="Update">
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