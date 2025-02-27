<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach2</title>
</head>
<body>
<!-- 
forEach 태그의 향상된 for문 형태
: 주로 배열이나 컬렉션에서 값을 순차적으로 접근할 때 사용한다.
속성]
	items: 사용할 배열이나 컬렉션을 지정
	var: 해당 루프에서 반환해준 인스턴스를 저장할 변수명을 지정
 -->
	<h4>향상된 for 문 형태의 forEach 태그</h4>
	<%
	String[] rgba = {"Red", "Orange", "Yellow", "Green", "Blue","Violet", "Black"};
	%>
	<!-- 배열의 크기만큼 반복하여 span태그가 4번 출력된다. -->
	<c:forEach items="<%= rgba %>" var="c">
		<span style="color:${ c };">${ c }</span>
		<br />
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<!-- 
	개선된 for문에서의 varStatus 속성
		index: 현재 루프에서의 인덱스를 표현. 0부터 시작
		current: 현재 루프의 실제 요소(인스턴스)를 반환
		count: 실제 반복횟수로 1부터 시작
		first/last: 처음과 마지막에 true를 반환함
	 -->
	<table border="1">
		<c:forEach items="<%= rgba %>" var="c" varStatus="loop">
			<tr>
				<td>count : ${ loop.count }</td>
				<td>index : ${ loop.index }</td>
				<td>current : ${ loop.current }</td>
				<td>first : ${ loop.first }</td>
				<td>last : ${ loop.last }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>




















