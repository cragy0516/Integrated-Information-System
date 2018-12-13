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
	
	String location = "";
	if (perm.equals("student")) {
		location = "PersonalInformation.jsp";
	} else if (perm.equals("faculty")) {
		location = "PersonalInformationFaculty.jsp";
	}
	
	try {
		String sql = "update user set address=?, phone=?, email=? where id='" + id + "'";
		PreparedStatement ps = conn.prepareStatement(sql);
		if (address == null) address = "";
		if (phone == null) phone = "";
		
		ps.setString(1, address);
		ps.setString(2, phone);
		ps.setString(3, email);
		
		ps.executeUpdate();
		response.getWriter().print("<script> alert(\"갱신 완료\");");
		response.getWriter().print("window.location.href='" + location + "' </script>");
		
		ps.close();
		conn.close();
	} catch(Exception e ) {
		response.getWriter().print("<script> alert(\"갱신 실패\");");
		response.getWriter().print("window.location.href='" + location + "' </script>");
		System.out.print(e.getMessage());
	}
%>
