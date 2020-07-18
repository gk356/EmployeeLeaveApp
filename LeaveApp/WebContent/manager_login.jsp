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

PreparedStatement ps = con.prepareStatement("select * from manager where username = ? and password = ?");
ps.setString(1,username);
ps.setString(2,password);


ResultSet rs = ps.executeQuery();

if(rs.next()){
	//out.print("<h1>Logged in Successfully</h1>");
	HttpSession hs = request.getSession();
	hs.setAttribute("mid", rs.getInt("mid"));
	response.sendRedirect("manager_home.html");
}else{
	response.sendRedirect("index.html");
}

%>