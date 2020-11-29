<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>ViewUser-BookWorld</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1"><meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Expires","0"); // Proxis
if(session.getAttribute("adminid")==null) 
response.sendRedirect("adminlogin.jsp");
%>

<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <h1>BookWorld</h1>
    <ul class="navbar-nav ml-2 mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
           <a class="nav-link" href="book.jsp">Book Details</a>
      </li>
      <li class="nav-item active">
           <a class="nav-link" href="viewuser.jsp">User Details</a>
      </li>
      <li class="nav-item">
           <a class="nav-link" href="vieworder.jsp">View Order</a>
      </li>
      <li class="nav-item">
           <a class="nav-link" href="viewcontactus.jsp">Customer Quries</a>
      </li>
      <li class="nav-item">
           <a class="nav-link" href="viewfeedback.jsp">Feedback</a>
      </li>
     <li class="nav-item">
           <a class="btn btn-primary" href="AdminLogout">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<%!
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
%>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
	stmt = con.createStatement();
	String query = "select * from user";
	rs = stmt.executeQuery(query); 
%>

<div class="mt-5">
	<table class="table table-bordered m-auto" style="width: 95%;">
  		<thead class="bg-light">
  			<tr>
    			<th scope="col">User Id</th>
    			<th scope="col">User Name</th>
    			<th scope="col">Email</th>
    			<th scope="col">Password</th>
    			<th scope="col">Contact</th>
    			<th scope="col">Address</th>
    			<th scope="col">Action</th>
			</tr>
		</thead>

<%
while(rs.next())
{
%>

<tbody>
	<tr>
    	<th scope="row"><%=rs.getString("user_id") %></th>
    	<td><%=rs.getString("user_name") %></td>
    	<td><%=rs.getString("email") %></td>
		<td><%=rs.getString("password") %></td>    
		<td><%=rs.getString("contact") %></td>
		<td><%=rs.getString("address") %></td>
  		<td><a class="btn btn-danger" href='deleteuser.jsp?user_id=<%=rs.getString("user_id")%>'>Delete</a></td>
	</tr>
</tbody>

<%
}
}catch(Exception e){System.out.println(e);}
%>

</table>
</div>
</body>
</html>