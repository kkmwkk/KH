<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체 Test</title>
</head>
<body>
<%
	request.setAttribute("korea", "아름다운 꽃");
	application.setAttribute("queen", "푸르른 하늘");
%>

<hr size = "5" color = "red">
<table border = "1">
	<tr>
		<td> EL Implicit Object</td>
		<td> Result </td>
	</tr>
	
	<tr>
		<td>\${empty param.age}</td>
		<td>${empty param.age}</td>
	</tr>
	
	<tr>
		<td>\${!empty param.age}</td>
		<td>${! empty param.age}</td>
	</tr>

<!-- 
: 저장객체 접근
${param.name} => request.getParameter("name");
${member} => request.getAttribute("member");

저장객체의 attribute에 자동으로 접근하는데 자동검색 순위는 page, request, session, application 순이다.

${member.name} =>
Member m = (Member)request.getAttribute("member");
m.getName();
 -->

	<tr>
		<td>\${pageContext.request.contextPath}</td>
		<td>\${pageContext.request.contextPath}</td>
	</tr>
	
	<tr>
		<td>\${requestScope.korea}</td>
		<td>${requestScope.korea}</td>
	</tr>
	
	<tr>
		<td>\${requestScope['korea']}</td>
		<td>${requestScope['korea']}</td>
	</tr>
	
	<tr>
		<td>\${requestScope["korea"]}</td>
		<td>${requestScope['korea']}</td>
	</tr>
	
	<tr>
		<td>\${applicationScope.queen}</td>
		<td>${applicationScope.queen}</td>
	</tr>
</table>






</table>

</body>
</html>