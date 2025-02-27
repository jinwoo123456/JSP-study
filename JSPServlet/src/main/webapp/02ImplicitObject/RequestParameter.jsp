<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
<%
/* GET 혹은 POST 방식의 전송에 따라 한글 꺠질떄 아래와 같이 인코딩처리 */
/* Tomcat9.x 부터는 별도의 설정이 없어도 되지만 문제가 생기는 경우 추가 */
request.setCharacterEncoding("UTF-8");
/* 
클라이언트가 전송한 폼값이 1개인 경우 getParameter() 메서드로 받을 수 있다.
input 태그의 text, hidden, radio 속성 등에서 사용할 수 있다.
*/
String id = request.getParameter("id");
String sex = request.getParameter("sex");
/* 
전송한 폼값이 2개 이상인 경우 사용한다. 이때에는 문자열 배열로 받을 수 있다.
input태그의 checkbox 혹은 select태그의 multiple 속성이 부여되어있을때 
사용할 수 있다.
*/
String[] favo = request.getParameterValues("favo");
String favoStr = "";
// 체크박스에서 선택한 항목이 있는 경우
if (favo != null) {
	//선택한 항목의 갯수, 즉 배열의 크기만큼 반복
	for (int i = 0 ; i < favo.length; i++ ) {
		//문자열 변수에 누적해서 선택값을 연결
		favoStr += favo[i] + " ";
	}
}
/* 
textarea 태그는 2줄 이상 엔터를 통해 입력할 수 있으므로, 웹브라우저에서 출력시
<br>태그로 변경해야 한다.
*/
String intro = request.getParameter("intro").replace("\r\n", "<br/>");
%>
<ul>
	<li>아이디: <%= id %></li>
	<li>성별: <%= sex %></li>
	<li>관심사항: <%= favoStr %></li>
	<li>자기소개: <%= intro %></li>
</ul>
</body>
</html>