<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.card1{
height:61.2vh;
}
</style>
<title>MyOrder-BookWorld</title>
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
      <li class="nav-item active">
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
      <li class="nav-item">
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
Statement stmt=null;
ResultSet rs=null;
%>

<%
int user_id=(int)session.getAttribute("user_id");
%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
String query = "select * from saveorder where user_id = '"+user_id+"'";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
%>
<div class="card1">
<% 
while(rs.next())
{
int order_id = rs.getInt("order_id");
String user_name = rs.getString("user_name");
String book_name = rs.getString("book_name");
String book_author = rs.getString("book_author");
String book_isbn = rs.getString("book_isbn");
String book_price  = rs.getString("book_price");
String contact = rs.getString("contact");
String address = rs.getString("address");
%>
<div class="card text-center bg-light col-sm-4 m-4" style="display: inline-block;">
	<div class="card-body ">
    	<div class="form-control mb-2">Name: <%=user_name%></div>
    	<div class="form-control mb-2">Book Name: <%=book_name%></div>
    	<div class="form-control mb-2">Author: <%=book_author%></div>
    	<div class="form-control mb-2">Isbn: <%=book_isbn%></div>
    	<div class="form-control mb-2">Price: <%=book_price%></div>
    	<div class="form-control mb-2">Contact: <%=contact%></div>
  		<div class="form-control mb-2">Address: <%=address%></div>
  			<a class="btn btn-danger" href='deleteorder.jsp?order_id=<%=order_id%>'>Delete</a>
	</div>
</div>		

<%
}
}catch(Exception e){e.printStackTrace();}
%>

</div>
<jsp:include page="footer.jsp" /> 

</body>
</html>