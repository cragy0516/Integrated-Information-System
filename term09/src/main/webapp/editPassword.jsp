<!-- editPassword -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="Service.subjectService" %>
<%@ page import="Service.userService" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String userID = request.getParameter("userID");
	String originPassword = request.getParameter("originPassword");
	String newPassword = request.getParameter("newPassword");
	userService us = new userService();
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	boolean result = false;
	String originDB = us.checkOrigin(userID);
	if( originDB.equals(originPassword)) {
		try {
			String sql = "update user set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,newPassword);
			ps.setString(2,userID);
			ps.executeUpdate(); 
			 
			ps.close();
			conn.close();
			result = true;
		} catch(Exception e ) {
			System.out.print(e.getMessage());
			result = false;
		}
	}
	else {
		result = false;
	}
	
	%>
	<!DOCTYPE html>
	<html>
		<head></head>
		<body>
		<%
		if( result == true ) { %>
			<script> alert("성공적으로 변경되었습니다.");history.go(-1);</script>
		<%
		} else { %>
		<script>alert("비밀번호를 변경할 수 없습니다."); history.go(-1);</script>
		<% } %>
		</body>
	</html>	
