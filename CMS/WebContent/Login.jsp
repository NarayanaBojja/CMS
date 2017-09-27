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
<script type="text/javascript" src="./js/login.js"></script>
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
}

.navbar li a {
	color: black;
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

		<form class="form-horizontal" role="form" action="./login"
			style="margin-top: 120px; text-align: center;" method="post"
			onsubmit="return loginUser();">
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
			<h4>Login Here</h4>
			<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">Email :</label>
				<div class="col-sm-10">
					<input class="form-control" placeholder="Enter Email" type="text"
						id="userName" name="email">
				</div>
			</div>
			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label"> Password
					: </label>
				<div class="col-sm-10">
					<input class="form-control" type="password" placeholder="Password"
						id="passWord" name="password">
				</div>
			</div>
			<div class="form-group">

				<div class="col-sm-10">
					<input class="form-control"
						style="margin-left: 195px; background-color: darkolivegreen; color: whitesmoke;"
						type="submit" class="btn btn-primary" value="Submit">
				</div>
			</div>

			<div class="form-group">

				<div class="col-sm-10">
					Not Registered . Click here to <a href="Join_Us.jsp">Sign-up</a>
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
