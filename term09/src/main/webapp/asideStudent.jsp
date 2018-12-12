<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
</head>
<body>
	<div id="aside">
		<h1><a href="#">학사정보시스템</a></h1>
		<ul id="nav">
			<li>
				<a href="#" class="nav-ico2 depth">학사 행정</a>
				<ul>
					<li><a href="EnrollmentInformation.jsp">학적 정보</a></li>
					<li><a href="PersonalInformation.jsp">신상 정보/개인 설정</a></li>
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
		<li id="logoutLi"><a href="logout.jsp">로그아웃</a></li>
		</ul>
	</div>
	
</body>