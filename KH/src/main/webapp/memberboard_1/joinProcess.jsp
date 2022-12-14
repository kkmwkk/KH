<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.DataSource, javax.naming.*" %>    
    
<%
   request.setCharacterEncoding("UTF-8");

   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String name = request.getParameter("name");
   int age = Integer.parseInt(request.getParameter("age"));
   String addr = request.getParameter("addr");
   String tel = request.getParameter("tel");
   String gender = request.getParameter("gender");
   String[] hobby = request.getParameterValues("hobby");
   String email = request.getParameter("email");
   
   
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   String hobbys = "";
   
   
   try{
      Context init = new InitialContext();
      DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
      
      for(int i = 0; i < hobby.length; i++){
    	  if(i == (hobby.length-1)){
    		  hobbys += hobby[i];
    	  }else{
    		  hobbys += hobby[i] + ","; 
    	  }  	  
      }
      
      pstmt = conn.prepareStatement("INSERT INTO member_2 VALUES(?,?,?,?,?,?,?,?,?)");
      pstmt.setString(1, id);
      pstmt.setString(2, pass);
      pstmt.setString(3, name);
      pstmt.setInt(4, age);
      pstmt.setString(5, addr);
      pstmt.setString(6, tel);
      pstmt.setString(7, gender);
      pstmt.setString(8, hobbys);
      pstmt.setString(9, email);
      
      int result = pstmt.executeUpdate();
      
      if(result != 0)
      {
         out.println("<script>");
         out.println("location.href='loginForm.jsp'");
         out.println("</script>");
      }else
      {
         out.println("<script>");
         out.println("location.href='joinForm.jsp'");
         out.println("</script>");
      }
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      try{
         pstmt.close();
         conn.close();
      }catch(Exception e)
      {
         e.printStackTrace();
      }
   }
%>