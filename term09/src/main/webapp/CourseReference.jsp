<!--  수강 편람 조회 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%	String searchOption = request.getParameter("option");
	String searchValue = request.getParameter("search"); 
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
			<h2 class="page-title">수강 편람 조회</h2>
			<form action="CourseReference.jsp" method="get">
				<select name="option">
					<option value="0">학수번호</option>
					<option value="1">과목명</option>
				</select>
				<input type="text" name="search">
				<input type="submit" class="search-btn" value="검색">
			</form>
			<br>
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
                	
                	if( searchValue == "" || searchValue == null){
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		
	            		try {
	                		String sql = "select * from subject";
	            			PreparedStatement ps = conn.prepareStatement(sql);
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
                	}
                	else {
                		if( searchOption.equals("0") ) { // 학수번호로 검색
                			Database dbCon = new Database();
    	            		Connection conn = dbCon.GetConnection();
    	            		
    	            		try {
    	                		String sql = "select * from subject where lectureNumber like '"+searchValue+"%'";
    	            			PreparedStatement ps = conn.prepareStatement(sql);
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
                		}
                		else if( searchOption.equals("1") ) { // 과목명으로 검색
                			Database dbCon = new Database();
    	            		Connection conn = dbCon.GetConnection();
    	            		
    	            		try {
    	                		String sql = "select * from subject where name like '"+searchValue+"%'";
    	            			PreparedStatement ps = conn.prepareStatement(sql);
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
                		}
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