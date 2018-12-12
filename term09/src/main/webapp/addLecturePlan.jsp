<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String outline = request.getParameter("outline");
	String presubject = request.getParameter("presubject");
	String ratio = request.getParameter("ratio");
	String content = request.getParameter("content");
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	boolean result = false;
	try {
		String sql = "update lecturePlan set outline=?, presubject = ?, ratio = ?, content = ? where lectureNumber = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,outline);
		ps.setString(2,presubject);
		ps.setString(3,ratio);
		ps.setString(4,content);
		ps.setString(5,"14770-01");
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