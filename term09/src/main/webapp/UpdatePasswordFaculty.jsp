<!-- UpdatePasswordFaculty -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
Object s_name = session.getAttribute("sessionID");
Object s_perm = session.getAttribute("sessionPERM");
String name = "DEFAULT_NAME";
String perm = "DEFAULT_PERMISSION";
String perm_tmp = "";

if (s_name != null && s_perm != null) {
	name = s_name.toString();
	perm_tmp = (String) s_perm;
	if (perm_tmp.equals("faculty")) perm = "교원";
	else if (perm_tmp.equals("student")) perm = "학생";
	else if (perm_tmp.equals("admin")) perm = "관리자";
}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>   
<div id="wrap">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="asideFaculty.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">기본 정보 관리</h2>
			<form method="post" action="editPassword.jsp" onsubmit="return checkValue()">
			<div id="passwordForm">
				<input type="hidden" name="userID" value="<%=name%>">
				기존 비밀번호 <input type="password" id="originPassword" name="originPassword"><br>
				새로운 비밀번호 <input type="password" id="newPassword" name="newPassword"><br>
				새로운 비밀번호 확인 <input type="password" id="confirmPassword" name="confirmPassword"><br>
				</div><br>
				<input type="submit" class="search-btn" value="변경">
			</form>
		</div>
	</div>
</div>
<div class="dim"></div>
<script>
function checkValue() {
	if(document.getElementById("newPassword").value.length < 2 ) {
		alert("2자 이상의 비밀번호를 입력하세요");
		return false;
	}
	if(!document.getElementById("newPassword").value || !document.getElementById("confirmPassword").value) {
		alert("비밀번호를 입력하세요");
		return false;
	}
	if( document.getElementById("newPassword").value != document.getElementById("confirmPassword").value ) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}
</script>
</body>
</html>