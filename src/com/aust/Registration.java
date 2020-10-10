package com.aust;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")

public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/airlines","root","");
			
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String email = request.getParameter("email");
			String mobile_no = request.getParameter("mobile");
			String password = request.getParameter("password");
			
			
			String sql= "insert into user(name, gender, age, email, mobile_no, password) values(?,?,?,?,?,?)";
			
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,name);  
			ps.setString(2,gender);  
			ps.setString(3,age);  
			ps.setString(4,email);
			ps.setString(5,mobile_no); 
			ps.setString(6,password); 
			
			ps.executeUpdate();
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		out.println("You have successfully registered!!");
		
	}

}
