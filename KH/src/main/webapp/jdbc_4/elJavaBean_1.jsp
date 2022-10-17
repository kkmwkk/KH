<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 액션 태그 사용</title>
</head>
<body>
<h2>EL에서 자바빈즈 getter 호출</h2>

<jsp:useBean id = "user" class = "univ.UserEL">
	<jsp:setProperty name = "user" property = "uname" value = "수선화" />;
	<jsp:setProperty name = "user" property = "uid" value = "seoul" />;
	<jsp:setProperty name = "user" property = "unum" value = "78" />;
	<jsp:setProperty name = "user" property = "addr" value = "경기도용인시" />;
</jsp:useBean>>



<hr size = "5" color = "red">
\${user.uname} = ${user.uname} <br>
\${user.uid} = ${user.uid} <br>
\${user.unum} = ${user.unum} <br>
\${user.addr} = ${user.addr} <br>

<br>

\${user["uname"]} = ${user["uname"]} <br>
\${user["uid"]} = ${user["uid"]} <br>
\${user["unum"]} = ${user["unum"]} <br>
\${user["addr"]} = ${user["addr"]} <br>

<hr size = "5" color = "blue">

<p>
이름 : <%= user.getUname() %><br>
아이디 : <%= user.getUid() %><br>
번호 : <%= user.getUnum() %><br>
주소 : <%= user.getAddr() %><br>

<hr size = "5" color = "green">

</body>
</html>