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
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
	/*
		TYPE_FORWARD_ONLY : 커서이동을 다음 레코드로만 이동하도록 함
		TYPE_SCROLL_SENSITIVE : 커서이동을 자유롭게하고, 업데이트 내용을 반영함
		TYPE_SCROLL_INSENITIVE : 커서이동을 자유롭게하고, 업데이트 내용을 반영하지 않음
		CONCUR_UPDATABLE : 데이터변경이 가능하도록함
		CONCUR_READ_ONLY : 데이터변경이 불가능하도록함
	*/
		ResultSet rss = pstmt.executeQuery();
	
		rss.last();	//마지막 레코드
		out.println(rss.getInt(1) + " , " + rss.getString(2) + "<br>");
	
		rss.first(); //처음 레코드
		out.println(rss.getInt(1) + " , " + rss.getString(2) + "<br>");
	
		rss.absolute(3); //3번째 레코드(인덱스와 달리 1부터 시작)
		out.println(rss.getInt(1) + " , " + rss.getString(2) + "<br>");
		
		rss.previous();	//2번째 레코드
		out.println(rss.getInt(1) + " , " + rss.getString(2) + "<br>");
		
		rss.next();	//3번째 레코드
		out.println(rss.getInt(1) + " , " + rss.getString(2) + "<br>");
	}catch(Exception e){
		out.println("<h3>데이터를 불러오지 못하였습니다.</h3>");
		e.printStackTrace();
	}
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resultsettest_2</title>
</head>
<body>

</body>
</html>