<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
   String studentID = request.getParameter("studentID");
   String scholarshipName = request.getParameter("scholarshipName");
   String semester = request.getParameter("semester");
   String amount = request.getParameter("amount");
   Database dbCon = new Database();
   Connection conn = dbCon.GetConnection();
   boolean result = false;
   
   if(studentID.equals("")||scholarshipName.equals("")||semester.equals("")||amount.equals("")){
	   result = false;
   }else{
   		try {
      		String sqlq = "select exists ( select * from studentInfo where id = ?) as ex;";
      		PreparedStatement pss = conn.prepareStatement(sqlq);
      		pss.setString(1, studentID);
      		ResultSet rs = pss.executeQuery();
      		rs.next();
      		String exsist = rs.getString("ex");
      
      		if(exsist.equals("1")){
         		String sql = "insert into scholarship values(?,?,?,?);";
         		PreparedStatement ps = conn.prepareStatement(sql);
         		ps.setString(1,studentID);
         		ps.setString(2,scholarshipName);
         		ps.setString(3,semester);
         		ps.setString(4,amount);
         		ps.executeUpdate();
         		ps.close();
         		conn.close();
         		pss.close();
         		result = true;
      		}
      		else{
         		result = false;
      		}
   		}
   		catch(Exception e ) {
      		System.out.print(e.getMessage());
      		result = false;
   		}
   }
%>
<!DOCTYPE html>
<html>
   <head></head>
   <body>
   <%
   if( result == true ) { %>
      <script> alert("성공적으로 저장되었습니다."); 
      location.href = "Scholarship.jsp";
      </script>
   <%
   } else { %>
   <script>alert("저장에 실패했습니다."); history.go(-1);</script>
   <% } %>
   </body>
</html> 