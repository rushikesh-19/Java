<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password-BookWorld</title>
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
	<div class="card text-center container col-sm-5 mt-5">
	<div class="card-body">
		<form action="ForgotPassword" method="POST">
		<h6 class="btn-primary mt-3 mb-3 p-1">If you are already logged in <strong>bookworld</strong> then submit correct answer of the following question
												you've enterd in registration time.<br>If not just <a href="index.jsp" style="color:#fff;">SignUp Here</a> </h6>
		<input class="form-control mb-2" type="email" name="email" placeholder="Enter your email" required="required">
		 <select class="form-control mb-2" name="security_question">
       <option>--Security Question--</option> 
       <option> What is your favorite movie?</option>
       <option>What is name of the your favorite cricket player?</option>
       <option>What was your childhood nickname?</option>
       </select>
       <input class="form-control mb-2" type="text" name="security_answer" placeholder="Enter Your Answer" required="required">
		<input class="btn btn-primary mt-3" type="submit" name="submit" value="Submit">
		</form>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>