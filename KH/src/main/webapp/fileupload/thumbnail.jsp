<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String imagePath=request.getRealPath("upload");
	int size = 10*1024*1024;
	String filename = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request, imagePath, size, "utf-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		filename = multi.getFilesystemName(file);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	ParameterBlock pb=new ParameterBlock();
	pb.add(imagePath+"/"+filename);
	RenderedOp rOp=JAI.create("fileload", pb);
	
	BufferedImage bi = rOp.getAsBufferedImage();
	BufferedImage thumb = new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
	
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,100,100,null);
	
	File file = new File(imagePath + "/sm_" + filename);
	ImageIO.write(thumb, "jpg", file);
	
/*
	아래 주소줄에서 CLASSPATH 다운로드-> 오라클 lib 폴더에 codec.jar, core.jar 붙여넣기.
	https://www.oracle.com/java/technologies/java-archive-downloads-java-client-downloads.html
	
	썸네일 : 원래 이미지보다 작은 이미지를 의미한다. 작은 이미지를 이용하여 이미지 검색을 빨리할 수 있는 일반문자열의 인덱스와 비슷한역할을 한다.
	갤러리 기능 등을 구현할 때 전체 리스트를 작은 이미지로 미리 보여줌으로써 전체 이미지를 먼저보고 원하는 이미지를 선택하게 하는 등의 기능을 구현할 수 있다.
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 썸네일 예제</title>
</head>
<body>
	- 원본 이미지 -<br>
	<img src="/first_jsp104/upload/<%= filename%>"><p>
	- 썸네일 이미지 -<br>
	<img src="/first_jsp104/upload/sm_<%= filename%>">
</body>
</html> --%>