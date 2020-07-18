<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>
</head>
<body style="background-color: #eeffcc">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1 style="text-align: center">Manager Profile</h1>
	<form method=post action="updateManager.jsp">
	<table align="center" width="200" height="150">
		<%
		int mid = (Integer)session.getAttribute("mid");
		String url = "jdbc:mysql://localhost:3306/company";
		String un = "root";
		String pw = "Gautam1234@";

		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con = DriverManager.getConnection(url, un, pw);

		PreparedStatement ps = con.prepareStatement("select * from manager where mid = ?");
		ps.setInt(1, mid);

		ResultSet rs = ps.executeQuery();
		if(rs.next()){
		%>
		<tr>
			<td>User Name: </td>
			<td><input type="text" name="username" value="<%=rs.getString("username")%>"></td>
		</tr>
		<tr>
			<td>Old Password: </td>
			<td><input type="text" name="password" value="<%=rs.getString("password")%>"></td>
		</tr>
		
		<tr>
			<td>New Password: </td>
			<td><input type="text" name="npassword"></td>
		</tr>
		<tr>
			<td>Department: </td>
			<td><input type="text" name="department" value="<%=rs.getString("department")%>"></td>
		</tr>
		<tr>
			<td>Email: </td>
			<td><input type="text" name="email" value="<%=rs.getString("email")%>"></td>
		</tr>
		<tr>
			<td>Phone: </td>
			<td><input type="text" name="phone" value="<%=rs.getLong("phone")%>"></td>
		</tr>
		<tr>
			<td><input type="submit"  value="Update"></td>
		</tr>
		<tr>
			<td><a href="manager_home.html">Home</a></td>
		</tr>
		<% 
		}		
		%>
	</table>
	</form>
	

</body>
</html>