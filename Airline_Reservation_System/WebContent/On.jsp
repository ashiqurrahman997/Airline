<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import=" java.io.IOException" import="java.io.PrintWriter"
	import="java.sql.Connection" import="java.sql.DriverManager"
	import="java.sql.ResultSet" import="java.sql.SQLException"
	import="javax.servlet.ServletException"
	import="javax.servlet.annotation.WebServlet"
	import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import="javax.servlet.http.HttpServletResponse"
	import=" com.mysql.jdbc.Statement"%>



	
<%   String username="";

    
    username=session.getAttribute("username").toString();

  //  PrintWriter out1 = response.getWriter();	


%>
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
							href="Logout.jsp"><% out.print(username); %></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>

	<!---------------HEADER ENDS---------------->

	<!----------BANNER AREA STARTS------------>

	<div class="bannerarea_reserve">
		<section class="banner_reserve d-flex align-items-center">

			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">

						<div class="banner_texts">

							<h1 class="wow pulse">
								<b class="mache blck">Search your preferred Flights! <i
									class="fas fa-plane-departure viotxt"></i></b>
							</h1>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="text-center container">
				<form class="form-inline" action="OnlineReservation" method="post">
					<div class="form-group">
						<label for="DepartureCity" class="blck"><b>From : </b></label> <input
							type="text" name="DepartureCity" class="form-control"
							placeholder="Enter country name..">
					</div>
					<div class="form-group pl-3 pr-1">
						<label for="ArrivalCity" class="blck"><b>To : </b></label> <input type="text"
							name="ArrivalCity" class="form-control"
							placeholder="Enter country name..">
					</div>
					<button type="submit" class="btn btn-dark" value="Search">Search</button>
				</form>
			</div>
		</section>
	</div>

	<!---------- BANNER AREA ENDS------------>



	<%
		String source = (String) request.getAttribute("source");

		String src = "", destination = "", dep_price = "", dep_date = "", dep_time = "", Flt_id = "";

		String airlinename = "", airport = "";
		//String departure_Type=request.getParameter("DepartureType");
		String departure_city = (String) request.getAttribute("DepartureCity");
		String arrival_city = (String) request.getAttribute("ArrivalCity");
		//String DepartureDate=request.getParameter("DepartureDate");

		//out.println(departure_city+arrival_city);	

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ticket","root","");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ticket", "root", "");

			Statement st = (Statement) con.createStatement();

			/*ResultSet rs = st.executeQuery(
					"SELECT * FROM `flight_info` INNER JOIN route_info as r ON flight_info.Flight_id=r.Flight_id"
							+ " where r.Source='" + departure_city + "' and" + " Destination='" + arrival_city
							+ "'");*/
			ResultSet rs = st.executeQuery(					
					"SELECT * FROM `flight_details` WHERE source='"+departure_city +"' and destination='"+ arrival_city+"'");
					
			while (rs.next()) {			

				
				dep_time = (rs.getString(5));
				dep_date = (rs.getString(4));
				dep_price = (rs.getString(8));

				src = (rs.getString(2));
				
				destination = (rs.getString(3));

				airlinename = (rs.getString(6));

				airport = (rs.getString(7));

			}
		

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//HttpSession session = request.getSession();
		session.setAttribute("src", src);
		session.setAttribute("destination", destination);
		session.setAttribute("dep_time", dep_time);
		session.setAttribute("dep_date", dep_date);
		session.setAttribute("dep_price", dep_price);

		session.setAttribute("airlinename", airlinename);
		session.setAttribute("airport", airport);
	%>

	<div class="container table-responsive wow fadeInUp">
		<table class="table">
			<thead>
				<tr class="table-success">
					<th>Source</th>
					<th>Destination</th>
					<th>Departure Time</th>
					<th>Departure Date</th>
					<th>Ticket Price</th>
					<th>Airport Name</th>
					<th>AirLine Name</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td>
						<%
							out.println(src);
						%>
					</td>
					<td>
						<%
							out.println(destination);
						%>
					</td>
					<td>
						<%
							out.println(dep_time);
						%>
					</td>
					<td>
						<%
							out.println(dep_date);
						%>
					</td>
					<td>
						<%
							out.println(dep_price);
						%>
					</td>
					<td>
						<%
							out.println(airlinename);
						%>
					</td>
					<td>
						<%
							out.println(airport);
						%>
					</td>

				</tr>
			</tbody>
		</table>

	</div>

	<div class="container text-right">
	<form action="Ticket_Form.jsp" class="mt-5 ">
		<input type="submit" value="Purchase Ticket" class="btn pricepinkbtn mt-4 wow pulse">
	</form>
	</div>
	<br>
	<br>
	<br>
	<br>
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