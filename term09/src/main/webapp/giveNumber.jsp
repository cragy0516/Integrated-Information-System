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
	<jsp:include page="asideAdmin.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">학번 부여</h2>
				<br>
				<form action="giveNumber.jsp" id="giveNumberForm" method="get">
					이름 <input type="text" class="plan-input" name="name"><br><br>
					아이디(학번) <input type="text" class="plan-input" name="name"><br><br>
					패스워드 <input type="password" class="plan-input" name="password"><br><br>
					성별 <input type="text" class="plan-input" name="sex"><br><br>
					연락처 <input type="tel" class="plan-input" name="phone"><br><br>
					생년월일 <input type="date" class="plan-input" name="birth"><br><br>
					주소 <input type="text" class="plan-input" name="address"><br><br>
					이메일 <input type="email" class="plan-input" name="email"><br><br>
					<div class="line"></div>
					구분 <select id="select-division" name="division">
						<option value="">선택</option>
						<option value="0">교원</option>
						<option value="1">학생</option>
					</select><br><br>
					<div id="course">
					</div>
					<br><br>
					<input type="submit" class="search-btn" value="추가" >
			</form>
		</div>
	</div>
</div> 
<div class="dim"></div>
<script>
$("#course").html("");
	$("#select-division").change(function() {
		var selectedDivision = $("#select-division option:selected").val();
		if( selectedDivision == 0 ) {
			$("#course").html("");
		} 
		else if( selectedDivision == 1 ){
			$("#course").html('과정 <input type="text" class="plan-input" name="course"><br><br>');
		}
		else {
			$("#course").html("");
		}
	});
	
</script>
</body>
</html>
