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
	if (session.getAttribute("doctorid") == null)
		response.sendRedirect("doctorLogin.jsp");
%>
<div class="main-top">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="wel-nots">
					<p>
						<b>Hello Doctor</b>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<header class="top-header">
	<nav class="navbar header-nav navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="doctorDashboard.jsp"> 
			<img src="images/logo_cliniva.jpg" alt="image"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
				<span></span> 
				<span></span> 
				<span></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
				<ul class="navbar-nav">
					<li><a class="nav-link" href="doctorDashboard.jsp">Home</a></li>
					<li><a class="nav-link" href="allPatientsForDoctors.jsp">Patients</a></li>
					<li><a class="nav-link" href="doctorProfile.jsp">Profile</a></li>
					<li><a class="nav-link" href="DoctorLogout">LogOut</a></li>
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
			int doctorId = (int) session.getAttribute("doctorid");
			String doctorDetails = "select * from doctor where doctorId = " + doctorId;
			rs = stmt.executeQuery(doctorDetails);
	%>
	<div class="container mb-3">
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
											<%=rs.getString("doctorName")%>
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
								</ul>
								<div class="tab-content ml-1" id="myTabContent">
									<div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Username: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("doctorUsername")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Post: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("doctorPost")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Joining Date: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("dateOfJoining")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Experience: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("doctorExperience")%>
											</div>
										</div>
										
										<hr />
										
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;"> Designation: </label>
											</div>
											<div class="col-md-8 col-6">
												<%=rs.getString("doctorDesignation")%>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						rs.close();
						stmt.close();
						con.close();
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