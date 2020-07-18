<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
int mid = (Integer) session.getAttribute("mid");
String url = "jdbc:mysql://localhost:3306/company";
String un = "root";
String pw = "Gautam1234@";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url,un,pw);

PreparedStatement gps = con.prepareStatement("select * from apply where mid = ?");
gps.setInt(1,mid);

ResultSet grs = gps.executeQuery();
int askday = 0;
int employeeID = 0;
if(grs.next()){
	askday = grs.getInt("days");
	employeeID = grs.getInt("eid");
}

PreparedStatement fps = con.prepareStatement("select * from employee where eid = ?");
fps.setInt(1,employeeID);

ResultSet frs = fps.executeQuery();
int day = 0;
if(frs.next()){
	day = frs.getInt("holiday");
}

System.out.println("Day: "+ day);
int remDay = day - askday;
System.out.println("RemDay: "+ remDay);
String accept = request.getParameter("accepted");
String reject = request.getParameter("rejected");

if(accept.equals("accepted")){
	PreparedStatement ps = con.prepareStatement("update apply set status = ? where mid = ?");
	ps.setString(1,accept);
	ps.setInt(2, mid);
	
	PreparedStatement aps = con.prepareStatement("update employee set holiday = ? where eid = ?");
	aps.setInt(1, remDay);
	aps.setInt(2, employeeID);
	
	int x = ps.executeUpdate();
	int y = aps.executeUpdate();	
	if(x>0 && y>0){
		response.sendRedirect("checkStatus.jsp");
	}
}else if(reject.equals("rejected")){
	PreparedStatement ps = con.prepareStatement("update apply set status = ? where mid = ?");
	ps.setString(1,reject);
	ps.setInt(2, mid);
	int x = ps.executeUpdate();
	
	if(x>0){
		response.sendRedirect("checkStatus.jsp");
	}
}

%>