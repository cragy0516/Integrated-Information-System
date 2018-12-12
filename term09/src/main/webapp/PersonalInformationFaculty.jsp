<!-- 신상정보 -->
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
			<h2 class="page-title">기본 정보 관리</h2>

			<div class="ipt mt0">
				<h3>이름</h3>
				<span class="box">
					<input type="text" id="ipt-name" class="ipt-txt" value="이미진" disabled />
				</span>
				<button class="btn-cancel">취소</button>
			</div>
			<div class="ipt">
				<h3>핸드폰 번호</h3>
				<span class="box">
					<input type="text" id="ipt-phone" class="ipt-txt" title="담당자 연락처" value="01012345678" />
					<button class="btn-save">저장</button>
				</span>
				<button class="btn-cancel">취소</button>
			</div>
            <div class="ipt">
				<h3>이메일</h3>
				<span class="box">
					<input type="text" id="ipt-phone" class="ipt-txt" title="담당자 연락처" value="01012345678" />
					<button class="btn-save">저장</button>
				</span>
				<button class="btn-cancel">취소</button>
			</div>
            <div class="ipt">
				<h3>주소</h3>
				<span class="box">
					<input type="text" id="ipt-phone" class="ipt-txt" title="담당자 연락처" value="01012345678" />
					<button class="btn-save">저장</button>
				</span>
				<button class="btn-cancel">취소</button>
			</div>
		</div>
	</div>
</div>
<div class="dim"></div>
</body>
</html>