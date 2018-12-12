<!-- 신상정보 -->
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
	String name = "";
	String sex = "";
	String phone = "";
	String birth = "";
	String address = "";
	String email = "";
	
	try {
		// check id and password for admin
		
		String sql = "select * from user where id='" + id + "'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			name = rs.getString("name");
			sex = rs.getString("sex");
			phone = rs.getString("phone");
			birth = rs.getString("birth");
			address = rs.getString("address");
			email = rs.getString("email");
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
			<h2 class="page-title">기본 정보 관리</h2>
			<form name="personalForm" method="post" action="editPersonalInfoAction.jsp">
				<div class="ipt mt0">
					<h3>이름</h3>
					<span class="box">
						<input type="text" id="ipt-name" class="ipt-txt" value="<%=name%>" disabled />
					</span>
				</div>
				<div class="ipt mt0">
					<h3>성별</h3>
					<span class="box">
						<input type="text" id="ipt-sex" class="ipt-txt" value="<%=sex%>" disabled />
					</span>
				</div>
				<div class="ipt mt0">
					<h3>생년월일</h3>
					<span class="box">
						<input type="text" id="ipt-birth" class="ipt-txt" value="<%=birth%>" disabled />
					</span>
				</div>
				<div class="ipt">
					<h3>주소</h3>
					<span class="box">
						<input type="text" id="ipt-address" class="ipt-txt" title="주소" value="<%=address%>" name="address" />
						<input type="submit" class="btn-save" value="저장" />
					</span>
					<button class="btn-cancel">취소</button>
				</div>
				<div class="ipt">
					<h3>핸드폰 번호</h3>
					<span class="box">
						<input type="text" id="ipt-phone" class="ipt-txt" title="핸드폰 번호" value="<%=phone%>" name="phone" />
						<input type="submit" class="btn-save" value="저장" />
					</span>
					<button class="btn-cancel">취소</button>
				</div>
				<div class="ipt">
					<h3>이메일</h3>
					<span class="box">
						<input type="text" id="ipt-email" class="ipt-txt" title="이메일" value="<%=email%>" name="email" />
						<input type="submit" class="btn-save" value="저장" />
					</span>
					<button class="btn-cancel">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="dim"></div>
</body>
</html>