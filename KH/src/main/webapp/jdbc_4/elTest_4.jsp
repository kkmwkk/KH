<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 액션 태그 이용</title>
</head>
<body>
<h2> EL에서 액션 태그 이용</h2>
<jsp:useBean id="color" class = "java.util.ArrayList">

<%
	color.add("red");
	color.add("green");
	color.add("blue");
	color.add("yellow");
	color.add("gray");
	color.add("#cccc66");
	color.add("#bb88bb");
%>
</jsp:useBean>

<ul>
	<font size = "8" color = "${color[0]}"><li> 이 색상은 ${color[0] } 색 입니다.</li></font>
	<font size = "8" color = "${color[1]}"><li> 이 색상은 ${color[1] } 색 입니다.</li></font>
	<font size = "8" color = "${color[2]}"><li> 이 색상은 ${color[2] } 색 입니다.</li></font>
	<font size = "8" color = "${color[3]}"><li> 이 색상은 ${color[3] } 색 입니다.</li></font>
	<font size = "8" color = "${color[4]}"><li> 이 색상은 ${color[4] } 색 입니다.</li></font>
	<font size = "8" color = "${color[5]}"><li> 이 색상은 ${color[5] } 색 입니다.</li></font>
	<font size = "8" color = "${color[6]}"><li> 이 색상은 ${color[6] } 색 입니다.</li></font>
</ul>

</body>
</html>