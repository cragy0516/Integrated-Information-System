<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object s_name = session.getAttribute("sessionID");
	Object s_perm = session.getAttribute("sessionPERM");
	String name = "DEFAULT_NAME";
	String perm = "DEFAULT_PERMISSION";
	String perm_tmp = "";

	if (s_name != null && s_perm != null) {
		name = s_name.toString();
		perm_tmp = s_perm.toString();
		if (perm_tmp == "admin") perm = "관리자";
		else if (perm_tmp == "user") perm = "학생";
	} else {
		// login required
	}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
</head>
<body>
<div id="header">
	<div class="inner">
		<a href="#" class="user-select">
			<span class="name">
				<strong><%=name%></strong>
				<span><%=perm%></span>
			</span>
			<img src="img/good.png" class="thumb" alt="" />
		</a>
	</div>
</div>
</body>