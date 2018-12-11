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
<script type="text/javascript" src="js/modal.js"></script>
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
					<li><a href="#">학적 정보</a></li>
					<li><a href="#">신상 정보/개인 설정</a></li>
				</ul>
			</li>
            <li>
				<a href="#" class="nav-ico3 depth">과목 정보</a>
				<ul>
					<li><a href="#">담당 과목</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">담당 과목 내역</h2>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>학번</th>
                        <th>이름</th>
                        <th colspan=2>성적</th>
                    </tr>
                </thead>
                <tbody>
                <%
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		try {
	                		String sql = "select a.studentID, a.grade, b.name from course a, user b where a.studentID = b.id and lectureNumber = ?";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ps.setString(1,"14770-01");
	            			ResultSet rs = ps.executeQuery();
	            			
	            			int i=1;
	            			
	            			while(rs.next()) {
	            				out.print("<tr>");
	            				out.print("<td>"+i+"</td>");
	            				out.print("<td>"+rs.getString("studentID")+"</td>");
	            				out.print("<td>"+rs.getString("name")+"</td>");
	            				out.print("<td>"+rs.getString("grade")+"</td>");
	            				out.print("<td><select name='grade'><option value='A+'>A+</option><option value='A0'>A0</option><option value='B+'>B+</option><option value='B0'>B0</option><option value='C+'>C+</option><option value='C0'>C0</option><option value='D+'>D+</option><option value='D0'>D0</option><option value='F'>F</option></select><button onclick='test()'>입력/수정</button></td>");
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
<script>
	function test() {
	var test = $("#201602015").find("td:nth-child(5)").text();
	alert(test);
	}
</script>
</body>
</html>