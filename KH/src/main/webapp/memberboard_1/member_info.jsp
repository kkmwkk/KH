<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "java.sql.*, javax.sql.DataSource, javax.naming.*" %>

<%
	String id = null;
	
	if((session.getAttribute("id") == null) || (!((String)session.getAttribute("id")).equals("admin"))){
		out.println("<script>");
	    out.println("location.href='loginForm.jsp'");
	    out.println("</script>");
	}
	
	String info_id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rss = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("SELECT * FROM member_2 WHERE id=?");
		pstmt.setString(1, info_id);
		
		rss = pstmt.executeQuery();
		
		rss.next();
	}catch(Exception e){
		e.printStackTrace();
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템(회원 정보 보기)</title>
<style type="text/css">
table{
	margin: auto;
	width: 400px;
	border: 1px solid gray;
	text-align: center;
}
</style>

</head>
<body>
<table>
	<tr>
		<td>아이디:</td>
		<td><%=rss.getString("id") %></td>
	</tr>
	
	<tr>
		<td>비밀번호:</td>
		<td><%=rss.getString("password") %></td>
	</tr>
	
	<tr>
		<td>이름:</td>
		<td><%=rss.getString("name") %></td>
	</tr>
	
	<tr>
		<td>나이:</td>
		<td><%=rss.getInt("age") %></td>
	</tr>
	
	<tr>
		<td>주소:</td>
		<td><%=rss.getString("addr") %></td>
	</tr>
	
	<tr>
		<td>전화번호:</td>
		<td><%=rss.getString("tel") %></td>
	</tr>
	
	<tr>
		<td>성별:</td>
		<td><%=rss.getString("gender") %></td>
	</tr>
	
	<tr>
		<td>취미:</td>
		<td><%=rss.getString("hobby") %></td>
	</tr>
	
	<tr>
		<td>이메일:</td>
		<td><%=rss.getString("email") %></td>
	</tr>
	
	<tr>
		<td colspan="2"><a href="member_list.jsp">리스트로 돌아감</a></td>
	</tr>
</table>

<%
	rss.close();
%>

</body>
</html>

























