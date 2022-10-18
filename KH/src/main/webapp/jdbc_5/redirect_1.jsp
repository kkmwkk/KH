<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core: redirect</title>
</head>
<body>

<h2>JSTL Core Tag: redirect</h2>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:redirect url="paramhandle.jsp">
	<c:param name="user" value="korea"/>
	<c:param name="id" value="sunflower"/>
</c:redirect>
</body>
</html>