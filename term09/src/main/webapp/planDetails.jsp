<!--  강의 계획서 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String lecture = request.getParameter("lecture");
	String lectureName = "";
	String outline = "";
	String presubject = "";
	String ratio = "";
	String content = "";
	if( lecture != null && lecture != "" ) {
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		try {
    		String sql = "select (select name from subject where lectureNumber=?) as subjectName, outline,presubject,ratio,content from lecturePlan where lectureNumber=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,lecture);
			ps.setString(2,lecture);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				lectureName = rs.getString("subjectName");
				outline = rs.getString("outline");
				presubject = rs.getString("presubject");
				ratio = rs.getString("ratio");
				content = rs.getString("content");
			}
			ps.close();
			rs.close();
			conn.close();
		}
		catch(Exception e ) {
			System.out.print(e.getMessage());
		}
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
			<h2 class="page-title">강의 계획서</h2>
			<br>
			<h3>과목명</h3>
			<input type="text" class="plan-input" value="<%=lectureName%>" readonly><br><br>
			<h3>학수번호</h3>
			<input type="text" class="plan-input" value="<%=lecture%>" readonly><br><br>
			<h3>수업개요</h3>
			<input type="text" class="plan-input" value="<%=outline%>" readonly><br><br>
			<h3>선수과목</h3>
			<input type="text" class="plan-input" value="<%=presubject%>" readonly><br><br>
			<h3>성적비율</h3>
			<input type="text" class="plan-input" value="<%=ratio%>" readonly><br><br>
			<h3>상세사항</h3>
			<input type="text" class="plan-input" value="<%=content%>" readonly><br><br>
		</div>
	</div>
</div>
<div class="dim"></div>
</body>
</html>