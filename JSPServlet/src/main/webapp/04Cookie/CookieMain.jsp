<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
<!--  
쿠기(Cookie) : 클라이언트의 상태 정보를 유지하기 위한 기술로 클라이언트의 PC에 파일 형태로
			저장된다. 쿠키 하나의 크기는 4Kb이고 3000개까지 만들 수 있다.
-->
	<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	/* 쿠키는 생성자를 통해서만 생성할 수 있다. setName()이라는 setter가 없으므로
		생성후에는 쿠키명을 변경할 수 없다.*/
	Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
	/* 쿠키의 경로설정. 컨텍스트 루트 경로로 지정하여 웹애플리케이션 전체에서 사용할 수
		있도록한다.*/
	cookie.setPath(request.getContextPath());
	/* 쿠키의 유효시간 설정. 60*60 으로 1시간 */
	cookie.setMaxAge(3600);
	/* 응답헤더에 쿠키를 추가하여 클라이언트 측으로 전송한다. */
	response.addCookie(cookie);
	/*  
	여기까지의 코드를 통해 클라이언트 측에 쿠키가 생성된다. 생성된 쿠키는 개발자 모드에서 확인가능
	*/
	%>
	
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	/*  
	request 내장객체를 통해 생성된 모든 쿠키를 배열의 형태로 얻어올수 있다.
	*/
	Cookie[] cookies = request.getCookies();
	if (cookies!=null) {
		//확장 for문으로 쿠키를 하나씩 인출한다.
		for (Cookie c : cookies) {
			// 쿠키명과 값을 변수에 저장한 후 웹브라우저에 출력한다.
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.println(String.format("%s : %s<br />", cookieName, cookieValue));
		}
	}
	/*  
	쿠키가 생성된 직후에는 쿠키값을 읽을 수 없다. 클라이언트 측에 저장된 쿠키를 서버로 다시
	전송하기 위해 페이지 이동을 하거나, 새로고침하여 새로운 요청을 보내야만 읽을 수 있다.
	*/
	%>
	
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<!--  
	쿠키는 유효시간이 지나지 않는다면 웹애플리케이션 어디서든 값을 읽을 수 있다.
	즉 페이지 이동을 하더라도 설정된 경로내에서는 값이 소멸되지 않는다.
	-->
	<a href="CookieResult.jsp">
		다음 페이지에서 쿠키값 확인하기
	</a>
</body>
</html>