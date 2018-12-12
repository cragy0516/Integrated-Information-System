<!--  수강 내역 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	Object s_name = session.getAttribute("sessionID");
	Object s_perm = session.getAttribute("sessionPERM");
	String name = "DEFAULT_NAME";
	String perm = "DEFAULT_PERMISSION";
	String perm_tmp = "";

	if (s_name != null && s_perm != null) {
		name = s_name.toString();
		perm_tmp = (String) s_perm;
		if (perm_tmp.equals("faculty")) perm = "교원";
		else if (perm_tmp.equals("student")) perm = "학생";
		else if (perm_tmp.equals("admin")) perm = "관리자";
	}
%>
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
			<h2 class="page-title">수강 내역</h2>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>년도학기</th>
                        <th>학수번호</th>
                        <th>과목명</th>
                        <th>학점</th>
                        <th>담당교수</th>
                        <th>강의 시간</th>
                    </tr>
                </thead>
                <tbody>
                	<%
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		try {
	                		String sql = "select * from subject where lectureNumber = any(select lectureNumber from course where studentID=?)";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ps.setString(1,name);
	            			ResultSet rs = ps.executeQuery();
	            			int i=1;
	            			
	            			while(rs.next()) {
	            				out.print("<tr>");
	            				out.print("<td>"+i+"</td>");
	            				out.print("<td>"+rs.getString("lectureSemester")+"</td>");
	            				out.print("<td>"+rs.getString("lectureNumber")+"</td>");
	            				out.print("<td>"+rs.getString("name")+"</td>");
	            				out.print("<td>"+rs.getInt("creditHour")+"</td>");
	            				out.print("<td>"+rs.getString("professor")+"</td>");
	            				out.print("<td>"+rs.getString("lectureTime")+"</td>");
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
