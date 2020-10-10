package com.aust.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightInsert
 */
@WebServlet("/Flight")
public class FlightInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		String src = (String) request.getParameter("source").trim();
		
		String	destination = (String) request.getParameter("destinatons").trim();
		
		String	dep_time = (String) request.getParameter("dep_time").trim();
		

		String	dep_date = (String) request.getParameter("dep_date").trim().trim();
		

		String	airlinename = (String) request.getParameter("airline_name").trim();
		
		
		String	airport = (String) request.getParameter("airport_name").trim();

		String	dep_price = (String) request.getParameter("Price").trim();
		
		String seat = (String) request.getParameter("seat").trim();
		
		PrintWriter out = response.getWriter();
		
		out.println(src+destination+dep_time+dep_date);
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ticket","root","");
			
		String sql="INSERT INTO `flight_details`(`source`, `destination`, `depaturedate`, `departuretime`, `airlinename`, `airportname`, `ticket_price`, `seats`)"
				+ " VALUES (?,?,?,?,?,?,?,?)";
		

		PreparedStatement ps= conn.prepareStatement(sql);
		
		ps.setString(1,src);  
		ps.setString(2,destination);  
		ps.setString(3,dep_date);  
		ps.setString(4,dep_time);
		ps.setString(5,airlinename); 
		ps.setString(6,airport); 
		ps.setString(7,dep_price);
	      ps.setString(8,seat);
		
		ps.executeUpdate();
		
			
			out.println("Sucessfully inserted");
		response.sendRedirect("DeleteFlight.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		
	}

}
