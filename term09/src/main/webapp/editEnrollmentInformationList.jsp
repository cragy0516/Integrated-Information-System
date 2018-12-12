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
	<jsp:include page="asideAdmin.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">학적 정보 조회 및 수정</h2>
			<form action="editEnrollmentInformationList.jsp" method="get">
				<select name="option">
					<option value="0">학번/교번</option>
					<option value="1">이름</option>
				</select>
				<input type="text" name="search">
				<input type="submit" class="search-btn" value="검색">
			</form>
			<br>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>학번/교번</th>
                        <th>이름</th>
                        <th>성별</th>
                        <th>연락처</th>
                        <th>생년월일</th>
                        <th>주소</th>
                        <th>학적 정보 수정</th>
                    </tr>
                </thead>
                <tbody>
                	<%
                	
                	if( searchValue == "" || searchValue == null){
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		
	            		try {
	                		String sql = "select * from user";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ResultSet rs = ps.executeQuery();
	            			
	            			while(rs.next()) {
	            				out.print("<tr>");
	            				out.print("<td>"+rs.getString("id")+"</td>");
	            				out.print("<td>"+rs.getString("name")+"</td>");
	            				out.print("<td>"+rs.getString("sex")+"</td>");
	            				out.print("<td>"+rs.getString("phone")+"</td>");
	            				out.print("<td>"+rs.getString("birth")+"</td>");
	            				out.print("<td>"+rs.getString("address")+"</td>");
	            				out.print("<td><a href='editEnrollmentInformationDetail.jsp?id="+rs.getString("id")+"'> 수정 </a></td>");
	            				out.print("</tr>");
	            			}
	            			ps.close();
	            			rs.close();
	            			conn.close();
	            		}
	            		catch(Exception e ) {
	            			System.out.print(e.getMessage());
	            		}
                	} else {
                		if( searchOption.equals("0") ) { // 학번, 교번으로 검색
                			Database dbCon = new Database();
    	            		Connection conn = dbCon.GetConnection();
    	            		
    	            		try {
    	                		String sql = "select * from user where id like '"+searchValue+"%'";
    	            			PreparedStatement ps = conn.prepareStatement(sql);
    	            			ResultSet rs = ps.executeQuery();
    	            			
    	            			while(rs.next()) {
    	            				out.print("<tr>");
    	            				out.print("<td>"+rs.getString("id")+"</td>");
    	            				out.print("<td>"+rs.getString("name")+"</td>");
    	            				out.print("<td>"+rs.getString("sex")+"</td>");
    	            				out.print("<td>"+rs.getString("phone")+"</td>");
    	            				out.print("<td>"+rs.getString("birth")+"</td>");
    	            				out.print("<td>"+rs.getString("address")+"</td>");
    	            				out.print("<td><a href='editEnrollmentInformationDetail.jsp?id="+rs.getString("id")+"'> 수정 </a></td>");
    	            				out.print("</tr>");
    	            			}
    	            			ps.close();
    	            			rs.close();
    	            			conn.close();
    	            		}
    	            		catch(Exception e ) {
    	            			System.out.print(e.getMessage());
    	            		}
                		}
                		else if( searchOption.equals("1") ) { // 이름으로 검색
                			Database dbCon = new Database();
    	            		Connection conn = dbCon.GetConnection();
    	            		
    	            		try {
    	                		String sql = "select * from user where name like '"+searchValue+"%'";
    	            			PreparedStatement ps = conn.prepareStatement(sql);
    	            			ResultSet rs = ps.executeQuery();
    	            			
    	            			while(rs.next()) {
    	            				out.print("<tr>");
    	            				out.print("<td>"+rs.getString("id")+"</td>");
    	            				out.print("<td>"+rs.getString("name")+"</td>");
    	            				out.print("<td>"+rs.getString("sex")+"</td>");
    	            				out.print("<td>"+rs.getString("phone")+"</td>");
    	            				out.print("<td>"+rs.getString("birth")+"</td>");
    	            				out.print("<td>"+rs.getString("address")+"</td>");
    	            				out.print("<td><a href='editEnrollmentInformationDetail.jsp?id="+rs.getString("id")+"'> 수정 </a></td>");
    	            				out.print("</tr>");
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