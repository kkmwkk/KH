<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core : if</title>
</head>
<body>

<h2>JSTL Core Tag : if</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

안녕하세요.
<c:set var="today" value="<%= new java.util.Date() %>"/>

<c:if test="${today.hours < 12}" var="bool">
아침식사는 하셨나요?<br>
</c:if>

<p>

<hr>
\${today.hours} = ${today.hours} <br>
\${bool} = ${bool}

</body>
</html>