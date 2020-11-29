<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>AddBook-BookWorld</title>
<style>
.file {
  visibility: hidden;
  position: absolute;
}
</style>
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
    <h1 >BookWorld</h1>
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


<div class="card text-center container col-sm-6 mt-5">
  <div class="card-body">

<form action="AddBook" method="post" enctype="multipart/form-data">

<input class="form-control mb-2" type="text" placeholder="Book Name" name="book_name" required="required">

<input class="form-control mb-2" type="text" placeholder="Author" name="book_author" required="required">

<input class="form-control mb-2" type="text" placeholder="ISBN No" name="book_isbn" required="required">

<input class="form-control mb-2" type="text" placeholder="Price" name="book_price" required="required">

<div class="custom-file mb-2">
<input class="custom-file-input" id="customFile" type="file" name="book_image" required="required" />
 <label class="custom-file-label " for="customFile">Book Image</label>
</div>

<textarea class="form-control mb-2" rows="4" name="book_details" required="required"></textarea>

<input class="btn btn-success mt-1" type="submit" value="Upload">
</form>
</div>
</div>
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
</body>
</html>