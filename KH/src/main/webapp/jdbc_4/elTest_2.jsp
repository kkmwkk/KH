<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* king이란 이름으로 Session Test 2022생성 */
	session.setAttribute("king", "Session Test 2022");
	session.setAttribute("string", "개인 신상");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체 사용</title>
<style = type = "text/css">
	table{
		width : 500px;
		margin : auto;
		border : 2px solid #00ff00;
		text-align : center;
		background-color : #bbaa66;
	}

</style>
</head>
<body>
	<form action = "elTest_3.jsp" method="get">
		<table>
			<tr>
				<td>이름</td>
				<td><input type = "text" name = "name" value = "달맞이꽃"></td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input type = "text" name = "addr" value = "경기도 용인시 기흥구 영덕동"></td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td><input type = "text" name = "tel" value = "010-478-6543"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<!-- ?name=달맞이꽃&tel=010-478-6543 -->
					<input type = "submit" value = "입력"> &nbsp;&nbsp;
					<input type = "reset" value = "취소">
				</td>
			</tr>
		</table>
	</form>	
		
		
			
	
	</form>

</body>
</html>