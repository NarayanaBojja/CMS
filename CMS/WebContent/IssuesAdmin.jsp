<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS | Complaints</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./js/logout.js"></script>
<script>
	$(document).ready(function() {
		$('#issuesList').DataTable();

	});
</script>

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
			<li ><a href="Home.jsp">HOME</a></li>
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
			<li class="active"><a href="./ac">COMPLAINTS</a></li>

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
		<h4 style="text-align: center;">List of Complaints</h4>
		<table id="issuesList"
			class="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline display"
			cellspacing="0" width="95%">
			<thead>
				<tr>
					<!-- <th >CheckListId</th> -->
					<th>Name</th>
					<th>Email</th>

					<th>Message</th>

					<th>Forward To Staff</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="complaint" items="${complaintList}"
					varStatus="status">

					<tr>
						<td>${complaint.name}</td>
						<td>${complaint.email}</td>
						<td>${complaint.message}</td>
						<td>

							<form action="./updateComplaint">
								<input type="hidden" name="token" value=${complaint.token } /> <input
									title="Forward To Staff" type="submit"
									style="background-color: #06960a; border-color: #06960a;"
									value="Click">
							</form>

						</td>
					</tr>


				</c:forEach>

			</tbody>


		</table>

	</div>

	<footer class="f1">
	<p style="color: white; text-align: center">&copy All copy rights
		reserved</p>
	</footer>
</body>
</html>