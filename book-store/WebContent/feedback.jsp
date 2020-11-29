<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Feedback-WorldBook</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Expires","0"); // Proxis
if(session.getAttribute("user_id")==null) 
response.sendRedirect("login.jsp");
%>

<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <h1>BookWorld</h1>
    <ul class="navbar-nav m-auto">
      <li class="nav-item ">
      <a class="nav-link" href="dashboard.jsp">Home</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="myorder.jsp">My Order</a>
      </li>
      <li class="nav-item ">
      <a class="nav-link" href="contactus.jsp">Contactus</a>
      </li>
      <li class="nav-item active">
      <a class="nav-link" href="feedback.jsp">Feedback</a>
      </li>
       <li class="nav-item">
      <a class="nav-link" href="about.jsp">About</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="myprofile.jsp">My Profile</a>
      </li>
      <li class="nav-item">
      <a  class="btn btn-primary" href="Logout">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<div class="card text-center container col-sm-4 mt-5">
	<div class="card-body">
		<form action="Feedback" method="POST">
			<h1 class="card-title mb-4">Feedback</h1>
				<input class="form-control mb-2" type="text" name="user_name" placeholder="Enter your name" required="required">
				<input class="form-control mb-2" type="email" name="email" placeholder="Enter your email address" required="required">
				<input class="form-control mb-2" type="text" name="contact" placeholder="Enter your contact no" required="required">
				<textarea class="form-control" rows="3" name="message" placeholder="Enter your message"></textarea>
				<input class="btn btn-primary mt-3" type="submit" name="submit" value="Send">
		</form>
	</div>
</div>

<jsp:include page="footer.jsp" /> 

</body>
</html>