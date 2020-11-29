<head>
<title>Add Doctor</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/css-hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="vendor/select-2/select2.min.css">

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

<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.css">

<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">

</head>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setHeader("Expires", "0"); // Proxis
	if (session.getAttribute("adminid") == null)
		response.sendRedirect("adminLogin.jsp");
%>
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
<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/gallery-02.jpg');">
			<div class="wrap-login100">
				<form action="DoctorSetting" method="post" autocomplete="off" class="text-white">
					<label>
						Doctor Name: 
						<input class="form-control mb-2" type="text" placeholder="Doctor Name" name="doctorName" required>
					</label>
					 
					<label>
						Username: 
						<input class="form-control mb-2" type="email" placeholder="Username" name="doctorUsername" required>
					</label>
					
					<label>
						Password: 
						<input class="form-control mb-2" type="password" placeholder="Password" name="doctorPassword" required>
					</label> 
					
					<label>
						Date of Joining: 
						<input class="form-control mb-2" type="date" name="dateOfJoining" required>
					</label> 
					
					<label>
						Post: 
						<input class="form-control mb-2" type="text" placeholder="eg: head,juniot,senior" name="doctorPost" required>
					</label> 
					
					<label>
						Experience: 
						<input class="form-control mb-2" type="text" placeholder="eg: 2 years" name="doctorExperience" required>
					</label> 
					
					<label>
						Designation: 
						<input class="form-control mb-2" type="text" placeholder="eg: MBBS" name="doctorDesignation" required>
					</label>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" name="submit" value="Add Doctor">Add Doctor</button>
					</div>
				</form>
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
<script src="js/loginmain.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/form-validator.min.js"></script>
<script src="js/contact-form-script.js"></script>
<script src="js/isotope.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script src="js/images-loded.min.js"></script>
<script src="js/custom.js"></script>