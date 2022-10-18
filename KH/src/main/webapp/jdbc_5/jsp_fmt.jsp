<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id = "date" class = "java.util.Date"/>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리 사용 예</title>
</head>
<body>

<fmt:setLocale value="en_US"/>

<!-- 
setLocale : 다국어 페이지를 사용할때 언어를 지정하는 태그 en_US, ko_KR 
value : 어떤 언어를 사용할 지정하는 속성
bundle : properties 확장자를 사용하는 지원 파일을 읽어 오는 역할을 한다.
-->
<fmt:bundle basename="text">
	<fmt:message key="name"/><br>
	<fmt:message key="say"/><br>
	<fmt:message key="say2">
		<fmt:param value="들국화"/>
		<fmt:param value="해바라기"/>
		<fmt:param value="이승엽"/>
	</fmt:message>
</fmt:bundle>

<p>

<fmt:formatNumber value = "50000" type = "currency"/><br>
<fmt:formatNumber value = "0.15" type = "percent"/><br>
<fmt:formatNumber value = "500467500" pattern = "###,###,###"/><br>

<p>

<fmt:formatDate value="${date}" type="date"/><br>
<fmt:formatDate value="${date}" type="time"/><br>
<fmt:formatDate value="${date}" type="both"/><br>

<p>

<fmt:formatDate value="${date}" type="both" timeStyle="short" dateStyle="short"/><br>
<fmt:formatDate value="${date}" type="both" timeStyle="long" dateStyle="long"/><br>

</body>
</html>