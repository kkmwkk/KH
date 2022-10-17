<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체 사용 예</title>
</head>

<body>
	<hr size = "5" color = "red">
	
	<fieldset>
    <legend>EL 내장 객체 사용 예시를 알아보자</legend>
	
	<h2> ${sessionScope.king}</h2>
	<h2> ${param.name}</h2>
	<h2> ${param.tel}</h2>
	
	</fieldset>
	
	<hr size = "5" color = "blue">
	
	<fieldset >
    <legend>EL 내장 객체 사용 예시를 알아보자</legend>
	<h2> ${sessionScope['king']}</h2>
	<h2> ${param["name"]}</h2>
	<h2> ${param["tel"]}</h2>
	<h2> ${param["kbs"]}</h2>
	
	</fieldset>
	
	<hr size = "5" color = "green">
	
	<fieldset>
    <legend>EL 내장 객체 사용 예시를 알아보자</legend>
	
	<h2> ${sessionScope.string}</h2>
	<h2> ${param.name}</h2>
	<h2> ${param.addr}</h2>
	<h2> ${param.tel}</h2>
	
	</fieldset>

</body>
</html>