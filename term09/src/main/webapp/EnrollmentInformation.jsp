<!--  학적 정보 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
<%
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	String id = (String) session.getAttribute("sessionID");
	String dept = "";
	String degree = "";
	
	try {
		// check id and password for admin
		
		String sql = "select * from studentInfo where id='" + id + "'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			dept = rs.getString("department");
			degree = rs.getString("degree");
		}
		
		ps.close();
		rs.close();
		conn.close();
	} catch(Exception e ) {
		System.out.print(e.getMessage());
	}
%>
<div id="wrap">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="asideStudent.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">학적 정보 관리</h2>
			<div class="ipt mt0">
				<h3>학번</h3>
				<span class="box">
					<input type="text" id="ipt-id" class="ipt-txt" value="<%=id%>" disabled />
				</span>
			</div>
			<div class="ipt mt0">
				<h3>소속 (학과)</h3>
				<span class="box">
					<input type="text" id="ipt-dept" class="ipt-txt" value="<%=dept%>" disabled />
				</span>
			</div>
			<div class="ipt mt0">
				<h3>학사과정</h3>
				<span class="box">
					<input type="text" id="ipt-degree" class="ipt-txt" value="<%=degree%>" disabled />
				</span>
			</div>
		</div>
	</div>
</div>
<div class="dim"></div>
</body>
</html>
