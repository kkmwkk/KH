<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자 사용</title>
</head>
<body>

<h3>\${5 + 7} = ${5 + 7}</h3>
<h3>\${7 - 5} = ${7 - 5}</h3>
<h3>\${5 < 6} = ${5 < 6}</h3>
<h3>\${(5+3) != 8 ? 8 : 99 } = ${ (5 + 3) != 8 ? 8 : 99}</h3>


</body>
</html>