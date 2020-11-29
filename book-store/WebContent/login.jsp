<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Login-BookWorld</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <h1>BookWorld</h1>
    <ul class="navbar-nav ml-2 mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
           <a class="nav-link" href="index.jsp">Home</a>
      </li>
    </ul>
  </div>
</nav>

<div class="card text-center container col-sm-3 mt-5 mb-5">
	<div class="card-body">
		<form action="LoginRegister" method="POST">
			
			<h1 class="card-title">Login</h1>
			
			<div class="btn-danger">${msg}</div>
			<br>
			<input class="form-control mb-3" type="email" name="email" placeholder="Email address" required="required">
			<input class="form-control mb-2" type="password" name="password" placeholder="Password" required="required">
			<input class="btn btn-primary mb-2" type="submit" name="submit" value="login"><br>
			<a class="btn btn-success mb-2 " href="index.jsp">Not on Pinrest yet? Sign Up</a><br>
			<a href="forgotpassword.jsp">Forgot Password?</a>
		</form>
	</div>
</div>

<br>
<jsp:include page="footer.jsp" />

</body>
</html>