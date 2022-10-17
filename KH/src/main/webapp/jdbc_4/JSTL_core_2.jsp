<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 라이브러리 TEST</title>
</head>
<body>

<c:forEach var = "test" begin="1" end="35" step="3">
	<b>${test}</b> &nbsp;
</c:forEach>


<br>


<c:forTokens var="alphabet" items="a,b,c,d;e;f;g" delims=", ;">
	<b>${alphabet}</b>&nbsp;
</c:forTokens>

<br>


<c:set var = "data" value = "백합, 들국화, 해바라기, 해당화"/>

<c:forTokens items="${data}" delims="," var="varData">
	<b>${varData}</b>&nbsp;
</c:forTokens>
</body>
</html>