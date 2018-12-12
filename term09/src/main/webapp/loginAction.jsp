<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 처리</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Database dbCon = new Database();
		Connection conn = dbCon.GetConnection();
		
		try {
			// check id and password for admin
			String sql = "select * from admin where id='" + id + "'"
						+ " AND password='" + pw + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			Boolean result = rs.next();
			String location = "";
			
			if (result) {
				// login as admin
				location = "PersonalInformation.jsp";
				session.setAttribute("sessionID", id);
				session.setAttribute("sessionPERM", "admin");
				response.getWriter().print("<script> window.location.href='" + location +"' </script>");
			} else {
				// check id and password for user
				sql = "select * from user where id='" + id + "'"
							+ " AND password='" + pw + "'";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				result = rs.next();
				
				if (result) {
					// login as user
					location = "PersonalInformation.jsp";
					session.setAttribute("sessionID", id);
					session.setAttribute("sessionPERM", "user");
					response.getWriter().print("<script> window.location.href='" + location +"' </script>");
				} else {
					// failed to find any identities for both admin and user
					location = "login.jsp";
					response.getWriter().print("<script> alert(\"로그인에 실패하였습니다.\");");
					response.getWriter().print("window.location.href='" + location + "' </script>");
				}
			}
			
			response.getWriter().flush();
			
			out.close();
			ps.close();
			rs.close();
			conn.close();
		} catch(Exception e ) {
			System.out.print(e.getMessage());
		}
	%>
</body>
</html>