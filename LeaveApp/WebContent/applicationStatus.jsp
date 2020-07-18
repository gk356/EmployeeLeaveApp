<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application Status page</title>
</head>
<body style="background-color:#eeffcc">
<br><br><br><br><br><br>
<h1 style="text-align:center">Application Status</h1>

<table text-align="center" height= "100" width="450" align="center" border="2">
<tr>
<td>Application ID</td>
<td>Subject</td>
<td>Reason</td>
<td>Date</td>
<td>No. of Days</td>
<td>Status</td>
</tr>
<%
int eid = (Integer) session.getAttribute("eid");
String url = "jdbc:mysql://localhost:3306/company";
String un = "root";
String pw = "Gautam1234@";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url,un,pw);

PreparedStatement ps = con.prepareStatement("select * from apply where eid =?");
ps.setInt(1,eid);

ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%= rs.getInt("aid") %></td>
<td><%= rs.getString("subject") %></td>
<td><%= rs.getString("reason") %></td>
<td><%= rs.getString("dt") %></td>
<td><%= rs.getInt("days") %></td>
<td><%= rs.getString("status") %></td>

</tr>

<%
}
%>
<tr>
<td><a href="employee_home.html">Back</a></td>
</tr>
</table>


</body>
</html>