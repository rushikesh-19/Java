<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<style>
.file {
  visibility: hidden;
  position: absolute;
}
</style>
<title>EditBook-BookWorld</title>
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
%>

<div class="card text-center container col-sm-6 mt-5">
	<div class="card-body">
		<form action="" method="post">

<%
while(rs.next())
{
%>

	<input type="hidden" name="book_id" value='<%=rs.getInt("book_id") %>' />

<div class="form-group row">
	<label class="col-sm-2 col-form-label">Name:</label>
		<div class="col-sm-10">
			<input class="form-control mb-2" type="text" name="book_name" value='<%=rs.getString("book_name")%>' />
		</div>
</div>

<div class="form-group row">
	<label class="col-sm-2 col-form-label">Author:</label>
		<div class="col-sm-10">
			<input class="form-control mb-2" type="text" name="book_author"  value='<%=rs.getString("book_author")%>' />
		</div>
</div>

<div class="form-group row">
	<label class="col-sm-2 col-form-label">ISBN:</label>
		<div class="col-sm-10">
			<input class="form-control mb-2" type="text" name="book_isbn"  value='<%=rs.getString("book_isbn")%>' />
		</div>
</div>

<div class="form-group row">
	<label class="col-sm-2 col-form-label">Price:</label>
		<div class="col-sm-10">
			<input class="form-control mb-2" type="text" name="book_price"  value='<%=rs.getString("book_price")%>' />
		</div>
</div>

<div class="custom-file mb-2">
	<input class="custom-file-input" id="customFile" type="file" name="book_image" value='<%=rs.getString("book_image")%>' />
 		<label class="custom-file-label " for="customFile">Book Image</label>
</div>

<div class="form-group row">
	<label class="col-sm-2 col-form-label">Details:</label>
		<div class="col-sm-10">
			<textarea class="form-control mb-2" rows="4" name="book_details"><%=rs.getString("book_details")%></textarea>
		</div>
</div>

<%
}
}catch(Exception e){e.printStackTrace();}
%>

<input class="btn btn-success mt-2" type="submit" value="Update">

		</form>
	</div>
</div>
</body>

<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

</html>

<%
		book_id = request.getParameter("book_id");
		String book_name = request.getParameter("book_name");
		String book_author = request.getParameter("book_author");
		String book_isbn = request.getParameter("book_isbn");
		String book_price = request.getParameter("book_price");
		String book_image = request.getParameter("book_image");
		String book_details = request.getParameter("book_details");
	
		if(book_id!=null && book_name!=null && book_author!=null && book_isbn!=null && book_price!=null && book_image!=null && book_details!=null)
		{
			String sql = "update book set book_name=?,book_author=?,book_isbn=?,book_price=?,book_image=?,book_details=? where book_id='"+book_id+"'";
			ps = con.prepareStatement(sql);
			ps.setString(1,book_name);
			ps.setString(2,book_author);
			ps.setString(3,book_isbn);
			ps.setString(4,book_price);
			ps.setString(5,book_image);
			ps.setString(6,book_details);
			ps.executeUpdate();
			
			ps.close();
			con.close();
			response.sendRedirect("book.jsp");
		}
%>
