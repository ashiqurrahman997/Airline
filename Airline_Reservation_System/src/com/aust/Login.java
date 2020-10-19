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
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("username").toString();		
		String password = request.getParameter("password").toString();
		
		String username ="";	
		String user_password = "";
		
	
	
		PrintWriter out = response.getWriter();	
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/airlines","root","");
			
			Statement st=(Statement) con.createStatement();
			ResultSet  rs= st.executeQuery("SELECT * FROM `user` WHERE name ='"+name+"'"+"and password='"+password+"'");
			
			
			while(rs.next())
			{		
				username=rs.getString(2);			
			
				 user_password=rs.getString(7);
				
			}
			
			
		
			if(username.equals(name) && password.equals(user_password))
{
			
				response.sendRedirect("Online_Reservation.jsp");
				
				HttpSession session=request.getSession();
				
			    session.setAttribute("username", username);
	
	      
}
			else
			{
				
				response.sendRedirect("LoginError.jsp");
				
			}
			
		//	HttpSession session=request.getSession();
		//	session.setAttribute("username", username);
			
		//	response.sendRedirect("index.html");
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  
	
	}

}
