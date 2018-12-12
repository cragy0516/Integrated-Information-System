<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="Service.adminService" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	adminService as = new adminService();
	String userName = request.getParameter("userName");
	String userID = request.getParameter("userID");
	String password = request.getParameter("password");
	String sex = request.getParameter("sex");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String permission = request.getParameter("permission");
	String department = request.getParameter("department"); // 소속
	String degree = request.getParameter("degree"); // 학사 석사

	boolean addResult = as.addUser(userName, userID, password, sex, phone, birth, address, email,permission, department, degree);

%>
<!DOCTYPE html>
<html>
	<head></head>
	<body>
	<%
	if( addResult == true ) { %>
		<script> alert("성공적으로 추가되었습니다."); window.location.href="giveNumber.jsp";</script>
	<%
	} else { %>
	<script>alert("추가할 수 없습니다."); window.location.href="giveNumber.jsp";</script>
	<% } %>
	</body>
</html>	