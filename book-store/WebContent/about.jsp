<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>About-BookWorld</title>
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
<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd; ">
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
      <li class="nav-item">
      <a class="nav-link" href="contactus.jsp">Contactus</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="feedback.jsp">Feedback</a>
      </li>
       <li class="nav-item active">
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

<div class="text-center">
<img class="rounded-circle mt-5" src="images/myimage.jpg" alt="" style="width:400px;">
<h2 class="mt-2">Rushikesh Gadekar</h2>
</div>

<div class="container mt-4">
<p class="font-weight-normal">BOOK/SHOP is a design-minded, multi-disciplinary brand offering objects, events, and experiences related to books and reading.
We are based in the San Francisco Bay Area and New York City. </p>

<br><br><strong>OUR PHILOSOPHY-</strong><br><br>
<p class="font-weight-normal">Some people like to read on a screen. Other people need the variety and artistry, the sight, smell, and feel of actual books.They love seeing them on their shelves; they love having shelves for them.

They love taking them along when they leave the house, and stacking them by their bedsides. They love finding old letters and bookmarks in them. They like remembering where they bought them or who they received them from.

They want to read in a way that offers a rich experience, more than the words only: the full offering of a book. They are particular about covers, they want to surround themselves with the poetry of good design.

They can't pass a bookstore without going in and getting something, they keep a library card and use it.

They are allergic to cheap bestsellers; they delight in the out-of-the-way and the rare, the well-made and the hard-to-accomplish. They take care of their books; they  know a book is only theirs until it passes on to someone else. They are good stewards of a timeless object.

These are the people we're working for.</p>
<p class="ml-5">This website are developed and maintained by Rushikesh Gadekar.</p>
</div>
 <jsp:include page="footer.jsp" /> 
</body>
</html>