<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 객체 매개변수</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<ul>
		<li>Person 객체 => 이름 : ${ personObj.name },
							나이 : ${ personObj.age }</li>
		<li>String 객체 => ${ requestScope.stringObj }</li>
		<li>Integer 객체 => ${ integerObj }</li>
	</ul>
	<!-- 
	파라미터로 전달된 값을 읽을 떄 아래 3가지 방법을 사용할 수 있다.
	param.파라미터명
	param['파라미터명']
	param["파라미터"]
	 -->
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- 
		파라미터로 전달되는 값은 항상 String타입으로 반환된다.
		따라서 산술연산을 위해서는 반드시 숫자형식으로 변환해야한다.
		하지만 El에서는 자동으로 숫자형식으로 변환되므로 아래와같이 즉시 연산할 수 있다.
		 -->
		<li>${ param.firstNum + param['secondNum'] }</li>
		
		<!-- 파라미터를 문자형식으로 출력했으므로 10+20이 된다. -->
		<li>${ param.firstNum } + ${ param["secondNum"] }</li>
	</ul>
</body>
</html>




















