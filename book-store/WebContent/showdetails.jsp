<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>ShowBookDetails-BookWorld</title>

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
PreparedStatement ps=null;
ResultSet rs=null;
%>

<%
String book_id = request.getParameter("book_id");
%>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
stmt = con.createStatement();
String query = "select * from book where book_id='"+book_id+"'";
rs = stmt.executeQuery(query);
while(rs.next())
{
%>

<div class="card container mt-5" style="max-width:900px;">
  <div class="row no-gutters">
    <div class="col-md-4 ">
      <img src="bookImages/<%=rs.getString("book_image")%>" class="card-img" alt="...">
    </div>
    <div class="col-md-6">
      <div class="card-body">
        <h5 class="text-primary font-weight-bold"><%=rs.getString("book_name")%></h5>
        <h6 class="text-secondary">Author: <%=rs.getString("book_author")%></h6>
        <p class="card-text"><%=rs.getString("book_details")%></p>
        <p class="text-danger">Price:&#8377; <%=rs.getString("book_price") %></p>
    <a class="btn btn-primary m-auto" href="saveorder.jsp?book_name=<%=rs.getString("book_name")%>&book_author=<%=rs.getString("book_author")%>
    												&book_isbn=<%=rs.getString("book_isbn")%>&book_price=<%=rs.getString("book_price")%>">Buy Now</a>
     </div>
   </div>
  </div>
</div>

<%
}
}catch(Exception e){e.printStackTrace();}
%>

<br>

<jsp:include page="footer.jsp" /> 

</body>
</html>