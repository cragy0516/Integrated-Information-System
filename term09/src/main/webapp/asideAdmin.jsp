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
					<li><a href="giveNumber.jsp">학번 부여</a></li>
					<li><a href="editEnrollmentInformationList.jsp">학적 변경</a></li>
				</ul>
			</li>
			<li>
				<a href="#" class="nav-ico4 depth">장학 관리</a>
				<ul>
					<li><a href="Scholarship.jsp">장학생 등록</a></li>
				</ul>
			</li>
		<li id="logoutLi"><a href="logoutAction.jsp">로그아웃</a></li>
		</ul>
	</div>
	
</body>