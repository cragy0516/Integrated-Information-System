<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String studentID = request.getParameter("studentID");
	String scholarshipName = request.getParameter("scholarshipName");
	String semester = request.getParameter("semester");
	String amount = request.getParameter("amount");
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	boolean result = false;
	try {
		String sql = "update scholarship set studentID=?, scholarship = ?, ratio = ?, content = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,studentID);
		ps.setString(2,scholarshipName);
		ps.setString(3,semester);
		ps.setString(4,amount);
		ps.executeUpdate();
		ps.close();
		conn.close();
		result = true;
	}
	catch(Exception e ) {
		System.out.print(e.getMessage());
		result = false;
	}
%>
<!DOCTYPE html>
<html>
	<head></head>
	<body>
	<%
	if( result == true ) { %>
		<script> alert("성공적으로 저장되었습니다."); history.go(-2);</script>
	<%
	} else { %>
	<script>alert("저장에 실패했습니다."); history.go(-2);</script>
	<% } %>
	</body>
</html>	