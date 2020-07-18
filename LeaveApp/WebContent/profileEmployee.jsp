<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#eeffcc">
<br><br><br><br><br><br>
<h1 style="text-align:center">Application Status</h1>
<table text-align="center" height= "100" width="450" align="center" border="2">
<tr>
<td>Employee ID</td>
<td>User Name</td>
<td>Department</td>
<td>Email</td>
<td>Phone</td>
<td>Remaining Leave Days</td>
</tr>
<% 
int mid = (Integer) session.getAttribute("mid");
String url = "jdbc:mysql://localhost:3306/company";
String un = "root";
String pw = "Gautam1234@";

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url,un,pw);

PreparedStatement mps = con.prepareStatement("select * from apply where mid = ?");
mps.setInt(1,mid);

ResultSet mrs = mps.executeQuery();
int employeeID = 0;
if(mrs.next()){
	employeeID= mrs.getInt("eid");
}

PreparedStatement ps = con.prepareStatement("select * from employee where eid = ?");
ps.setInt(1,employeeID);

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
<a href="checkStatus.jsp">Back</a>
</td>
</tr>
</table>
</body>
</html>