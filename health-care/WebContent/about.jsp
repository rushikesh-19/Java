<html>
<head>
<title>About Us</title><meta charset="UTF-8">
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
<style>	
.card {
	
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}
.about-section {
  padding:40px;
  text-align: center;
  background-color: #474e5d;
}
.about-section p{
color: white;
}
.title {
  color: white;
}
.img {
box-shadow: 2px 4px 8px 4px rgba(0, 0, 0, 0.5);
	width:200px;
	height:200px;
	margin: auto;
}
}
</style>
</head>
<header class="top-header">
	<nav class="navbar header-nav navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> 
				<img src="images/logo_cliniva.jpg" alt="image">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
				<span></span> 
				<span></span> 
				<span></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
				<ul class="navbar-nav">
					<%	if(session.getAttribute("patientid") != null) {%>
					<li><a class="nav-link" href="patientDashboard.jsp">Home</a></li>
					<% } else {%>
						<li><a class="nav-link" href="index.jsp">Home</a></li>
					<% } %>
					<li><a class="nav-link" href="contactUs.jsp">Contact Us</a></li>
					<li><a class="nav-link" href="about.jsp">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<body>
<div class="about-section">
  <h1 class="title">About Us</h1>
  <div style="margin:auto;width:90%;">
  <p style="padding: 10px; font-size: 20px;">Hospitalmanagement.net houses a unique portfolio of services that keep healthcare professionals abreast of the latest and most significant developments within their clinical, surgical or management area.
Covering all aspects of the hospital environment, hospitalmanagement.net provides both clinical and senior administrative staff with instant access to a comprehensive reference source introducing technologies, services and procedures our audience can employ to improve the management of their facilities.
</p>
  <p style="padding: 10px; font-size: 20px;"> The site is complemented by two specialist journals, Practical Patient Care and Medical Imaging Technology concentrating on woundcare and infection control and medical imaging and radiology respectively.
  Both titles are circulated to an audience that includes not only clinicians with the authority to recommend new products, but also the managerial staff responsible for purchasing. By reaching both ends of the procurement chain we offer our advertisers the best possible platform from which to sell their services.
  </p>
  </div>
</div>
<h2 style="text-align:center; margin-top:5px;">Our Team</h2>
<div class="row" style="max-width: 100%">
	<span style="margin-left: 250px;"></span>
	<div class="card">
		<img class="img mb-3" src="images/developerImages/riya.jpeg" alt="J1">
		<div class="container">
   			<h2>Riya Kharde</h2>
	        <p>Member 1</p>
	        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
	        <p>riya@swap.com</p>
	        <p><button class="btn btn-primary m-2" data-toggle="modal" data-target="#myModal1"> Contact </button> </p>
			<div class="modal fade" id="myModal1">
				<div class="modal-dialog">
			    	<div class="modal-content">
			        	<div class="modal-header">
			          		<h4 class="modal-title">Riya Kharde</h4>
			          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		</div>
			        	<div class="modal-body">
			        		Email: riya@healthcaredevelop.in
			        	</div>
			        	<div class="modal-footer">
				        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
					</div>
			    </div>
			</div>
		</div>
	</div>
	<div class="card">
		<img class="img mb-3" src="images/developerImages/vedanti.jpeg" alt="J1" width="100px" height="100px">
		<div class="container">
   			<h2>Vedanti Hasabe</h2>
	        <p>Member 2</p>
	        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
	        <p>vedanti@swap.com</p>
	        <p><button class="btn btn-primary m-2" data-toggle="modal" data-target="#myModal2"> Contact </button> </p>
			<div class="modal fade" id="myModal2">
				<div class="modal-dialog">
			    	<div class="modal-content">
			        	<div class="modal-header">
			          		<h4 class="modal-title">Vedanti Hasabe</h4>
			          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		</div>
			        	<div class="modal-body">
			        		Email: vedanti@healthcaredevelop.in
			        	</div>
			        	<div class="modal-footer">
				        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
					</div>
			    </div>
			</div>
		</div>
	</div>
	<div class="card">
		<img class="img mb-3 mt-5" src="images/developerImages/shrushti.jpeg" width="100px" height="100px" alt="J1">
		<div class="container">
   			<h2>Shrushti Vishwasrao</h2>
	        <p>Member 3</p>
	        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
	        <p>shrushti@swap.com</p>
	        <p><button class="btn btn-primary m-2" data-toggle="modal" data-target="#myModal3"> Contact </button> </p>
			<div class="modal fade" id="myModal3">
				<div class="modal-dialog">
			    	<div class="modal-content">
			        	<div class="modal-header">
			          		<h4 class="modal-title">Shrushti Vishwasrao</h4>
			          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		</div>
			        	<div class="modal-body">
			        		Email: shrushti@healthcaredevelop.in
			        	</div>
			        	<div class="modal-footer">
				        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
					</div>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>

<a href="#" id="scroll-to-top" class="new-btn-d br-2"><i class="fa fa-angle-up"></i></a>
</html>
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