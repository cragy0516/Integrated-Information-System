<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="Service.subjectService" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	subjectService ss = new subjectService();
	String userID = request.getParameter("userID");
	String applyValue = request.getParameter("applyValue");
	boolean isSubject = ss.isSubject(applyValue);
	boolean result = false;
	if( isSubject ) {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		
		try {
			String sql = "insert into course (studentID,lectureNumber) values (?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,userID);
			ps.setString(2,applyValue);
			ps.executeUpdate();
			ps.close();
			conn.close();
			result = true;
		}
		catch(Exception e ) {
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
		<script> alert("성공적으로 신청되었습니다."); history.go(-1);</script>
	<%
	} else { %>
	<script>alert("신청할 수 없습니다."); history.go(-1);</script>
	<% } %>
	</body>
</html>	
