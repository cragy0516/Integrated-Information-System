<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="Service.subjectService" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String id = request.getParameter("id");
	String department = request.getParameter("department");
	String degree = request.getParameter("degree");
	String permission = request.getParameter("permission");
	
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	
	String location = "editEnrollmentInformationList.jsp";
	
	try {
		String sql = "";
		System.out.println(permission);
		if (permission.equals("학생")) {
			sql = "update studentInfo set department=?, degree=? where id='" + id + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			if (department.equals("") || degree.equals("")) {
				response.getWriter().print("<script> alert(\"필수 입력값이 누락되었습니다.\");");
				response.getWriter().print("window.location.href='" + location + "' </script>");
			} else {
				ps.setString(1, department);
				ps.setString(2, degree);
				ps.executeUpdate();
				response.getWriter().print("<script> alert(\"갱신 완료\");");
				response.getWriter().print("window.location.href='" + location + "' </script>");
			}
			ps.close();
			conn.close();
		} else {
			sql = "update facultyInfo set department=? where id='" + id + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			if (department.equals("")) {
				response.getWriter().print("<script> alert(\"필수 입력값이 누락되었습니다.\");");
				response.getWriter().print("window.location.href='" + location + "' </script>");
			} else {
				ps.setString(1, department);
				ps.executeUpdate();
				response.getWriter().print("<script> alert(\"갱신 완료\");");
				response.getWriter().print("window.location.href='" + location + "' </script>");
			}
			ps.close();
			conn.close();
		}
	} catch(Exception e ) {
		System.out.print(e.getMessage());
		response.getWriter().print("<script> alert(\"갱신 실패\");");
		response.getWriter().print("window.location.href='" + location + "' </script>");
	}
%>
