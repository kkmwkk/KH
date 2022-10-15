<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.util.ArrayList, univ.StudentEntity" %>

<h2>Java Beands StudentDatabaseCP 를 이용한 테이블 Student 조회 프로그램</h2>
<hr size = "5" color = "red">
<h2>학생 정보 조회</h2>
<jsp:useBean id = "stdtdb" class="univ.StudentDatabaseCP" scope="page"/>

<%
ArrayList<StudentEntity> list = stdtdb.getStudentList();
int counter = list.size();
if(counter > 0){
%>

 <table border="2">
            <tr>
               <td align="center"><b>아이디 </b></td>
               <td align="center"><b>암호 </b></td>
               <td align="center"><b>이름 </b></td>
               <td align="center"><b>입학년도 </b></td>
               <td align="center"><b>학번 </b></td>
               <td align="center"><b>학과 </b></td>
               <td align="center"><b>휴대폰 </b></td>
               <td align="center"><b>휴대폰2 </b></td>
               <td align="center"><b>주소 </b></td>
               <td align="center"><b>이메일 </b></td>
            </tr>
            <%
            for(StudentEntity stdt : list){
            %>
            
            <tr>
				<td align = "center"><%=stdt.getId() %></td>
				<td align = "center"><%=stdt.getPasswd() %></td>
				<td align = "center"><%=stdt.getName() %></td>
				<td align = "center"><%=stdt.getYear() %></td>
				<td align = "center"><%=stdt.getSnum() %></td>
				<td align = "center"><%=stdt.getDepart() %></td>
				<td align = "center"><%=stdt.getMobile1() %></td>
				<td align = "center"><%=stdt.getMobile2() %></td>
				<td align = "center"><%=stdt.getAddress() %></td>
				<td align = "center"><%=stdt.getEmail() %></td>
			</tr>
			<%
			}
			}
			
			%>
            
            </table>
            
            
            <p>
            <hr size="5" color = "green">
            조회된 학생수가 <%=counter %> 명 입니다.
            
            <hr size = "5" color = "green">
</body>
</html>