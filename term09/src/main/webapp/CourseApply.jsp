<!--  수강 신청 -->
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
<div id="wrap">
	<div id="header">
		<div class="inner">
			<a href="#" class="user-select">
				<span class="name">
					<strong>이미진</strong>
					<span>학생</span>
				</span>
				<img src="img/good.png" class="thumb" alt="" />
			</a>
		</div>
	</div>
	<div id="aside">
		<h1><a href="#">학사정보시스템</a></h1>
		<ul id="nav">
			<li>
				<a href="#" class="nav-ico2 depth">학사 행정</a>
				<ul>
					<li><a href="EnrollmentInformation.jsp">학적 정보</a></li>
					<li><a href="PersonalInformaion.jsp">신상 정보/개인 설정</a></li>
				</ul>
			</li>
            <li>
				<a href="#" class="nav-ico3 depth">과목 정보</a>
				<ul>
					<li><a href="CourseReference.jsp">수강 편람 조회</a></li>
				</ul>
			</li>
			<li>
				<a href="#" class="nav-ico2 depth">수강 정보</a>
				<ul>
					<li><a href="CourseDetails.jsp">수강 내역</a></li>
					<li><a href="CourseApply.jsp">수강 신청</a></li>
                    <li><a href="Timetable.jsp">시간표</a></li>
				</ul>
			</li>
			<li>
				<a href="#" class="nav-ico3 depth">성적 정보</a>
				<ul>
					<li><a href="GradeDetails.jsp">성적 조회</a></li>
					<li><a href="AllGradeDetails.jsp">전체 성적 조회</a></li>
				</ul>
			</li>
			<li>
				<a href="#" class="nav-ico4 depth">장학 조회</a>
				<ul>
					<li><a href="ScholarshipList.jsp">장학금 수여 내역</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">수강 신청</h2>
			<form action="addCourse.jsp" method="post">
				학수번호
				<input type="text" id="applyValue" name="applyValue">
				<input type="submit" class="search-btn" value="신청">
			</form>
			<br><br>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>년도학기</th>
                        <th>학수번호</th>
                        <th>과목명</th>
                        <th>학점</th>
                        <th>담당교수</th>
                        <th>강의 시간</th>
                    </tr>
                </thead>
                <tbody>
                	<%
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		try {
	                		String sql = "select * from subject where lectureSemester='2018/2학기'";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ResultSet rs = ps.executeQuery();
	            			int i=1;
	            			
	            			while(rs.next()) {
	            				out.print("<tr>");
	            				out.print("<td>"+i+"</td>");
	            				out.print("<td>"+rs.getString("lectureSemester")+"</td>");
	            				out.print("<td>"+rs.getString("lectureNumber")+"</td>");
	            				out.print("<td>"+rs.getString("name")+"</td>");
	            				out.print("<td>"+rs.getInt("creditHour")+"</td>");
	            				out.print("<td>"+rs.getString("professor")+"</td>");
	            				out.print("<td>"+rs.getString("lectureTime")+"</td>");
	            				out.print("</tr>");
	            				i++;
	            			}
	            			ps.close();
	            			rs.close();
	            			conn.close();
	            		}
	            		catch(Exception e ) {
	            			System.out.print(e.getMessage());
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