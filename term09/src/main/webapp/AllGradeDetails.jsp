<!-- 전체 성적 조회 -->
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

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>전체 성적 조회</title>
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
				<h2 class="page-title">전체 성적 조회</h2>
				<table id="grade-table">
					<thead>
						<tr>
							<th>No</th>
							<th>년도/학기</th>
							<th>과목번호</th>
							<th>교과목명</th>
							<th>학점</th>
							<th>성적</th>
						</tr>
					</thead>

					<tbody>
						<%
							Object s_name = session.getAttribute("sessionID");
							Database dbCon = new Database();
							Connection conn = dbCon.GetConnection();
							try {
								String sql = "select * from course where studentID=?"; // 해당 학생의 과목을 가져옴
								PreparedStatement ps = conn.prepareStatement(sql);
								ps.setString(1, (String) s_name);
								ResultSet rs = ps.executeQuery();

								int i = 0;
								while (rs.next()) {
									String stu_ID = rs.getString("studentID"); // 학생번호
									String lecture_Num = rs.getString("lectureNumber"); // 과목번호
									String lecture_Grade = rs.getString("grade"); // 성적

									String subject_sql = "select * from subject where lectureNumber=?";
									PreparedStatement subject_ps = conn.prepareStatement(subject_sql);
									subject_ps.setString(1, (String) lecture_Num); // 과목 번호를 넣어서 과목 이름, 학기, 학점을 가져온다.
									ResultSet subject_rs = subject_ps.executeQuery();

									subject_rs.next();
									String lecture_Name = subject_rs.getString("name");
									String lecture_semester = subject_rs.getString("lectureSemester"); // 학기
									int lecture_CreditHour = subject_rs.getInt("creditHour");
						%>
						<tr>
							<td><%=++i%></td>
							<td><%=lecture_semester%></td>
							<td><%=lecture_Num%></td>
							<td><%=lecture_Name%></td>
							<td><%=lecture_CreditHour%></td>
							<td><%=lecture_Grade%></td>
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
