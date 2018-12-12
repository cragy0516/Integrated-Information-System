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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="asideFaculty.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">담당 과목 내역</h2>
			<% 
				Object s_name = session.getAttribute("sessionNAME");
				String name = String.valueOf(s_name);
			%>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>학수번호</th>
                        <th>과목명</th>
                        <th>학생관리</th>
                        <th>강의계획서관리</th>
                    </tr>
                </thead>
                <tbody>
                <%
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		try {
	                		String sql = "select * from subject where professor = ?";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ps.setString(1, name);
	            			ResultSet rs = ps.executeQuery();
	            			
	            			int i=1;
	            			
	            			while(rs.next()) {
	            				out.print("<tr id = "+rs.getString("lectureNumber")+">");
	            				out.print("<td>"+i+"</td>");
	            				out.print("<td>"+rs.getString("lectureNumber")+"</td>");
	            				out.print("<td>"+rs.getString("name")+"</td>");
	            				out.print("<td><a href="+"ClassStudent.jsp"+"?lectureNumber="+rs.getString("lectureNumber")+" method='post'>관리</a></td>");
	            				out.print("<td><a href="+"LecturePlan.jsp"+"?lectureNumber="+rs.getString("lectureNumber")+" method='post'>관리</a></td>");
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