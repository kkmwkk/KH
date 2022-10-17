<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core Tag: set target</title>

</head>
<body>
<h2>JSTL core Tag: set target</h2>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var ="book" value="<%= new java.util.HashMap() %>"/>
<c:set target="${book }" property="java" value="Java로 배우는 프로그램 기초"/>
<c:set target="${book }" property="c" value="C언어 일주일만에 끝내기"/>
<c:set target="${book }" property="jsp" value="JSP 나처럼 할 수 있다."/>

\${book.java } = ${book.java }<p>
\${bookc.c } = ${book.c }<p>
\${book.jsp } = ${book.jsp }<p>

<c:set target="${pageScope }" property="name" value="들국화"/>
\%{pageScope.name} = ${pageScope.name }<p>

<jsp:useBean id = "today" class = "java.util.Date"/>
<c:set target="${today}" property="year" value="2022"/>
\${today.year } = ${today.year }<p>
\${today.month } = ${today.month+1 }<p>
\${today.date } = ${today.date }<p>

</body>
</html>