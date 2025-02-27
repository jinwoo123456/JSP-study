<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.File" %>
    <%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>
<!--  하나의 파일만 등록하기 위한 작성폼-->
<h2>DB에 등록된 파일 목록 보고</h2>
<!--  2개 이상의 파일을 등록하기 위한 작성폼-->
<a href="FileUploadMain.jsp">파일등록1</a>
<a href="MulitUploadMain.jsp">파일등록1</a>
<%
//업로드 디렉토리의 물리적(혹은 절대) 경로 얻어오기
String saveDirectroy = application.getRealPath("/Uploads");
//해당 경로를 통해 File 인스턴스 생성
File file = new File(saveDirectroy);
//디렉토리에 저장된 파일의 목록을 배열로 얻어온다.
File[] fileList = file.listFiles();
%>
<table border="1">

<tr>
	<th>NO</th>
	<th>파일명</th>
	<th>크기</th>
	<th></th>
</tr>
<% 
int fileCnt= 1;
for (File f : fileList){
%>
<tr>
	<td><%=fileCnt %></td>
	<!-- 이미지 출력 -->
	<td><%=f.getName() %></td>
	<!-- 파일명 -->
	<td><img src="../Uploads/<%= f.getName() %>" style="max-width:300px;" alt="" /></a></td>
	
	<!-- 파일의 크기(Kb) 출력 -->
	<td><%= (int)Math.ceil(f.length()/1024.0) %>Kb</td>
	<!-- 파일의 다운로드 링크 -->
	<td><a href="Download.jsp?oName=myImage.jpg&sName=<%=f.getName()%>">[다운로드]</a></td>
</tr>	

<% fileCnt++;}%>
</table>
</body>
</html>