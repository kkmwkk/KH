<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 시스템 회원가입 페이지</title>
<style type="text/css">
table{
	margin:auto;
	width: 400px;
	border: 1px solid gray;
	text-align: center;
	background-color: #bbb00066;
}

.td_title{
	font-weight: bold;
	font-size: x-large;
}

</style>
</head>
<body>
	<form action="joinProcess.jsp" name ="joinform" method="post">
		<table>
			<tr>
				<td colspan="2" class="td_title">회원 가입 페이지</td>
			</tr>
			
			<tr>
				<td><label for="id">아이디</label></td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			
			<tr>
				<td><label for="pass">비밀번호</label></td>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			
			<tr>
				<td><label for="age">나이</label></td>
				<td><input type="text" name="age" id="age"></td>
			</tr>
			
			<tr>
				<td><label for="addr">주소</label></td>
				<td><input type="text" name="addr" id="addr"></td>
			</tr>
			
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td><input type="text" name="tel" id="tel"></td>
			</tr>
			
			<tr>
				<td><label for="gender">성별</label></td>
				<td>
					<input type="radio" name="gender" id="gender1" value="남" checked="checked">남자
					<input type="radio" name="gender" id="gender2" value="여">여자				
				</td>
			</tr>
			
			<tr>
				<td><label for="hobby">취미</label></td>
				<td>
					<input type="checkbox" name="hobby" id="hobby" value="코딩">코딩				
					<input type="checkbox" name="hobby" id="hobby" value="걷기">걷기				
					<input type="checkbox" name="hobby" id="hobby" value="수영">수영				
					<input type="checkbox" name="hobby" id="hobby" value="독서">독서				
					<input type="checkbox" name="hobby" id="hobby" value="펜싱">펜싱				
				</td>
			</tr>
			
			<tr>
				<td><label for="email">이메일</label></td>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">다시작성</a>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>