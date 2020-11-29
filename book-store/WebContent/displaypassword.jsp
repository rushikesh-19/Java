<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Password-BookWorld</title>
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
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Expires","0"); // Proxis
if(session.getAttribute("user_id")==null) 
response.sendRedirect("login.jsp");
%>

<%!
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String user_name = null;
String password = null;
%>

<%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
stmt = con.createStatement();

String user_id =(String) session.getAttribute("user_id");
String query = "select user_name,password from user where user_id ='"+user_id+"' ";

rs = stmt.executeQuery(query);

while(rs.next())
{
	user_name = rs.getString("user_name");
	password = rs.getString("password");
}

%>
<br><br>
<div class="card text-center container col-sm-5 mt-5 mb-5 bg-success">
	<div class="card-body">
<h1 style="color: #fff;">Hello <%= user_name %></h1>
<h2 style="color: #fff;">Your password is <%= password %></h2>
</div>
</div>
<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp" />
</body>
</html>