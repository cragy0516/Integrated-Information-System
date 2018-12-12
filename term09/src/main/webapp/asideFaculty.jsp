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
					<li><a href="EnrollmentInformationFaculty.jsp">학적 정보</a></li>
					<li><a href="PersonalInformationFaculty.jsp">신상 정보</a></li>
					<li><a href="UpdatePasswordFaculty.jsp">비밀번호 변경</a></li>
				</ul>
			</li>
            <li>
				<a href="#" class="nav-ico3 depth">과목 정보</a>
				<ul>
					<li><a href="ResponsibilitySubject.jsp">담당 과목</a></li>
				</ul>
			</li>
			<li id="logoutLi"><a href="logoutAction.jsp">로그아웃</a></li>
		</ul>
	</div>
	
</body>