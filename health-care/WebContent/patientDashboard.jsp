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
	if (session.getAttribute("patientid") == null)
		response.sendRedirect("patientLogin.jsp");
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
	<div class="ulockd-home-slider">
		<div class="container-fluid">
			<div class="row">
				<div class="pogoSlider" id="js-main-slider">
					<div class="pogoSlider-slide" data-transition="fade" data-duration="1500" style="background-image: url(images/slider-01.jpg);">
						<div class="lbox-caption pogoSlider-slide-element">
							<div class="lbox-details">
								<h1>Check Out the Schedule</h1>
								<a href="#" class="btn">Appointments</a>
							</div>
						</div>
					</div>
					<div class="pogoSlider-slide" data-transition="fade" data-duration="1500" style="background-image: url(images/slider-02.jpg);">
						<div class="lbox-caption pogoSlider-slide-element">
							<div class="lbox-details">
								<h1>Patients Recovery with Respect to Disease</h1>
								<a href="#" class="btn">Report</a>
							</div>
						</div>
					</div>
					<div class="pogoSlider-slide" data-transition="fade" data-duration="1500" style="background-image: url(images/slider-03.jpg);">
						<div class="lbox-caption pogoSlider-slide-element">
							<div class="lbox-details">
								<h1>New Members Added to Cliniva</h1>
								<a href="#" class="btn">Patients</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%!Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;%>
	
	<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
			stmt = con.createStatement();
			int patientId = (int) session.getAttribute("patientid");
			String patientDetails = "select * from patient where patientId = " + patientId;
			rs = stmt.executeQuery(patientDetails);
	%>
	<div class="container m-5 mb-3">
		<div class="row">
			<div class="col-12">
				<%
					while (rs.next()) {
				%>
				<div class="card">
					<div class="card-body">
						<div class="card-title mb-4">
							<div class="d-flex justify-content-start">
								<div class="userData ml-3">
									<h1>
										<a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true"> 
											<%=rs.getString("patientName")%>
										</a>
									</h1>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<ul class="nav nav-tabs mb-4">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#basicInfo">
											Basic Info
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="doctorSuggestions-tab" data-toggle="tab" href="#doctorSuggestions" role="tab" aria-controls="doctorSuggestions" aria-selected="false">
											Doctor Suggestions
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="contactPerson-tab" data-toggle="tab" href="#contactPerson" role="tab" aria-controls="contactPerson" aria-selected="false">
											Contact Person
										</a>
									</li>
								</ul>
								<div class="tab-content ml-1" id="myTabContent">
									<div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Gender: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientGender")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Birth Date: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientBirthdate")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Height: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientHeight")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Weight: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientWeight")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Allergy: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientAllergy")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Symptoms: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientSymptoms")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Illeness: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientIlleness")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Operations: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientOperations")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Medications: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientMedictions")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Exercise: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientExercise")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Diet: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientDiet")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Drink: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientDrink")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Caffeine: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientCaffeine")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;">Smoke</label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientSmoke")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Comments: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("patientComments")%>
											</div>
										</div>
									
									</div>
									<div class="tab-pane fade" id="doctorSuggestions" role="tabpanel" aria-labelledby="doctorSuggestions-tab">
										<%=rs.getString("doctorSuggestions")%>
									</div>
									<div class="tab-pane fade" id="contactPerson" role="tabpanel" aria-labelledby="contactPerson-tab">
										<%=rs.getString("contactPerson")%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
					} catch (Exception e) {
						System.out.println(e);
					}
				%>
			</div>
		</div>
	</div>
</body>
<a href="#" id="scroll-to-top" class="new-btn-d br-2"><i class="fa fa-angle-up"></i></a>
<!-- ALL JS FILES -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.pogo-slider.min.js"></script>
<script src="js/slider-index.js"></script>
<script src="js/main.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/images-loded.min.js"></script>
<script src="js/custom.js"></script>