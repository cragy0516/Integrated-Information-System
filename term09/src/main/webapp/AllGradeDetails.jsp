<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="asideStudent.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">성적 조회</h2>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>년도/학기</th>
                        <th>과목번호</th>
                        <th>교과목명</th>
                        <th>학점</th>
                        <th>성적</th>
                        <th>재이수 여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>2018/1</td>
                        <td>20182018</td>
                        <td>소프트웨어공학</td>
                        <td>3</td>
                        <td>A+</td>
                        <td></td>
                    </tr>
                
                </tbody>
            </table>
		</div>
	</div>
</div>
<div class="dim"></div>
</body>
</html>
