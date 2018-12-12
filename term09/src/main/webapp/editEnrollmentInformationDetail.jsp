<!--  수강 편람 조회 -->
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
	String id = request.getParameter("id");
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	String name = "";
	String sex = "";
	String phone = ""; 
	String birth = "";
	String address = "";
	String email = "";
	String perm = "";
	String dept = "";
	String degree = "";
	String permission = "";
	
	try {
		// check id and password for admin
		
		String sql = "select * from user where id='" + id + "'";
		String sql2 = "";
		PreparedStatement ps = conn.prepareStatement(sql);
		PreparedStatement ps2 = null;
		ResultSet rs = ps.executeQuery();
		ResultSet rs2 = null;
		
		if (rs.next()) {
			name = rs.getString("name");
			sex = rs.getString("sex");
			phone = rs.getString("phone");
			birth = rs.getString("birth");
			address = rs.getString("address");
			email = rs.getString("email");
			perm = rs.getString("permission");
			if (perm.equals("0")) {
				permission = "교원";
				sql2 = "select * from facultyInfo where id='" + id + "'";
				ps2 = conn.prepareStatement(sql2);
				rs2 = ps2.executeQuery();
				if (rs2.next()) {
					dept = rs2.getString("department");
				}
			} else {
				permission = "학생";
				sql2 = "select * from studentInfo where id='" + id + "'";
				ps2 = conn.prepareStatement(sql2);
				rs2 = ps2.executeQuery();
				if (rs2.next()) {
					dept = rs2.getString("department");
					degree = rs2.getString("degree");
				}
			}
		}
		
		ps.close();
		ps2.close();
		rs.close();
		rs2.close();
		conn.close();
	} catch(Exception e ) {
		System.out.print(e.getMessage());
	}
%>
<div id="wrap">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="asideAdmin.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">학적 정보 수정</h2>
			<form name="personalForm" method="get" action="editEnrollmentInformationAction.jsp">
				<div class="ipt mt0">
					<h3>구분</h3>
					<span class="box">
						<input type="text" id="ipt-permission" class="ipt-txt" value="<%=permission%>" disabled />
						<input type="hidden" value="<%=permission%>" name="permission" />
					</span>
				</div>
				<div class="ipt mt0">
					<h3>학번/교번</h3>
					<span class="box">
						<input type="text" id="ipt-id" class="ipt-txt" value="<%=id%>" name="id" disabled />
					</span>
				</div>
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
						<input type="text" id="ipt-address" class="ipt-txt" title="주소" value="<%=address%>" disabled />
					</span>
				</div>
				<div class="ipt">
					<h3>핸드폰 번호</h3>
					<span class="box">
						<input type="text" id="ipt-phone" class="ipt-txt" title="핸드폰 번호" value="<%=phone%>" disabled />
					</span>
				</div>
				<div class="ipt">
					<h3>이메일</h3>
					<span class="box">
						<input type="text" id="ipt-email" class="ipt-txt" title="이메일" value="<%=email%>" disabled />
					</span>
				</div>
				<div class="ipt">
					<h3>소속</h3>
					<span class="box">
						<input type="text" id="ipt-dept" class="ipt-txt" title="소속" value="<%=dept%>" name="department"/>
						<input type="submit" class="btn-save" value="저장" />
					</span>
					<button class="btn-cancel">취소</button>
				</div>
				<%
				if (permission.equals("학생")) {
					%>
					<div class="ipt">
					<h3>학사과정</h3>
					<span class="box">
						<input type="text" id="ipt-degree" class="ipt-txt" title="학사과정" value="<%=degree%>" name="degree"/>
						<input type="submit" class="btn-save" value="저장" />
					</span>
					<button class="btn-cancel">취소</button>
					</div>
					<%
				}
				%>
			</form>
		</div>
	</div>
</div>
<div class="dim"></div>
</body>
</html>