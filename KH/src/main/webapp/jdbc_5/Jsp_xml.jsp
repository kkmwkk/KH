<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> JSTL XML 라이브러리 예</title>
</head>




<body>
<x:parse var = "xmldata">
	<students>
		<stt>
			<student>
				<name>홍길순</name>
				<age>18</age>
				<gender>남</gender>
				<phone>011-3456-11xx</phone>
			</student>
			
			<student>
				<name>길길동</name>
				<age>19</age>
				<gender>남</gender>
				<phone>011-345-1234</phone>
			</student>
			
			<student>
				<name>김길순</name>
				<age>19</age>
				<gender>여</gender>
				<phone>011-345-1234</phone>
			</student>
			
			<student>
				<name>김길순</name>
				<age>19</age>
				<gender>여</gender>
				<phone>없음</phone>
			</student>
			
		</stt>
	</students>
</x:parse>

<x:forEach select="$xmldata//student">
	<x:if select="./name!='홍길순'">
		<x:out select="./name"/>
		<x:set select="./age" var="age"/>
		<x:out select="$age"/>
		<x:out select="./gender"/>
		
		
		<x:choose>
			<x:when select="./phone!='없음'">
				[전화번호 : <x:out select="./phone"/>]
			</x:when>
			<x:otherwise>
				[전화 없음]
			</x:otherwise>
		</x:choose>
		<br>
	</x:if>
</x:forEach>
</body>
</html>