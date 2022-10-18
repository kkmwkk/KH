<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL UPDATE TEST : update, param</title>
</head>
<body>

<h2>JSTL UPDATE TEST : update, param</h2>
<hr size="5" color ="red">

<h2>전체 게시판 조회</h2>
<sql:setDataSource var="ds" dataSource="jdbc/OracleDB"/>

<sql:query var="rs" dataSource="${ds }" sql="select * from student"/>

<c:forEach var = "studentRow" begin="0" items="${rs.rows }">
${studentRow.id },${studentRow.depart },${studentRow.name },${studentRow.address },${studentRow.year }<br>
</c:forEach>
<hr size="5" color="green">
<h2>이름 조수영인 레코드에서 주소를 스위스 입학년도를 3500으로 변경</h2>

<sql:update var="upp" dataSource="${ds }">
UPDATE student
SET depart = ?, address = ?, year = ?
WHERE name = ?
<sql:param value="컴퓨터공학과"/>
<sql:param value="수원시"/>
<sql:param value="3500"/>
<sql:param value="전민우"/>

</sql:update>

<hr size="5" color="blue">
<h2>UPDATE후 게시판 다시 조회</h2>

<sql:query var="rs" dataSource="${ds }" sql="select * from student"/>

<c:forEach var = "studentRow" begin="0" items="${rs.rows }">
${studentRow.id },${studentRow.depart },${studentRow.name },${studentRow.address },${studentRow.year }<br>
</c:forEach>
</body>
</html>