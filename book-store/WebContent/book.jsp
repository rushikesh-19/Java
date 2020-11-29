<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>AdminDashboard-BookWorld</title>
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
      <li class="nav-item active">
           <a class="nav-link" href="book.jsp">Book Details</a>
      </li>
      <li class="nav-item">
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

<a href="addbook.jsp" class="btn btn-outline-success m-2">Add New Book</a> 

<%!
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
%>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
stmt = con.createStatement();
String query = "select * from book";
rs = stmt.executeQuery(query);
%>

<table  class="table table-bordered m-auto" style="width:90%;">
<thead class="bg-light">
  <tr>
    <th  scope="col">Book Id</th>
    <th scope="col">Book Name</th>
    <th scope="col">Author</th>
    <th scope="col">ISBN No</th>
    <th scope="col">Price</th>
    <th scope="col">Image</th>
    <th scope="col">Action</th>
  </tr>
</thead>

<%
while(rs.next())
{
%>
<tbody>
  <tr>
  	<th scope="row"><%=rs.getInt("book_id") %></th>
    <td><%=rs.getString("book_name") %></td>
    <td><%=rs.getString("book_author") %></td>
    <td><%=rs.getString("book_isbn") %></td>
    <td><%=rs.getString("book_price") %></td>
    <td><img src="bookImages/<%=rs.getString("book_image")%>" height="50px"  width="50px"/></td>
    <td>
  	<a class="btn btn-info mr-3" href='editbook.jsp?book_id=<%=rs.getInt("book_id")%>'>Edit</a>
  	<a class="btn btn-danger" href='deletebook.jsp?book_id=<%=rs.getInt("book_id") %>'>Delete</a>
 	</td>
  </tr>
</tbody>

<%
}
stmt.close();
con.close();
}catch(Exception e){System.out.println(e);}
%>

</table>
</body>
</html>