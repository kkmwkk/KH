<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.DataSource, javax.naming.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rss = null;
	
	String sql1 = "INSERT INTO student_1 VALUES(77, '하얀구름')";
	String sql2 = "SELECT * FROM student_1 WHERE num=23";
	
	/* 트렌젝션 처리 : 쿼리 둘 중 하나라도 문제가 있다면 아무것도 수행하지 않고, 전체롤백시킴*/
	try{
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		conn.setAutoCommit(false);
	/*
		commit의 경우는 insert/delete/update 후 정상적으로 Exception이 발생하지 않았다면,
		conn.commit(); 을 호출해야 한다.
		Exception이 발생했다면, conn.rollback(); 을 호출한다.
	*/
		pstmt = conn.prepareStatement(sql1);
		pstmt.executeUpdate();
		pstmt.close();
		
		pstmt = conn.prepareStatement(sql2); //비정상 수행(where절 조건에 맞는 레코드 없음)
		rss = pstmt.executeQuery(); 
		
		if(!rss.next()){
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 있어 롤백하였습니다.</h3>");
		}else{
			conn.commit();
			out.println("<h3>데이터 삽입을 완료하였습니다.</h3>");
		}
		rss.close();
		pstmt.close();
		conn.setAutoCommit(true); //처음으로 되돌림(기본값 true)		
	}catch(Exception e){	
		out.println("<h3>데이터 삽입에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transection</title>
</head>
<body>

</body>
</html>