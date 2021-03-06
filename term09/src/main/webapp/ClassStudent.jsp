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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="asideFaculty.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h2 class="page-title">수강 학생 정보</h2>
            <table id="grade-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>학번</th>
                        <th>이름</th>
                        <th>성적</th>
                        <th colspan=2>성적수정</th>
                    </tr>
                </thead>
                <tbody>
                <%
	                	Database dbCon = new Database();
	            		Connection conn = dbCon.GetConnection();
	            		String lectureNumber = request.getParameter("lectureNumber");
	            		try {
	                		String sql = "select a.studentID, a.grade, b.name from course a, user b where a.studentID = b.id and lectureNumber = ?";
	            			PreparedStatement ps = conn.prepareStatement(sql);
	            			ps.setString(1, lectureNumber);
	            			ResultSet rs = ps.executeQuery();
	            			
	            			int i=1;
	            			
	            			while(rs.next()) {
	            				String stdid = rs.getString("studentID");
	            				out.print("<tr id = "+rs.getString("studentID")+">");
	            				out.print("<td>"+i+"</td>");
	            				out.print("<td>"+rs.getString("studentID")+"</td>");
	            				out.print("<td>"+rs.getString("name")+"</td>");
	            				out.print("<td>"+rs.getString("grade")+"</td>");
	            				out.print("<td><select name='grade"+stdid+"' id='grade"+stdid+"'><option value='A+'>A+</option><option value='A0'>A0</option><option value='B+'>B+</option><option value='B0'>B0</option><option value='C+'>C+</option><option value='C0'>C0</option><option value='D+'>D+</option><option value='D0'>D0</option><option value='F'>F</option></td>");
	            				out.print("<td></select><button onclick=test('"+stdid+"')>입력/수정</button></td>");
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
	function test(target) {
		var t = document.getElementById("grade"+target);
		var grade = t.options[t.selectedIndex].text;
		$.post("updategrade.jsp",
                {
                   "studentID":target,
                   "grade":grade
                },
                function(data,status) {
                	alert(data);
                	window.location.reload();
                }   
          );
	}
</script>
</body>
</html>