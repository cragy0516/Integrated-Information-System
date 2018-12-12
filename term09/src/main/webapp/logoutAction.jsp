<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그아웃 처리</title>
</head>
<body>
	<%
		Object s_name = session.getAttribute("sessionID");
		Object s_perm = session.getAttribute("sessionPERM");
		if (s_name != null && s_perm != null) {
			session.invalidate();
			response.getWriter().print("<script> alert(\"로그아웃 되었습니다.\");");
		} else {
			response.getWriter().print("<script> alert(\"먼저 로그인 하세요.\");");
		}
		
		response.getWriter().print("window.location.href='login.jsp' </script>");
		response.getWriter().flush();
	%>
</body>
</html>