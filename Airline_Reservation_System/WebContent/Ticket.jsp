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

	String numberofseat = (String) request.getParameter("n_t");

	String seat = (String) request.getParameter("Seat");

	String cls = (String) request.getParameter("Class");

	String Name = (String) request.getParameter("fname") + " " + (String) request.getParameter("lname");

	///int a=Integer.ParseInt(dep_price);//*Interger.ParseInt(numberofseat);

	//String price=String.valueOf (a);

	//String cls=(String)request.getParameter("Class");;
	///String cls=(String)request.getParameter("Class");
%>

<!----------BANNER AREA STARTS------------>

<div class="bannerarea_tick">
	<section class="banner_tick d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<div class="banner_texts">
						<h4 class="wow pulse">
							<b class="mache blck">Please print your Air ticket and bring
								it with you on your destined time! <i
								class="fas fa-plane-departure viotxt"></i>
							</b>
							<button onclick="printDiv('printMe')"
								class="button register-btn ml-5">
								<i class="fas fa-print"></i> Print Air Ticket
							</button>
						</h4>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
</div>

<!---------- BANNER AREA ENDS------------>

<body>
	<div class="container mt-5 pb-5 mb-5 ticket"  id="printMe">
		<div class="row ticket_head">
		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
		<h2 class="">
				<img src="images/logo.png" height="50" alt="logo" class="logo"><b>
				<%
					out.println(airport);
				%></b>
			</h2>
		</div>
		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
		<p class="ml-5 text-right"><b>Booked by: </b> Airline Reservation System Website </p>
		</div>	
			
		</div>
		<div class="row mt-3 pl-3 pr-3">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<h5><b>Name: </b> <%out.println(Name);%></h5>
			<br>
			<p><b>From: </b> <%out.println(src);%><%
				if (src.equals("Bangladesh")) {
								%>
								<img src="images/flags/bd.png" height="20" alt="Bangladesh">
								<%
									}
								%>	</p>
			
			<p><b>To: </b> <%out.println(destination);%><%
									if (destination.equals("America")) {
								%>
								<img src="images/flags/am.jpg" height="20" alt="America">
								<%
									}
								%>
								<%
									if (destination.equals("Australia")) {
								%>
								<img src="images/flags/aus.jpg" height="20" alt="Australia">
								<%
									}
								%>
								<%
								if (destination.equals("Bangkok")) {
								%>
								<img src="images/flags/bang.jpg" height="20" alt="Bangkok">
								<%
									}
								%>
								<%
								if (destination.equals("China")) {
								%>
								<img src="images/flags/chin.jpg" height="20" alt="China">
								<%
									}
								%>
								<%
								if (destination.equals("India")) {
								%>
								<img src="images/flags/in.jpg" height="20" alt="India">
								<%
									}
								%>
								<%
								if (destination.equals("Japan")) {
								%>
								<img src="images/flags/jap.png" height="20" alt="Japan">
								<%
									}
								%>
								<%
								if (destination.equals("Nepal")) {
								%>
								<img src="images/flags/nep.jpg" height="20" alt="Nepal">
								<%
									}
								%>
								<%
								if (destination.equals("Pakistan")) {
								%>
								<img src="images/flags/pak.png" height="20" alt="Pakistan">
								<%
									}
								%>
								<%
								if (destination.equals("Singapore")) {
								%>
								<img src="images/flags/sing.jpg" height="20" alt="Singapore">
								<%
									}
								%></p>	
								<p><b>Departure Time: </b><%out.println(dep_time);%></p>
								<p><b>Departure Date: </b><%out.println(dep_date);%></p>
			</div>	
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<br>	<br>	
			<p><b>Airport Name: </b> <%out.println(airlinename);%></p>
			<p><b>Class: </b> <%out.println(cls);%></p>	
			<p><b>Seat No: </b> <%out.println(seat);%></p>	
			<p><b>Ticket Price: </b> <%out.println(dep_price);%> Tk.</p>	
			<br>
			<img src="images/barcode.bmp" height="100" alt="barcode">
			</div>
			<p class="ml-3 mt-3">BOARDING GATE WILL BE CLOSED BEFORE 15 MINUTES OF THE DEPARTURE.</p>
		</div>
		

	</div>
	<script>
		function printDiv(divName) {
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;
			document.body.innerHTML = printContents;
			window.print();
			document.body.innerHTML = originalContents;
		}
	</script>
	
	
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
						DESIGNED BY <strong>Anika <b class="pinktxt">.</b> Fariha
							<b class="pinktxt">.</b> Ashiq
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