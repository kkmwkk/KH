<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core: import</title>
</head>
<body>

<h2>JSTL Core Tag: import</h2>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:import url = "Core_Tag_if.jsp"/>

<c:import url = "Choose_1.jsp" var="choose"/>
${choose}

<c:import url="paramhandle.jsp">
	<c:param name = "user" value = "king"/>
	<c:param name = "id" value = "seoul"/>
</c:import>

<p><hr><p>
</body>
</html>