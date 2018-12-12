<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
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
				<a href="#" class="nav-ico2 depth">사용자 관리</a>
				<ul>
					<li><a href="#">학번 부여</a></li>
					<li><a href="#">학적 변경</a></li>
				</ul>
			</li>
            <li>
				<a href="#" class="nav-ico3 depth">장학 관리</a>
				<ul>
					<li><a href="#">신규 장학 등록</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">신규 장학 등록</h2>
			<form action="addScholarship.jsp" method="post">
				<table>
					<thread>
						<tr>
							<th>학번</th>
                        	<th>장학명</th>
                        	<th>년도학기</th>
                        	<th>장학금</th>
						</tr>
					</thread>
					<tbody>
						<tr>
							<td><input type="text" id="studentID" name="studentID" style="width:100%"></td>
							<td><input type="text" id="scholarshipName" name="scholarshipName" style="width:100%"></td>
							<td><input type="text" id="semester" name="semester" style="width:100%"></td>
							<td><input type="text" id="amount" name="amount" style="width:100%"></td>
						</tr>
					</tbody>
				</table>
				<br/>
				<input type="submit" value="신규 등록" style="height:30px; width:45px">
			</form>
			<br/><br/>
			<h2>장학 목록</h2>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>학번</th>
                        <th>장학명</th>
                        <th>년도학기</th>
                        <th>장학금</th>
                    </tr>
                </thead>
                <tbody>
                    <%
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		try {
	                		String sql = "select * from scholarship";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ResultSet rs = ps.executeQuery();
	            			
	            			int i=1;
	            			
	            			while(rs.next()) {
	            				out.print("<tr id = "+rs.getString("studentID")+">");
	            				out.print("<td>"+i+"</td>");
	            				out.print("<td>"+rs.getString("studentID")+"</td>");
	            				out.print("<td>"+rs.getString("scholarshipName")+"</td>");
	            				out.print("<td>"+rs.getString("semester")+"</td>");
	            				out.print("<td>"+rs.getString("amount")+"</td>");
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