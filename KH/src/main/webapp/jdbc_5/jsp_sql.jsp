<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL QUERY Test</title>
</head>
<body>
<h2>JSTL SQL TAG : setDataSource, query, param</h2>

<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<hr size = "5" color = "red">
<h2>전체학생조회</h2>

<sql:setDataSource var="stuDS" dataSource="jdbc/OracleDB"/>

<sql:query var="studentRS" dataSource="${stuDS}">
	SELECT * FROM student
</sql:query>

<sql:query var = "studentRS" dataSource="${stuDS }" sql = "select * from student"/>


<c:forEach var = "studentRow" begin="0" items="${studentRS.rows}">
	${studentRow.id },${studentRow.passwd },${studentRow.name },${studentRow.depart },${studentRow.email }<br>
</c:forEach>

<hr size="5" color="green">
<h2>컴퓨터 공학과 학생 조회</h2>

<sql:query var = "comRS" dataSource="${stuDS }">
SELECT *
FROM student
WHERE year = ? AND depart = ?
<sql:param value = "2010"/>
<sql:param value = "컴퓨터공학과"/>
</sql:query>

<c:forEach var = "studentRow" begin="0" items="${comRS.rows }">
${studentRow.id },${studentRow.passwd },${studentRow.name },${studentRow.year },${studentRow.depart }<br>
</c:forEach>

<hr size = "5" color = "#44dd66">
<c:forEach var="studentRow" begin="0" items="${comRS.rowsByIndex }">
${studentRow[0] },${studentRow[1] },${studentRow[2] },${studentRow[3] },${studentRow[5]}<br>
</c:forEach>

<hr size="5" color="blue">

</body>
</html>