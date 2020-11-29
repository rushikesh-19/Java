<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile-BookWorld</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setHeader("Expires", "0"); // Proxis
		if (session.getAttribute("user_id") == null)
			response.sendRedirect("login.jsp");
	%>

	<nav class="navbar navbar-expand-lg navbar-light "
		style="background-color: #e3f2fd;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<h1>BookWorld</h1>
			<ul class="navbar-nav m-auto">
				<li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="myorder.jsp">My
						Order</a></li>
				<li class="nav-item "><a class="nav-link" href="contactus.jsp">Contactus</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="myprofile.jsp">My Profile</a></li>
				<li class="nav-item"><a class="btn btn-primary" href="Logout">Logout</a>
				</li>
			</ul>
		</div>
	</nav>

	<%!Connection con = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	ResultSet rs = null;%>

	<%
		int user_id = (int) session.getAttribute("user_id");
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook", "root", "rishimax");
			stmt = con.createStatement();
			String query = "select * from user where user_id='" + user_id + "'";
			rs = stmt.executeQuery(query);
	%>

	<div class="card text-center container col-sm-6 mt-5">
		<div class="card-body">
			<form action="" method="post">

				<%
					while (rs.next()) {
				%>

				<input type="hidden" name="user_id"
					value='<%=rs.getInt("user_id")%>' />

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">User Name:</label>
					<div class="col-sm-10">
						<input class="form-control mb-2" type="text" name="user_name"
							value='<%=rs.getString("user_name")%>' />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Email:</label>
					<div class="col-sm-10">
						<input class="form-control mb-2" type="text" name="email"
							value='<%=rs.getString("email")%>' />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Contact:</label>
					<div class="col-sm-10">
						<input class="form-control mb-2" type="text" name="contact"
							value='<%=rs.getString("contact")%>' />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Address:</label>
					<div class="col-sm-10">
						<input class="form-control mb-2" type="text" name="address"
							value='<%=rs.getString("address")%>' />
					</div>
				</div>

				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

				<input class="btn btn-success mt-2 mb-1" type="submit"
					value="Update Profile">
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>

<%
	String user_name = request.getParameter("user_name");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String address = request.getParameter("address");

	if (user_name != null && email != null && contact != null && address != null) {
		String sql = "update user set user_name=?,email=?,contact=?,address=? where user_id='" + user_id + "'";
		ps = con.prepareStatement(sql);
		ps.setString(1, user_name);
		ps.setString(2, email);
		ps.setString(3, contact);
		ps.setString(4, address);
		ps.executeUpdate();

		ps.close();
		con.close();
		response.sendRedirect("myprofile.jsp");
	}
%>
