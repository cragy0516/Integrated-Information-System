<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
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
					<li><a href="ResponsibilitySubject.jsp">담당 과목</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">강의계획서 수정</h2>
			<form action="addLecturePlan.jsp" method="post">
            <table>
            	<tr>
            		<td style="width: 100px">수업개요</td>
            		<td>
						<input type="text" id="outline" name="outline" style="width: 100%">
					</td>
            	</tr>
            	<tr>
            	<td>선수과목</td>
            	<td><input type="text" id="presubject" name="presubject" style="width: 100%"></td>
            	</tr>
            	<tr>
            	<td>성적비율</td>
            	<td><input type="text" id="ratio" name="ratio" style="width: 100%"></td>
            	</tr>
            	<tr>
            	<td>상세사항</td>
            	<td><input type="text" id="content" name="content" style="width: 100%"></td>
            	</tr>
            </table>
            <input type="submit" class="search-btn" value="저장">
            </form>
		</div>
	</div>
</div>
<div class="dim"></div>
<div id-"grademodify" class="modal">
	<div class="grademodify-content">
		<span class="close">&times;</span>
		<p></p>
	</div>
</body>
</html>