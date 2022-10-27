<%@ page import = "java.sql.*, javax.sql.DataSource, javax.naming.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if((session.getAttribute("id") == null) || (!((String)session.getAttribute("id")).equals("admin"))){
		out.println("<script>");
	    out.println("location.href='loginForm.jsp'");
	    out.println("</script>");
	}

	String delete_id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rss = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("DELETE FROM member_2 WHERE id=?");
		pstmt.setString(1, delete_id);
		
		int count = pstmt.executeUpdate();
		
		if(count > 0){
			System.out.println("삭제 되었습니다.");
		}else{
			System.out.println("삭제되지 않았습니다.(레코드가 존재하지 않습니다.)");
		}
		
		out.println("<script>");
	    out.println("location.href='member_list.jsp'");
	    out.println("</script>");
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>   