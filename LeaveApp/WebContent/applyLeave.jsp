<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>


<%
		int eid = (Integer)session.getAttribute("eid");
		
 		String url = "jdbc:mysql://localhost:3306/company";
 		String un = "root";
 		String pw = "Gautam1234@";

 		Class.forName("com.mysql.cj.jdbc.Driver");

 		Connection con = DriverManager.getConnection(url, un, pw);
 		
 		PreparedStatement ps = con.prepareStatement("select * from employee where eid = ?");
 		ps.setInt(1,eid);
 		
 		ResultSet rs = ps.executeQuery();
 		String depart = null;
 		int leftDay = 0;
 		if(rs.next()){
 		depart = rs.getString("department");
 		leftDay = rs.getInt("holiday");
 		} 	
 		System.out.println(depart);
 		
 		PreparedStatement mps = con.prepareStatement("select * from manager where department = ?");
 		mps.setString(1, depart);
 		
 		ResultSet mrs = mps.executeQuery();
 		int managerID = 0;
 		
 		if(mrs.next()){
 			managerID = mrs.getInt("mid");
 		}
 		
 		System.out.println(managerID);
 		System.out.println(eid);
 		
 		String subject = request.getParameter("subject");
 		String reason = request.getParameter("reason");
 		String date = request.getParameter("date");
 		int day = Integer.parseInt(request.getParameter("day"));
 		if((leftDay - day) >= 0){
 		
 		PreparedStatement aps = con.prepareStatement("insert into apply (subject, reason, dt, days, eid, mid) values(?,?,?,?,?,?)");
 		
 		aps.setString(1,subject);
 		aps.setString(2,reason);
 		aps.setString(3,date);
 		aps.setInt(4,day); 		
 		aps.setInt(5,eid);
 		aps.setInt(6, managerID);
 		
 		int x = aps.executeUpdate();
 		if(x>0){
 			response.sendRedirect("employee_home.html");
 		}
 		}else{
 			response.sendError(leftDay, "You exceeded your number of holidays allowed");
 		}
 		
 %>
