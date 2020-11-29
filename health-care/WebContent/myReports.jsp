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
	if (session.getAttribute("patientid") == null) {
		response.sendRedirect("patientLogin.jsp");
	}
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
			<a class="navbar-brand" href="patientDashboard.jsp"> 
				<img src="images/logo_cliniva.jpg" alt="image">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
				<span></span> 
				<span></span> 
				<span></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
				<ul class="navbar-nav">
					<li><a class="nav-link" href="patientDashboard.jsp">Home</a></li>
					<li><a class="nav-link" href="myPayments.jsp">Payments</a></li>
					<li><a class="nav-link" href="myReports.jsp">Reports</a></li>
					<li><a class="nav-link" href="contactUs.jsp">Contact Us</a></li>
					<li><a class="nav-link" href="about.jsp">About</a></li>
					<li><a class="nav-link" href="PatientLogout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<body id="home" data-spy="scroll">
	<%!Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;%>
	<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
			stmt = con.createStatement();
			int patientId = (int) session.getAttribute("patientid");
			String patientReports = "select report.reportId, report.reportStatus, report.reportReceipt, report.reportDate, patient.patientId, patient.patientName from report join patient where report.patientId = " + patientId + " and patient.patientId = " + patientId;

			rs = stmt.executeQuery(patientReports);
			if(rs.next() == false ){
	%>
		<div class="col-md-8 m-auto">
			<div class="card">
				<div class="card-header">
					<h1 class="text-secondary " style="margin-left:25%; font-size: 50px;">
						No Reports Available
					</h1>
				</div>
			</div>
		</div>
	<% } else { %>
	<table class="table table-bordered m-auto" style="max-width: 1000px;">
		<tr>
			<th>Patient Name</th>
			<th>Report Status</th>
			<th>Report Upload Date & Time</th>
			<th>View Report</th>
		</tr>
		<%
		}
			rs.close();
			stmt.close();
			stmt = con.createStatement();
			rs = stmt.executeQuery(patientReports);
			while (rs.next()) {
		%>
		<tr>
			<td>	
				<b style="font-size: 20px;">	<%=rs.getString("patientName")%>	</b>
			</td>
			<td>
				<%
					if (rs.getBoolean("reportStatus")) {
				%>
				<div class="text-success">
					<b style="font-size: 20px;"> Payment Paid </b>
				</div> 
				<%
 					} else {
 				%>
				<div class="text-danger">
					<b style="font-size: 20px;"> Payment Pending </b>
				</div> 
				<%
 					}
 				%>
			</td>
			<td>
				<%=rs.getTimestamp("reportDate")%>
			</td>
			<td>
				<% if (rs.getBoolean("reportStatus")) { %>	
					<a class="btn btn-primary" href="reportImages/<%=rs.getString("reportReceipt")%>"> 
						<b style="font-size: 20px;"> View Report </b>
					</a>
				<% } else {%>
					<a class="btn btn-primary disabled" href="reportImages/<%=rs.getString("reportReceipt")%>"> 
						<b style="font-size: 20px;"> View Report </b>
					</a>
				<% } %>
			</td>
		</tr>
	<%	}
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	</table>
	<a class="btn btn-primary mt-2" href="patientDashboard.jsp" style="margin-left: 50%">Back</a>
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