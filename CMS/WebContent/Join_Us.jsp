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
<link rel="stylesheet" href="./css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="./js/register.js"></script>
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

.navbar li a:hover {
	background-color: black;
	color: yellow;
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




		<form class="form-horizontal" role="form" action="./register" onsubmit="return registerUser();"
			method="post" style="padding-top: 10px;">
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
			<h4 style="padding-top: 5px;">Register Here</h4>
			<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">Name :</label>
				<div class="col-sm-10">
					<input class="form-control" placeholder="Name" type="text" id="name"
						name="name">
				</div>
			</div>
			<div class="form-group">
				<label for="Mobile" class="col-sm-2 control-label"> Mobile :
				</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" placeholder="Mobile" id="mobile"
						name="mob">
				</div>
			</div>
			<div class="form-group">
				<label for="Adress" class="col-sm-2 control-label">Address :</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" placeholder="Address" id="address"
						name="add">
				</div>
			</div>
			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label"> Email : </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" placeholder="Email" id="email"
						name="email">
				</div>
			</div>

			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label"> Password
					: </label>
				<div class="col-sm-10">
					<input class="form-control" type="password" placeholder="Password" id="password"
						name="pass">
				</div>
			</div>

			<div class="form-group">
				<label for="Email" class="col-sm-2 control-label"> Role : </label>
				<div class="col-sm-10">
					<select name="role" id="roleValue">
						<option value="">Select</option>
						<option value="USER">USER</option>
						<option value="STAFF">STAFF</option>
						<option value="ADMIN">ADMIN</option>
					</select>
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

				<div class="col-sm-10">
					<input class="form-control" type="submit"
						style="margin-left: 195px; background-color: darkolivegreen; color: whitesmoke;" class="btn btn-primary"
						value="Register">
				</div>
			</div>
			<div class="form-group" style="margin-left: 525px;">

				<div class="col-sm-10">
					Already Registered . Click here to <a href="Login.jsp">Login</a>
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
