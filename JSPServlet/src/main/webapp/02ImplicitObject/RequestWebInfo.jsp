<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li>데이터 전송 방식: <%=request.getMethod()%></li>
		<!-- HOST명을 포함한 전체 경로 표시 -->
		<li>URL: <%=request.getRequestURL()%></li>
		<!-- HOST명을 제외한 경로를 표시 -->
		<li>URI: <%=request.getRequestURI()%></li>
		<li>프로토콜: <%=request.getProtocol()%></li>
		<li>서버명: <%=request.getServerPort()%></li>
		<li>서버 포트: <%=request.getServerPort()%></li>
		<li>클라이언트 IP 주소: <%=request.getRemoteAddr()%></li>
		<!-- POST방식의 전송에서는 값이 출력되지 않음,GET 방식에서만 보임. -->
		<li>쿼리스트링: <%=request.getQueryString()%></li>
		<!-- getParameter 중요 -->
		<!-- 클라이언트가 전송한 폼값을 서버에서 받은 후 출력 -->
		<li>전송된 값 1: <%=request.getParameter("eng")%></li>
		<li>전송된 값 2: <%=request.getParameter("han")%></li>
	</ul>
</body>
</html>