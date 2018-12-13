<!--  시간표 -->
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
<title>시간표</title>
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
				<%
					Object s_name = session.getAttribute("sessionID");
					Database dbCon = new Database();
					Connection conn = dbCon.GetConnection();

					try {
						String semester_sql = "select lectureSemester from subject";
						PreparedStatement semester_ps = conn.prepareStatement(semester_sql);
						ResultSet semester_rs = semester_ps.executeQuery();
						String semester_ = null;
						ArrayList<String> semester_Array = new ArrayList<String>();

						while (semester_rs.next()) {
							semester_ = semester_rs.getString("lectureSemester"); // 학기 가져오기
							if (!semester_Array.contains(semester_)) { // 학기가 포함이 안 되있으면
								semester_Array.add(semester_); // 배열에 학기 추가
							}
						}
				%>
				<form action="Timetable.jsp">
					<select id="select_semester" name="select_semester">
						<%
							for (int i = 0; i < semester_Array.size(); i++) {
						%>
						<option><%=(String) semester_Array.get(i)%></option>
						<%
							}
						%>
					</select> <input type="submit" value="선택" onclick=" select_semester();">
				</form>

				<%
					// 해당 학생이 듣는 과목을 가져옴.
					String sql = "select * from subject where lectureNumber = any(select lectureNumber from course where studentID=?) && lectureSemester =?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, (String) s_name);
					String semester = request.getParameter("select_semester");
					ps.setString(2, semester);
					ResultSet rs = ps.executeQuery();
					
					if (semester == null) {
						semester="";
					}
				%>

				<h2 class="page-title"><%=semester %> 시간표</h2>
				<table id="time-table">
					<thead>
						<tr>
							<th></th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
						</tr>
					</thead>
					<tbody>
						<%
							int start_time = 9;
							int end_time = 10;

							String timeTable[][] = new String[15][5]; // 시간표를 담는 배열
							String day_per_sub[] = null;
							String lecture_name = null;

							while (rs.next()) { // 과목을 하나 선택
								lecture_name = rs.getString("name"); // 과목명
								String time = rs.getString("lectureTime"); // 과목 요일과 시간
								day_per_sub = time.split(", "); // 과목당 요일별로 나누기

								for (int day_per_ = 0; day_per_ < 2; day_per_++) {
									char lecture_day = day_per_sub[day_per_].substring(0, 1).charAt(0);
									int lecture_start_time = Integer.parseInt(day_per_sub[day_per_].substring(1, 3));
									int lecture_end_time = Integer.parseInt(day_per_sub[day_per_].substring(7, 9));

									int i = 0;
									switch (lecture_day) {
									case '월':
										i = 0;
										break;
									case '화':
										i = 1;
										break;
									case '수':
										i = 2;
										break;
									case '목':
										i = 3;
										break;
									case '금':
										i = 4;
										break;
									}
									int index_j = lecture_start_time - 9;
									timeTable[index_j][i] = lecture_name;
									timeTable[index_j + 1][i] = lecture_name;
								}
							}

							for (int a = 0; a < 15; a++) {
								out.print("<tr>");
								out.print(
											"<td>" + String.valueOf(start_time) + ":00~" + String.valueOf(end_time) + ":00" + "</td>");

								for (int b = 0; b < 5; b++) {
									if (timeTable[a][b] != null) {
										out.print("<td>" + timeTable[a][b] + "</td>");
									} else {
										out.print("<td></td>");
									}
								}
								start_time++;
								end_time++;
								out.print("</tr>");
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