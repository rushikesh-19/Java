<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin_Login-BookWorld</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<br><br>
<div class="card text-center container col-sm-3 mt-5 mb-5">
  <div class="card-body">
		<form action="AdminLogin" method="post">
			<h1 class="card-title">Admin Login</h1>
			<div class="btn-danger">${msg}</div>
			<br>
			<input class="form-control mb-2" type="text" name="username" placeholder="Username" required="required">
			<input class="form-control mb-3" type="password" name="password" placeholder="Password" required="required">
			<input class="btn btn-primary mb-3" type="submit" name="submit" value="login"><br>
		</form>
	</div>
</div>
</body>
</html>