<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>

<h2>테이블 student의 테이블 메타데이터 조회 프로그램</h2>

<hr>
<h2>인터페이스 ResultSetMetaDate 이용</h2>

<%
	Connection con = null;
	Statement stmt = null;
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "scott", "tiger");
		stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("select * from student");
		ResultSetMetaData rsmd = result.getMetaData();
		// 지정된 데이터베이스에서 이용할 수 있는 테이블의 목록 정보를 돌려준다.
		int cCount = rsmd.getColumnCount();
		%>	
		
		<table border = "2">
			<tr>
				<td align = "center"><b>아이디</b></td>
				<td align = "center"><b>암호</b></td>
				<td align = "center"><b>이름</b></td>
				<td align = "center"><b>입학년도</b></td>
				<td align = "center"><b>학번</b></td>
				<td align = "center"><b>학과</b></td>
				<td align = "center"><b>휴대폰</b></td>
				<td align = "center"><b>휴대폰2</b></td>
				<td align = "center"><b>주소</b></td>
				<td align = "center"><b>이메일</b></td>
			</tr>
			<tr>
		<% 
		for(int i = 1; i <= cCount; i++){
			%>
			<td align="center"><%= rsmd.getColumnName(i) %></td>
			<% 
		}
		%>
		</tr>
		<tr>
		
		<% 
		for(int i = 1; i <= cCount; i++){
			%>
			<td align="center"><%= rsmd.getColumnTypeName(i) %></td>
			<% 
		}
		%>
		</tr>
		<tr>
		<% 
		for(int i = 1; i <= cCount; i++){
			%>
			<td align="center"><%= rsmd.getPrecision(i) %></td>
			<% 
		}
		%>
		</tr>
		<%
			result.close();
		
		
		}catch(Exception e){
			out.println("Oracle 데이터베이스 scott의 student 조회에 문제가 있습니다. <hr>");
			out.println(e.toString());
			e.printStackTrace();
		}finally{
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}
		%>

</table>


</body>
</html>