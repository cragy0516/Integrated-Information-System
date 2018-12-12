<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="Dao.Database" %>
<%@ page import="Service.subjectService" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String id = (String) session.getAttribute("sessionID");
	String perm = (String) session.getAttribute("sessionPERM");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	Database dbCon = new Database();
	Connection conn = dbCon.GetConnection();
	
	try {
		String sql = "update user set address=?, phone=?, email=? where id='" + id + "'";
		PreparedStatement ps = conn.prepareStatement(sql);
		String location = "";
		if (perm.equals("student")) {
			location = "PersonalInformation.jsp";
		} else if (perm.equals("faculty")) {
			location = "PersonalInformationFaculty.jsp";
		}
		
		if (address.equals("") || phone.equals("") || email.equals("")) {
			response.getWriter().print("<script> alert(\"필수 입력값이 누락되었습니다.\");");
			response.getWriter().print("window.location.href='" + location + "' </script>");
		} else {
			ps.setString(1, address);
			ps.setString(2, phone);
			ps.setString(3, email);
			
			ps.executeUpdate();
			response.getWriter().print("<script> alert(\"갱신 완료\");");
			response.getWriter().print("window.location.href='" + location + "' </script>");
		}
		
		ps.close();
		conn.close();
	} catch(Exception e ) {
		System.out.print(e.getMessage());
	}
%>
