<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP 이용 STUDENT 테이블 레코드 삽입</title>
</head>
<body>
   <%@ page import="java.sql.*,javax.naming.*" %>
   <h2>Oracle Database Student 테이블에 학생 레코드 삽입</h2>
   
   <hr size="5" color="red">
   <h2>학생 삽입</h2>
   <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      Statement stmt = null;
      /* 
      Statement and PreparedStatement
      
      .Statement 란 실제 데이터 베이스에 쿼리를 보내기위한 객체 입니다.
      삽입 , 수정, 삭제 , 검색을 처리하는 DML 문을 사용할때는 이 인터페이스를 사용합니다.
      
      이 객체는 Connection 객체의 연결 정보를 가져와서 DB 에 접근하므로 이 객체를 사용하기 
      위해서는 접속상태인 Connection 객체가 먼저 존재해야 합니다.
      
      Method                         의미
      
      executeQuery(String sql)       Select 문을 실행할때 사용 (ResultSet 객체 반환)
      
      executeUpdate()               삽입 , 수정 , 삭제 와 관련한 SQL 문을 실행할때 사용
                              		적용된 행의 수를 int 로 반환
                              
      close()                     Statement  객체를 반환할때 사용한다
      */
      StringBuffer SQL = new StringBuffer("INSERT  INTO student");
      SQL.append("VALUES(?,?,?,?,?,?,?,?,?,?)");
      
      String name = "개나리";
      
      try{
         Context initCtx = new InitialContext();
         
         //가장먼저 InitialContext() 객체가 필요하므로 객체를 하나 생성한다
         //클래스 javax.naming.InitialContext 는 JNDI 서비스를 하기위해
         //객체 InitialContext 를 생성하기 위한 클래스이며 객체 InitialContext 가
         //생성되면 이미 저장한 DBCP를 위한 리소스를 참조하게 된다.
         
         Context env = (Context)initCtx.lookup("java:comp/env/");
         // InitialContext 객체 변수 initCtx 의 메서드 lookup()을 이용해
         // JNDI 기본 네임스페이스를 설정한다.
         
         DataSource ds = (DataSource)env.lookup("jdbc/OracleDB");
         //InitialCOntext 객체변수 env의 메서드 lookup() 를 이용해 
         // Datasource 객체를 찾는 일이다. 인터페이스 javax.sql.DataSource 는
         // 커넥션풀을 위해 만든 인터페이스로 DBMS 커넥션풀을 구현한 객체를 표현한다
         // 즉  톰켓의 JNDI 설정에서 "jdbc/OracleDB" 이름으로 
         // 커넥션풀을 위한객체를 찾아 DataSource 객체 변수 ds 에 저장한다.
         
         conn = ds.getConnection();
         // 마지막으로 DataSource 객체의 메서드 getConnection() 을 호출하여
         // Connection 객체 conn 을 얻는다.
         
         // JNDI(Java Naminf and Directory Interface)
         // 디렉토리 서비스에서 제공하는 데이터 및 객체를 발견하고 
         // 참고하기 위한 Java API ,  J2EE 플랫폼의 일부 
         
         pstmt = conn.prepareStatement(SQL.toString());
         
         // 삽입할 학생 레코드 입력
         
         pstmt.setString(1,"jmwjmjwmjss");
         pstmt.setString(2,"commons");
         pstmt.setString(3,name);
         pstmt.setInt(4,2022);
         pstmt.setString(5,"1079345");
         pstmt.setString(6,"정보보안과");	
         pstmt.setString(7,"010");
         pstmt.setString(8,"345-6789");
         pstmt.setString(9,"서울시 역삼동");
         pstmt.setString(10,"dbcp@naver.com");
         
         int rowCount = pstmt.executeUpdate();
         
         if(rowCount == 1){
            out.println("<hr color='yellow' size='3'>학생["+name+"]레코드가 삽입되었습니다. <hr color='cyne' size='3'>");
            
         }else{
            out.println("학생 레코드 삽입에 문제가 있습니다.");
         }
         
         // 다시 학생 조회
         
         stmt = conn.createStatement();
         ResultSet result = stmt.executeQuery("select * from student ");
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
            while(result.next()){
            
            %>   
               <tr>
               <td align="center"><%=result.getString(1) %></td>
               <td align="center"><%=result.getString(2) %></td>
               <td align="center"><%=result.getString(3) %></td>
               <td align="center"><%=result.getInt(4) %></td>
               <td align="center"><%=result.getString(5) %></td>
               <td align="center"><%=result.getString(6) %></td>
               <td align="center"><%=result.getString(7) %></td>
               <td align="center"><%=result.getString(8) %></td>
               <td align="center"><%=result.getString(9) %></td>
               <td align="center"><%=result.getString(10) %></td>
            </tr>
            <%
            }
               result.close();
      }catch (SQLException e){
         out.println("Oracle Database Student Table 레코드 삽입에 문제가 있습니다.");
         out.println(e.getMessage());
         e.printStackTrace();
      }finally{
         if(pstmt != null)         pstmt.close();
         if(stmt != null)          stmt.close();
         if(conn != null)         conn.close();
         
      }
            %>
            </table>
            <hr size="5" color="green">
   
</body>
</html>         