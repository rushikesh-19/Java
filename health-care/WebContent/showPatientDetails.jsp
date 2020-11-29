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
	Statement stmt = null;
	ResultSet rs = null;%>

	<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
			String patientId = request.getParameter("patientId");
			stmt = con.createStatement();
			String patientDetails = "select * from patient where patientId = " + patientId;
			rs = stmt.executeQuery(patientDetails);
			while (rs.next()) {
	%>
	<div class="card container mt-5" style="max-width: 900px;">
		<div class="col-md-12">
			<div class="card-body">
				<h1 class="text-primary font-weight-bold" style="font-size: 40px;">
					<%=rs.getString("patientName")%>
				</h1>
				
				<hr />
				
				<h2>
					Gender:
					<%=rs.getString("patientGender")%>
				</h2>
				
				<h2>
					Birth Date:
					<%=rs.getString("patientBirthdate")%>
				</h2>
				
				<h2>
					Height:
					<%=rs.getString("patientHeight")%>
				</h2>
				
				<h2>
					Weight:
					<%=rs.getString("patientWeight")%>
				</h2>
				
				<h2>
					Email:
					<%=rs.getString("patientUsername")%>
				</h2>
				
				<hr />
				
				<h2> Allergy: </h2>
				<h3>
					<%=rs.getString("patientAllergy")%>
				</h3>
				
				<hr />
				
				<h2>Symptoms:</h2>
				<h3>
					<%=rs.getString("patientSymptoms")%>
				</h3>
				
				<hr />
				
				<h2>illeness:</h2>
				<h3>
					<%=rs.getString("patientIlleness")%>
				</h3>
	
				<hr />
	
				<h2>Operations:</h2>
				<h3>
					<%=rs.getString("patientOperations")%>
				</h3>
	
				<hr />
	
				<h2>Medictions:</h2>
				<h3>
					<%=rs.getString("patientMedictions")%>
				</h3>
	
				<hr />
	
				<h2>
					Diet:
					<%=rs.getString("patientDiet")%>
				</h2>
				
				<h2>
					Drink:
					<%=rs.getString("patientDrink")%>
				</h2>
				<h2>
					Caffeine:
					<%=rs.getString("patientCaffeine")%>
				</h2>
				<h2>
					Smoke:
					<%=rs.getString("patientSmoke")%>
				</h2>

				<hr />

				<h2 class="m-1 1"> Comments: </h2>
				<h3 class="ml-1">
					<%=rs.getString("patientComments")%>
				</h3>

				<hr />

				<h2 class="m-1 1">Suggestion:</h2>
				<h3 class="ml-1">
					<%=rs.getString("doctorSuggestions")%>
				</h3>

				<hr />

				<h2 class="m-1 1">Contact Person:</h2>
				<h3 class="ml-1">
					<%=rs.getString("contactPerson")%>
				</h3>

				<hr />

				<a class="btn btn-primary mt-2" href="showAllPatients.jsp"> 
					Back
				</a>
			</div>
		</div>
	</div>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
<a href="#" id="scroll-to-top" class="new-btn-d br-2"> <i class="fa fa-angle-up"> </i> </a>
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