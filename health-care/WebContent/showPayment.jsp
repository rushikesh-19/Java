<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<head>
<title>Cliniva HealthCare</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/css-hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css"
	href="vendor/select-2/select2.min.css">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link rel="stylesheet" type="text/css" href="css/flashy.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/pogo-slider.min.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/responsiveslides.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/timeline.css">
<link rel="stylesheet" type="text/css" href="css/util.css">

<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.css">

<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.css">
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
</head>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setHeader("Expires", "0"); // Proxis
	if (session.getAttribute("adminid") == null)
		response.sendRedirect("adminLogin.jsp");
%>
<div class="main-top">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="wel-nots">
					<p>
						<b>Welcome to Cliniva</b>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<header class="top-header">
	<nav class="navbar header-nav navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="adminDashboard.jsp"> 
			<img src="images/logo_cliniva.jpg" alt="image">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
				<span></span> 
				<span></span> 
				<span></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
				<ul class="navbar-nav">
					<li><a class="nav-link" href="adminDashboard.jsp">Home</a></li>
					<li><a class="nav-link" href="showAllPatients.jsp">Patients</a></li>
					<li><a class="nav-link" href="showAllDoctors.jsp">Doctors</a></li>
					<li><a class="nav-link" href="showPatientPaymentRecords.jsp">Payments</a></li>
					<li><a class="nav-link" href="showPatientReportRecords.jsp">Reports</a></li>
					<li><a class="nav-link" href="AdminLogout">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<body id="home" data-spy="scroll">
	<%!Connection con = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	ResultSet rs = null;%>
		<%
			try {
				String patientId = request.getParameter("patientId");
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
				stmt = con.createStatement();
				String showPatientPayment = "select payment.paymentId,payment.paymentStatus,payment.paymentReceipt,payment.paymentDate,patient.patientId,patient.patientName from payment join patient where payment.patientId = " + patientId + " and patient.patientId = " + patientId ;
				rs = stmt.executeQuery(showPatientPayment);
		
				if(rs.next() == false) {
		%>
		<div class="col-md-6 m-auto">
			<div class="card">
				<div class="card-header text-center">
					<h1>No Payment Records Available</h1>
				</div>
				<div class="card-body">
					<form action="UploadPaymentReceipt" method="post" enctype="multipart/form-data">
						<input type="hidden" name="patientId" value='<%= patientId %>' />
						<input type="file" name="paymentImage" required style="cursor: pointer;" /> 
						<input type="submit" name="submit" class="btn btn-secondary" value="Send New Bill" style="cursor: pointer;" />
					</form>
				</div>
			</div>
		</div>
		<%	} else { %>
		<div class="col-md-6 m-auto">
			<div class="card">
				<div class="card-body">
					<form action="UploadPaymentReceipt" method="post" enctype="multipart/form-data">
						<input type="hidden" name="patientId" value='<%=patientId%>' />
						<input type="file" name="paymentImage" required style="cursor: pointer;" /> 
						<input type="submit" name="submit" class="btn btn-secondary" value="Send New Bill" style="cursor: pointer;" />
					</form>
				</div>
			</div>
		</div>
		<table class="table table-bordered  border-dark table-striped mb-3 mt-2 text-center">
		<tr>
			<th style="text-align: center;">Payment Id</th>
			<th style="text-align: center;">Patient Name</th>
			<th style="text-align: center;">Payment Status</th>
			<th style="text-align: center;">Update Bill</th>
			<th style="text-align: center;">View Bill</th>
			<th style="text-align: center;">Payment Date & Time</th>
			<th style="text-align: center;">Action</th>
		</tr>
		<%	
			}
			rs.close(); 
			stmt.close();
			stmt = con.createStatement();
			rs = stmt.executeQuery(showPatientPayment);
			while (rs.next()) {
		%>
		<tr>
			<th>	<%=rs.getInt("paymentId")%>	</th>
			<th>	<%=rs.getString("patientName")%> </th>
			<td>
				<%
					if (!rs.getBoolean("paymentStatus")) {
				%>
				<div class="text-danger"> Payment Pending </div> 
				<%
 				} else { 
 				%>
				<div class="text-success"> Payment Paid </div> 
				<%
 					}
 				%>
			</td>
			<td>
				<%
					if (!rs.getBoolean("paymentStatus")) {
				%>
				<form action="UploadPaymentReceipt" method="post" enctype="multipart/form-data">
					<input type="hidden" name="patientId" value='<%=rs.getString("patientId")%>'> 
					<input type="hidden" name="paymentId" value='<%=rs.getString("paymentId")%>'> 
					<input type="file" name="paymentImage" required style="cursor: pointer;" /> 
					<input type="submit" name="submit" class="btn btn-secondary" value="Update Bill" style="cursor: pointer;" />
				</form> 
				<% } else { %>
 						<span class="text-info">Update Option Not Available</span> 
 				<%	}	%>
			</td>
			<td>
				<a class="text-primary" href='paymentImages/<%=rs.getString("paymentReceipt")%>' > 
					<b style="font-size: 20px;"> View Bill </b>
				</a>
			</td>
			<td>
				<%= rs.getTimestamp("paymentDate") %>
			</td>
			<td>
				<%
					if (rs.getBoolean("paymentStatus")) {
				%>
				<form action="PaymentSetting" method="post">
					<input type="hidden" name="paymentId" value='<%=rs.getInt("paymentId")%>' /> 
					<input type="hidden" name="patientId" value='<%=rs.getInt("patientId")%>' />
					<input type="submit" name="submit" value="Unpaid" class="btn btn-warning" style="cursor: pointer;" />
					<input type="submit" name="submit" value="Delete" class="btn btn-danger" style="cursor: pointer;">
				</form> 
				<%
 					} else {
 				%>
				<form action="PaymentSetting" method="post">
					<input type="hidden" name="paymentId" value='<%=rs.getInt("paymentId")%>' />
					<input type="hidden" name="patientId" value='<%=rs.getInt("patientId")%>' /> 
					<input type="submit" name="submit" value="Paid" class="btn btn-primary" style="cursor: pointer;" /> 
					<input type="submit" name="submit" value="Delete" class="btn btn-danger" style="cursor: pointer;">
				</form> 
				<%
 					}
 				%>
			</td>
		</tr>
		<%
			} rs.close();
			  stmt.close();
			  con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
<a href="#" id="scroll-to-top" class="new-btn-d br-2"><i class="fa fa-angle-up"></i></a>
<!-- ALL JS FILES -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/bootstrap/js/popper.min.js"></script>
<script src="vendor/animsition/js/animsition.min.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.pogo-slider.min.js"></script>
<script src="js/slider-index.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/TweenMax.min.js"></script>
<script src="js/main.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/form-validator.min.js"></script>
<script src="js/contact-form-script.js"></script>
<script src="js/isotope.min.js"></script>
<script src="js/images-loded.min.js"></script>
<script src="js/custom.js"></script>