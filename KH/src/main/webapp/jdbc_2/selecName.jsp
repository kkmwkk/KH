<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<h2>Table Student에서 이름으로 조회하는 프로그램</h2>
<hr size ="5" color ="red">

<h2>학생 정보 조회</h2>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	int rowCount = 0;
	
	try{
		Class.forName(driverName);
		conn = DriverManager.getConnection(dbURL, "scott", "tiger");
		
		if(request.getParameter("search").equals("name"))
		{
			String name = request.getParameter("search22") + "%";
			String sql = "select * from student where name like ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
		}else if(request.getParameter("search").equals("year"))
		{
			int year = Integer.parseInt(request.getParameter("search22"));
			String sql = "select * from student where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,year);
		}else if(request.getParameter("search").equals("depart"))
		{
			String depart = request.getParameter("search22") + "%";
			String sql = "select * from student where depart like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, depart);
		}
		
		ResultSet result = pstmt.executeQuery();
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
			
		<% 
		while(result.next()){
%>			
			<tr>
				<td align = "center"><%=result.getString(1) %></td>
				<td align = "center"><%=result.getString(2) %></td>
				<td align = "center"><%=result.getString(3) %></td>
				<td align = "center"><%=result.getString(4) %></td>
				<td align = "center"><%=result.getString(5) %></td>
				<td align = "center"><%=result.getString(6) %></td>
				<td align = "center"><%=result.getString(7) %></td>
				<td align = "center"><%=result.getString(8) %></td>
				<td align = "center"><%=result.getString(9) %></td>
				<td align = "center"><%=result.getString(10) %></td>
			</tr>
			
			<% rowCount ++; 
		}
			result.close();
		
	}catch(SQLException e){
		out.println("OracleDatabase Student 테이블 조회에 문제가 있습니다.");
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	%>
	</table>
	<hr size = "5" color = "green">

</body>
</html>