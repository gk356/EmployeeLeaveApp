<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<%
		int mid = (Integer)session.getAttribute("mid");
		
 		String url = "jdbc:mysql://localhost:3306/company";
 		String un = "root";
 		String pw = "Gautam1234@";

 		Class.forName("com.mysql.cj.jdbc.Driver");

 		Connection con = DriverManager.getConnection(url, un, pw);
		
 		String username = request.getParameter("username");
 		String password = request.getParameter("npassword");
 		String department = request.getParameter("department");
 		String email = request.getParameter("email");
 		long phone = Long.parseLong(request.getParameter("phone"));
		
		
 		PreparedStatement stmt = con.prepareStatement("update manager set username =?, password=?, department=?, email=?, phone=? where mid=?");
 		stmt.setString(1,username);
 		stmt.setString(2,password);
 		stmt.setString(3,department);
 		stmt.setString(4,email);
 		stmt.setLong(5,phone);
 		stmt.setInt(6,mid);
		
 		int x = stmt.executeUpdate();
 		if(x >0){
 			response.sendRedirect("manager_home.html");
 		}
		
		
%>
