<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Service.gradeservice" %>
<%
	
 %>
<!DOCTYPE html>
<html>
	<head></head>
	<body>
	<%
		gradeservice gs = new gradeservice();
	 	String studentID = request.getParameter("studentID");
	 	String grade = request.getParameter("grade");
	   
	 	boolean editResult = gs.updategrade(studentID, grade);
	 	if( editResult) {
	    	response.getWriter().print("성적이 성공적으로 반영되었습니다.");
	 	}
	   else {
	      response.getWriter().print("성적 반영에 실패하였습니다.");
	   }
	%>
	</body>
</html>	