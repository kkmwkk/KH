<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 라이브러리 테스트</title>
</head>
<body>
<c:set var ="test" value = "JSTL Test 2022" />

<h3>&lt;c:set&gt; 사용후 : <c:out value = "${test}"/></h3>

<c:remove var="test"/>

<h3>&lt;c:remove&gt; 사용 후 : <c:out value = "${test}"/></h3>

<c:catch var = "error">
	<%= 33/0 %>
</c:catch>

<h3>&lt; c:catch &gt;로 잡아낸 오류<c:out value="${error}"/></h3>

<c:if test="${5 < 10 }">
	<h3>5는 10보다 작다</h3>
</c:if>

<c:if test="${6 + 3 == 9 }">
	<h3>6 + 3 = 9</h3>
</c:if>

<c:choose>
	<c:when test = "${ 5 + 20 == 25 }">
		<h3> 5 + 20 = 25이다</h3>
	</c:when>
	
	<c:otherwise>
		<h3> 5 + 20 = 25이 아니다.</h3>
	</c:otherwise>
</c:choose>



</body>
</html>