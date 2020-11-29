<head>
<title>Patient Signup</title>
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
<link rel="stylesheet" type="text/css" href="css/scroll.css">
<link rel="stylesheet" type="text/css" href="css/timeline.css">
<link rel="stylesheet" type="text/css" href="css/util.css">

<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.css">

<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">

</head>
<body id="home" data-spy="scroll">
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/gallery-02.jpg');">
			<div class="wrap-login100" style="width: 700px">
				<form class="text-white" style="width: 500px" action="PatientRegister" method="post" autocomplete="off">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"> </i>
					</span> 
					<span class="login100-form-title p-b-34 p-t-27"> 
					Patient Signup 
					<div class="btn-danger">${registerError} </div>
					</span>
					
					<ul class="form-section page-section ">
						<li>
							<label> Patient Gender *</label> 
							<select id="gender" class="form-control" name="patientGender" style="width: 200px" required>
								<option value="none" selected disabled hidden=""> -- Select Gender -- </option> 
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</li>
						<li class="mt-4">
							<h3> -- General Patient Information --</h3>
						</li>
						<li class="mt-3">
							<label> Patient Name * </label> 
							<input type="text" name="patientName" placeholder="Enter Your Name" class="form-control" required>
						</li>
						<li class="mt-2">
							<label> Patient Birth Date * </label> 
							<input type="date" name="patientBirthdate" class="form-control" required>
						</li>
						<li class="mt-2">
							<label> Patient Height (cm's) * </label> 
							<input type="number" name="patientHeight" class="form-control" placeholder="ex: 176" style="width: 150px;" required>
						</li>
						<li class="mt-2">
							<label> Patient Weight (kg's) * </label> 
							<input type="number" name="patientWeight" class=" form-control" placeholder="ex: 70" style="width: 150px"required>
						</li>
						<li class="mt-2">
							<label> Patient Username * </label>
							<input type="email" name="patientUsername" class="form-control" placeholder="ex: myname@example.com" required>
						</li>
						<li class="mt-2">
							<label> Patient Password * </label>
							<input type="password" name="patientPassword" class="form-control" placeholder="********" required>
						</li>
						<li class="mt-4">
							<h3> -- Patient Medical History -- </h3>
						</li>
						<li class="mt-3">
							<label> Please list any drug allergies </label>
							<textarea class="form-control" name="patientAllergy"></textarea>
						</li>
						<li class="mt-2">
							<label> Have you ever had (Please check all that apply) </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Anemia"> Anemia </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Asthma"> Asthma </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Arthritis"> Arthritis </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Cancer"> Cancer </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Gout"> Gout </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Diabetes"> Diabetes </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Emotional Disorder"> Emotional Disorder </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Epilepsy Seizures"> Epilepsy Seizures </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Fainting Spells"> Fainting Spells </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Gallstones"> Gallstones </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Heart Disease"> Heart Disease </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Heart Attack"> Heart Attack </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Rheumatic Fever"> Rheumatic Fever </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="High Blood Pressure"> High Blood Pressure </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Digestive Problems"> Digestive Problems </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Ulcerative Colitis"> Ulcerative Colitis </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Ulcer Disease"> Ulcer Disease </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Hepatitis"> Hepatitis </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Kidney Disease"> Kidney Disease </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Liver Disease"> Liver Disease </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Sleep Apnea"> Sleep Apnea </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Use a C-PAP machine"> Use a C-PAP machine </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Thyroid Problems"> Thyroid Problems </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Tuberculosis"> Tuberculosis </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Venereal Disease"> Venereal Disease </label> 
							<label> <input type="checkbox" name="patientSymptoms" value="Neurological Disorders"> Neurological Disorders </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Bleeding Disorders"> Bleeding Disorders </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Lung Disease"> Lung Disease </label>
							<label> <input type="checkbox" name="patientSymptoms" value="Emphysema"> Emphysema </label>
							<label> <input type="checkbox" name="patientSymptoms" value="None of these"> None of these</label>
						</li>
						<li class="mt-2">
							<label> Other illnesses: </label>
							<input type="text" name="patientIllnesses" class="form-control">
						</li>
						<li class="mt-2">
							<label> Please list any Operations and Dates of Each: </label> 
							<textarea class="form-control" name="patientOperations"></textarea>
						</li>
						<li class="mt-2">
							<label> Please list your Current Medictions: </label>
							<textarea name="patientMedictions" class="form-control"></textarea>
						</li>
						<li class="mt-4">
							<h3> -- Healthy &amp; Unhealthy Habits -- </h3>
						</li>
						<li class="mt-3">
							<h4 class="mb-2">Exercise</h4>
							<label> <input type="radio" name="patientExercise" value="Never"> Never </label> 
							<label> <input type="radio" name="patientExercise" value="1-2 days">1-2 days </label> 
							<label> <input type="radio" name="patientExercise" value="3-4 days">3-4 days </label> 
							<label> <input type="radio" name="patientExercise" value="5+ days"> 5+ days </label>
						</li>
						<li class="mt-3">
							<h4 class="mb-2">Eating following a diet</h4> 
							<label> <input type="radio" name="patientDiet" value="I have a loose diet"> I have a loose diet </label>
							<label> <input type="radio" name="patientDiet" value="I have a strict diet"> I have a strict diet </label>
							<label> <input type="radio" name="patientDiet" value="I don't have a diet plan"> I don't have a diet plan </label>
						</li>
						<li class="mt-3">
							<h4 class="mb-2">Alcohol Consumption</h4>
							<label> <input type="radio" name="patientDrink" value="I don't drink"> I don't drink </label>
							<label> <input type="radio" name="patientDrink" value="1-2 glasses/day"> 1-2 glasses/day </label>
							<label> <input type="radio" name="patientDrink" value="3-4 glasses/day"> 3-4 glasses/day </label>
							<label> <input type="radio" name="patientDrink" value="5+ glasses/day"> 5+ glasses/day </label>
						</li>
						<li class="mt-3">
							<h4 class="mb-2">Caffeine Consumption</h4>
							<label> <input type="radio" name="patientCaffeine" value="I don't use caffeine"> I don't use caffeine </label> 
							<label> <input type="radio" name="patientCaffeine" value="1-2 cups/day"> 1-2 cups/day </label> 
							<label> <input type="radio" name="patientCaffeine" value="3-4 cups/day"> 3-4 cups/day </label> 
							<label> <input type="radio" name="patientCaffeine" value="5+ cups/day"> 5+ cups/day </label>
						</li>
						<li class="mt-3">
							<h4 class="mb-2">Do you smoke?</h4> <label> <input type="radio" name="patientSmoke" value="No"> No </label>
							<label> <input type="radio" name="patientSmoke" value="0-1 pack/day"> 0-1 pack/day </label>
							<label> <input type="radio" name="patientSmoke" value="1-2 packs/day"> 1-2 packs/day </label> 
							<label> <input type="radio" name="patientSmoke" value="2+ packs/day"> 2+ packs/day </label>
						</li>
						<li class="mt-3">
							<label> Include other comments regarding your Medical History: </label>
							<textarea class="form-control" name="patientComments"></textarea>
						</li>
						<li class="mt-3">
							<button class="login100-form-btn"> Submit </button>
						</li>
					</ul>
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
<script src="js/owl.carousel.min.js"></script>
<script src="js/form-validator.min.js"></script>
<script src="js/contact-form-script.js"></script>
<script src="js/isotope.min.js"></script>
<script src="js/images-loded.min.js"></script>
<script src="js/custom.js"></script>