<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.DataSource, javax.naming.*" %>

<%
	Connection conn = null;
	String sql = "SELECT * FROM student_1";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rss = pstmt.executeQuery();
		
		while(rss.next()){
			out.println("<h3>" + rss.getInt(1) + " , " + rss.getString(2) + "<h3>");
		}
		
		rss.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		out.println("<h3>데이터를 가져오지 못하였습니다.</h3>");
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resultsettest_1</title>
</head>
<body>

</body>
</html>