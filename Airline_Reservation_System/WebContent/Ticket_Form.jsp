<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!------font awesome------>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">

<!------fa fa icons-------->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!------------google fonts---------------->
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">

<!-------------Animate CSS-------------->
<link rel="stylesheet" href="css/animate.css">

<!-------------My CSS-------------->
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/media.css">

<!-----------Countdown links------------>
<link href="css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/countdown-timer.js"></script>
<!----------Shortcut icon----------->
<link rel="shortcut icon" href="images/logo.png">
<title>Airline Reservation System</title>

</head>
<body>
	<!---------------HEADER STARTS---------------->

	<header class="fixed-top navigation">
		<div class="container">
			<!-- A grey horizontal navbar that becomes vertical on small screens -->
			<nav class="navbar navbar-expand-md navbar-expand-lg">

				<!-- Brand/logo -->
				<a class="navbar-brand wow bounceInLeft" href="#"> <img
					src="images/logo.png" height="50" alt="logo" class="logo">
				</a>

				<!----navbar toggle starts----->
				<button class="navbar-toggler wow fadeIn delay_small" type="button"
					data-toggle="collapse" data-target="#collapsibleNavbar">
					<span><i class="fas fa-bars menubar"></i></span>

				</button>
				<!----navbar toggle ends----->

				<!-- Links -->
				<div class="collapse navbar-collapse" id="collapsibleNavbar">

					<ul class="navbar-nav ml-auto wow fadeInDown">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="aboutus.html">About
								us</a></li>

						<li class="nav-item"><a class="nav-link  nav-active"
							href="Online_Reservation.jsp">Online Reservation</a></li>

						<li class="nav-item"><a class="nav-link"
							href="Registration.jsp"><%out.print(session.getAttribute("username")); %></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>

	<!---------------HEADER ENDS---------------->
	<%
		String src = "", destination = "", dep_price = "", dep_date = "", dep_time = "", Flt_id = "";

		String airlinename = "", airport = "";

	//	HttpSession session1 = request.getSession();

		src = (String) session.getAttribute("src");
		destination = (String) session.getAttribute("destination");
		dep_time = (String) session.getAttribute("dep_time");

		dep_date = (String) session.getAttribute("dep_date");

		airlinename = (String) session.getAttribute("airlinename");
		airport = (String) session.getAttribute("airport");

		dep_price = (String) session.getAttribute("dep_price");
	%>
	<!----------BANNER AREA STARTS------------>

	<div class="bannerarea_ticketform">
		<section class="banner_tf d-flex align-items-center" style="background-image: url(images/airport.jpg);">

			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">

						<div class="banner_texts">

							<h1 class="wow pulse">
								<b class="mache blck">Fill up the ticket form! </b>
								<%
									if (src.equals("Bangladesh")) {
								%>
								<img src="images/flags/bd.png" height="50" alt="Bangladesh">
								<%
									}
								%>
								<i class="fas fa-arrow-right viotxt"></i>
								<%
									if (destination.equals("America")) {
								%>
								<img src="images/flags/am.jpg" height="50" alt="America">
								<%
									}
								%>
								<%
									if (destination.equals("Australia")) {
								%>
								<img src="images/flags/aus.jpg" height="50" alt="Australia">
								<%
									}
								%>
								<%
								if (destination.equals("Bangkok")) {
								%>
								<img src="images/flags/bang.jpg" height="50" alt="Bangkok">
								<%
									}
								%>
								<%
								if (destination.equals("China")) {
								%>
								<img src="images/flags/chin.jpg" height="50" alt="China">
								<%
									}
								%>
								<%
								if (destination.equals("India")) {
								%>
								<img src="images/flags/in.jpg" height="50" alt="India">
								<%
									}
								%>
								<%
								if (destination.equals("Japan")) {
								%>
								<img src="images/flags/jap.png" height="50" alt="Japan">
								<%
									}
								%>
								<%
								if (destination.equals("Nepal")) {
								%>
								<img src="images/flags/nep.jpg" height="50" alt="Nepal">
								<%
									}
								%>
								<%
								if (destination.equals("Pakistan")) {
								%>
								<img src="images/flags/pak.png" height="50" alt="Pakistan">
								<%
									}
								%>
								<%
								if (destination.equals("Singapore")) {
								%>
								<img src="images/flags/sing.jpg" height="50" alt="Singapore">
								<%
									}
								%>
							</h1>
						</div>
					</div>
				</div>
			</div>
			<br>
		</section>
	</div>

	<!---------- BANNER AREA ENDS------------>
	<div class="container">
		<form class="regiform" method="post" action="Ticket.jsp">
			<div class="container mt-3 text-center">
			<p>
				<b class="ortxt">Source : </b>
				<%
					out.println(src);
				%>
				
				<b class="ortxt ml-5">Destination: </b>
				<%
					out.println(destination);
				%>
				<br>
				<b class="ortxt">Departure date : </b>
				<%
					out.println(dep_date);
				%>

				<b class="ortxt ml-5">Departure Time : </b>
				<%
					out.println(dep_time);
				%>
				<br>
				<b class="ortxt">AirLine Name : </b>
				<%
					out.println(airlinename);
				%>

				<b class="ortxt ml-5">Airport : </b>
				<%
					out.println(airport);
				%>
				<br>
				<b class="ortxt">Ticket Price per person : </b>
				<%
					out.println(dep_price);
				%> Tk.
			</p>
			</div>

			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">

					<p class="textbox">Enter your First name</p>
					<div class="indiv_inputs">
						<i class="fas fa-user input-icon"></i> <input
							class="input input-field" type="text" name="fname" required>
					</div>

					<p class="textbox">Enter your Last name</p>
					<div class="indiv_inputs">
						<i class="fas fa-user input-icon"></i> <input
							class="input input-field" type="text" name="lname" required>
					</div>

					<p class="textbox">Enter your Mobile number</p>
					<div class="indiv_inputs">
						<i class="fas fa-phone input-icon"></i> <input
							class="input input-field" type="text" name="phone" maxlength="11"
							required>

					</div>

					<p class="textbox">Enter your Age</p>
					<div class="indiv_inputs">
						<i class="fas fa-calendar-alt input-icon"></i> <input
							class="input input-field" type="text" name="age" required>
					</div>

				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">

					<p class="textbox">No Of Tickets needed</p>
					<div class="indiv_inputs">
						<i class="fas fa-list-ol input-icon"></i> <input
							class="input input-field" type="text" name="n_t" required>
					</div>

					<p class="textbox">Select your ticket class</p>
					<div class="indiv_inputs register_form">
						<i class="fas fa-suitcase-rolling input-icon"></i> <select
							class="input" name="Class" required>
							<option value="0">Select</option>
							<option>Economic</option>
							<option>Business</option>

						</select>
					</div>
					<p class="textbox">No Of Seats</p>
					<div class="indiv_inputs">
						<i class="fas fa-list-ol input-icon"></i> <input
							class="input input-field" type="text" name="Seat" required>
					</div>

					<p class="textbox">Enter your Credit Card no</p>
					<div class="indiv_inputs">
						<i class="fas fa-credit-card input-icon"></i> <input
							class="input input-field" type="text" name="crd_number" required>
					</div>

				</div>

			</div>
			<div class="text-center mt-5 mb-4">

				<button type="submit" class="register-btn" name="Purchase">PURCHASE</button>
			</div>


		</form>

	</div>

	<footer class="footer">
		<div class="container">

			<div class="row wow zoomIn">
				<div
					class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 lefty_center">
					<p>&copy; 2019 COPYRIGHT AIRLINES</p>
				</div>

				<div
					class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 righty_center">
					<p>
						DESIGNED BY <strong>Ashiq <b class="pinktxt">.</b> Anika
							<b class="pinktxt">.</b> Fariha
						</strong>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!---------------FOOTER ENDS-------------->



	<script src="js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>


	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="js/countdown-timer.js"></script>

</body>
</html>