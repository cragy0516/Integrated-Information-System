<!--  장학 내역 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="Dao.Database"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>
<%
	Object s_name = session.getAttribute("sessionID");
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	try {
		String sql = "select * from scholarship where studentID=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, (String) s_name);
		ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>장학금 수여 내역</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="asideStudent.jsp"></jsp:include>
		<div id="container">
			<div id="contents">
				<h2 class="page-title">장학금 수여 내역</h2>
				<table id="grade-table">
					<thead>
						<tr>
							<th class="th">장학금명</th>
							<th class="th">학기</th>
							<th class="th">장학금액</th>
						</tr>
					</thead>

					<tbody>
						<%
							while (rs.next()) {
									String stu_ID = rs.getString("studentID"); // 학생번호
									String scholarship_name = rs.getString("scholarshipName"); // 장학금명
									String semester = rs.getString("semester"); // 학기
									int amount = rs.getInt("amount"); // 장학금액
						%>
						<tr>
							<td><%=scholarship_name%></td>
							<td><%=semester%></td>
							<td><%=amount%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="dim"></div>
</body>
</html>
<%
	ps.close();
		rs.close();
		conn.close();
	} catch (Exception e) {
		System.out.print(e.getMessage());
	}
%>