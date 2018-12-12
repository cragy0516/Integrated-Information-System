<!--  수강 내역 -->
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
	<jsp:include page="asideStudent.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">학번 부여</h2>
				<br>
				<form action="addUser.jsp" method="post">
					이름 <input type="text" class="plan-input" name="name"><br>
					아이디(학번) <input type="text" class="plan-input" name="name"><br>
					패스워드 <input type="password" class="plan-input" name="password"><br>
					성별 <input type="text" class="plan-input" name="sex"><br>
					연락처 <input type="tel" class="plan-input" name="phone"><br>
					생년월일 <input type="date" class="plan-input" name="birth"><br>
					주소 <input type="text" class="plan-input" name="address"><br>
					이메일 <input type="email" class="plan-input" name="email"><br>
					<p>---------------------------------------------------</p>
					<select name="division">
						<option value="0">교원</option>
						<option value="1">학생</option>
					</select><br>
					<div id="course">
					과정 <input type="text" class="plan-input" name="course"><br>
					</div>
			</form>
		</div>
	</div>
</div>
<div class="dim"></div>

</body>
</html>
