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
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


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



	<div class="container table-responsive wow fadeInUp">
		<table class="table">
			<thead>
			<tr class="table-primary">
			     <th>ID</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Departure Date</th>
				<th>Ticket Price</th>
				<th>Airport Name</th>
				<th>AirLine Name</th>
			</tr>
			</thead>

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

					ResultSet rs = st.executeQuery(
							"SELECT * FROM `flight_info` INNER JOIN route_info as r ON flight_info.Flight_id=r.Flight_id");
					//		+ " where r.Source='"+departure_city+"' and"
					//	+ " Destination='"+arrival_city+"'");

					Statement st1 = (Statement) con.createStatement();

					//String s = "SELECT * FROM airport_info as b INNER JOIN airline_info as a ON b.Flight_id=a.Flight_id where b.Flight_id IN(SELECT r.`Flight_id` FROM `flight_info` INNER JOIN route_info as r ON flight_info.Flight_id=r.Flight_id)";
			    	String s="SELECT * FROM `flight_details`";
					ResultSet rs1 = st1.executeQuery(s);

					while ( rs1.next()) {

						Flt_id = (rs1.getString(1));

						dep_time = (rs1.getString(5));
						dep_date = (rs1.getString(4));
						dep_price = (rs1.getString(8));

						src = (rs1.getString(2));
						destination = (rs1.getString(3));

						airlinename = (rs1.getString(6));

						airport = (rs1.getString(7));
			%>
			<tbody>
			<tr>
			<td>
					<%
						out.println(Flt_id );
					%>
				</td>

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
			<%
				}

				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				HttpSession session1 = request.getSession();
				session1.setAttribute("src", src);
				session1.setAttribute("destination", destination);
				session1.setAttribute("dep_time", dep_time);
				session1.setAttribute("dep_date", dep_date);
				session1.setAttribute("dep_price", dep_price);

				session1.setAttribute("airlinename", airlinename);
				session1.setAttribute("airport", airport);
			%>



		</table>


<form action="delete" method="post">


Enter ID:  <input type="text" name= "ID"><br>
<input type="submit" value="Delete">


</form>







</body>
</html>