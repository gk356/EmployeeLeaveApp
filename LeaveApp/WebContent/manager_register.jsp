<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import = "java.sql.*"%>

<% 
String url = "jdbc:mysql://localhost:3306/company";
String un = "root";
String pw = "Gautam1234@";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url,un,pw);

String username = request.getParameter("username");
String password = request.getParameter("password");
String department = request.getParameter("depart");
String email = request.getParameter("email");
long phone = Long.parseLong(request.getParameter("phone"));

 PreparedStatement ps = con.prepareStatement("insert into  manager (username, password, department, email, phone) values(?,?,?,?,?)");
ps.setString(1,username);
ps.setString(2,password);
ps.setString(3,department);
ps.setString(4,email);
ps.setLong(5,phone);

int x = ps.executeUpdate();
if(x > 0){
	response.sendRedirect("index.html");
}else{
	response.sendRedirect("registerManager.html");
}

%>