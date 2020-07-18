<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Info</title>
</head>
<body style="background-color: #eeffcc">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1 style="text-align: center">Manager Profile</h1>
	<table align="center" border="2" width="300" height="150">
		<tr>
			<td>Manager ID</td>
			<td>User Name</td>
			<td>Department</td>
			<td>Email</td>
			<td>Phone</td>
		</tr>
		<%
			int mid = (Integer) session.getAttribute("mid");
		String url = "jdbc:mysql://localhost:3306/company";
		String un = "root";
		String pw = "Gautam1234@";

		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con = DriverManager.getConnection(url, un, pw);

		PreparedStatement ps = con.prepareStatement("select * from manager where mid = ?");
		ps.setInt(1, mid);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("mid")%></td>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("department")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getLong("phone")%></td>
		</tr>

		<%
			}
		%>
		<tr>
			<td><a href="manager_home.html">Home</a></td>
		</tr>
	</table>

</body>
</html>