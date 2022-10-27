<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.DataSource, javax.naming.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rss = null;
	
	try{
		Context init = new InitialContext();
	    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	      
	    conn = ds.getConnection();
	    
	    pstmt = conn.prepareStatement("SELECT * FROM member_2 WHERE id = ?");
	    pstmt.setString(1, id);
	    
	    rss = pstmt.executeQuery();
	    
	    if(rss.next())
	    {
	    	if(pass.equals(rss.getString("password")))
	    	{
	    		session.setAttribute("id", id);
	    		
	    		out.println("<script>");
	    		out.println("location.href='main.jsp'");
	    		out.println("</script>");
	    	}
	    }
	    
	    out.println("<script>");
	    out.println("location.href='loginForm.jsp'");
	    out.println("</script>");
	}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		try{
			rss.close();
			pstmt.close();
			conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}


%>