<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password-BookWorld</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
      <li class="nav-item">
      <a class="nav-link" href="dashboard.jsp">Home</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="myorder.jsp">My Order</a>
      </li>
      <li class="nav-item ">
      <a class="nav-link" href="contactus.jsp">Contactus</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="feedback.jsp">Feedback</a>
      </li>
       <li class="nav-item">
      <a class="nav-link" href="about.jsp">About</a>
      </li>
      <li class="nav-item active">
      <a class="nav-link" href="myprofile.jsp">My Profile</a>
      </li>
      <li class="nav-item">
      <a  class="btn btn-primary" href="Logout">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<%!
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement ps = null;
String name = null;
%>


<%
int user_id = (int) session.getAttribute("user_id");
%>

<% 
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
stmt = con.createStatement();
String query = "select user_name from user where user_id='"+user_id+"'";

rs = stmt.executeQuery(query);
while(rs.next())
{
name = rs.getString("user_name");
}

}catch(Exception e){System.out.println(e);}
%>

<form action="confirmpassword.jsp" method="post">
<div class="card text-center container col-sm-3 mt-5 mb-5">
	<div class="card-body">
			<h1 class="card-title">Hii <%=name%></h1>
			<div class="btn-danger"> ${currentpasswordmsg} </div>
			<div class="btn-danger"> ${newpasswordmsg} </div>
			<br>
			Current Password:<input class="form-control mb-3" type="password" name="currentpassword" required="required">
			New Password:<input class="form-control mb-3" type="password" name="newpassword" required="required">
			Confirm Password:<input class="form-control mb-3" type="password" name="confirmpassword" required="required">
			<input class="btn btn-primary mb-3" type="submit" name="submit" value="Change Password"><br>
	</div>
</div>
</form>
<jsp:include page="footer.jsp" /> 
</body>
</html>