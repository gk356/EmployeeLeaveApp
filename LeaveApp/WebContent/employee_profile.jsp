<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Info</title>
</head>
<body style="background-color:#ccffff">
<br><br><br><br><br><br>
<h1 style="text-align:center">Employee Profile</h1>
<table align="center" border="2" width="300" height="150">
<tr>
<td>Employee ID</td>
<td>User Name</td>
<td>Department</td>
<td>Email</td>
<td>Phone</td>
<td>Remaining Leave Days</td>
</tr>
<% 
int eid = (Integer)session.getAttribute("eid");
String url = "jdbc:mysql://localhost:3306/company";
String un = "root";
String pw = "Gautam1234@";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url,un,pw);

PreparedStatement ps = con.prepareStatement("select * from employee where eid = ?");
ps.setInt(1,eid);

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("eid") %></td>
<td><%=rs.getString("username") %></td>
<td><%=rs.getString("department") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getLong("phone") %></td>
<td><%=rs.getInt("holiday") %></td>
</tr>

<%
}
%>
<tr>
<td>
<a href="employee_home.html">Home</a>
</td>
</tr>
</table>

</body>
</html>