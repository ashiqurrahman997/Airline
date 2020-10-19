package com.aust;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.catalina.servlet4preview.RequestDispatcher;

import com.mysql.jdbc.Statement;

@WebServlet("/OnlineReservation")

public class Online_Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Online_Reservation() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String departure_Type =request.getParameter("DepartureType");
		String departure_city=request.getParameter("DepartureCity");
		String arrival_city=request.getParameter("ArrivalCity");
		String DepartureDate =request.getParameter("DepartureDate");
		
		
		PrintWriter out = response.getWriter();
	//	out.println(departure_city+arrival_city+DepartureDate);	
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ticket","root","");
				
				Statement st=(Statement) con.createStatement();				
				ResultSet  rs= st.executeQuery("SELECT * FROM `flight_info` INNER JOIN route_info as r ON flight_info.Flight_id=r.Flight_id"
						+ " where r.Source='"+departure_city+"' and"
					+ " Destination='"+arrival_city+"'");
				
				if(!rs.next())
				{
					
					out.println("<h1 class='red'>No results found!!</h1>");
					out.println("<a class='btn btn-primary' href='Online_Reservation.jsp' class='button'>Go to Available Flight lists</a>");
				}
				
				else
				{
					
				do
				{		
				 
					out.println(rs.getString(1));
					out.println(rs.getString(2));				
					out.println(rs.getString(3));
					out.println(rs.getString(4));
					out.println(rs.getString(5));
					out.println(rs.getString(6));
					out.println(rs.getString(7));
					out.println(rs.getString(8));
					out.println(rs.getString(9));
					request.setAttribute("DepartureCity", departure_city);
					request.setAttribute("ArrivalCity", arrival_city);
					
				}	while(rs.next());
				
				request.setAttribute("source", "OKKKK");
				
				
		        getServletConfig().getServletContext().getRequestDispatcher("/On.jsp").forward(request, response);
				
				
				
				}				
		
		
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}  
			
			
			
		//out.println("YES ");
		
	}

}
