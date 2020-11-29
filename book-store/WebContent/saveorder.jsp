<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>SaveOrder-BookWorld</title>
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
      <li class="nav-item ">
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

String book_name = request.getParameter("book_name");
String book_isbn = request.getParameter("book_isbn");
String book_price = request.getParameter("book_price");
String book_author = request.getParameter("book_author");
%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
stmt = con.createStatement();
String query = "select * from user where user_id = '"+user_id+"'";
rs = stmt.executeQuery(query);
%>
<div class="card text-center container col-sm-5 mt-5">
<div class="card-body">
<div class="form-control mb-2">Book Name: <%=book_name%></div>
<div class="form-control mb-2">Author: <%=book_author%></div>
<div class="form-control mb-2">ISBN No: <%=book_isbn%></div>
<div class="form-control mb-2">Price: <%=book_price%></div>
<% 
while(rs.next())
{

String user_name = rs.getString("user_name");
String contact = rs.getString("contact");
String address = rs.getString("address");

%>

    <div class="form-control mb-2">Name: <%=user_name%></div>
    <div class="form-control mb-2">Contact: <%=contact%></div>
  	<div class="form-control mb-2">Address: <%=address%></div>
  	<a class="btn btn-primary mb-2" href="confirmorder.jsp?user_id=<%=user_id%>&user_name=<%=user_name%>&book_name=<%=book_name%>&book_author=<%=book_author%>
  												&book_isbn=<%=book_isbn%>&book_price=<%=book_price%>&contact=<%=contact%>&address=<%=address%>">Confirm Order</a>

<%
}
}catch(Exception e){e.printStackTrace();}
%>

</div>
</div>

<jsp:include page="footer.jsp" /> 

</body>
</html>