<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 국제화 태그를 사용하기 위해서 아래와 같이 2개의 taglib 지시어를 선언한다.
Core는 c, 국제화는 fmt라는 접두어를 사용한다. -->    
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%--@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" --%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>
<!-- 
국제화태그(Formatting) 태그
: 국가별로 다양한 언어, 날짜, 시간, 숫자형식을 설정할 때 사용한다.
접두어는 fmt를 사용한다.
 -->
	<h4>숫자 포맷 설정</h4>
	<c:set var="number1" value="12345"/>
	<!-- 
	groupingUsed : 세자리마다 컴마를 출력한다. 디폴트값이 true이므로
		콤마를 출력하고 싶지 않다면 false를 지정한다.
	 -->
	콤마 O : <fmt:formatNumber value="${ number1 }"/> <br />
	콤마 X : <fmt:formatNumber value="${ number1 }" groupingUsed="false"/> <br />
	
	<!-- 
	type : currency인 경우 현재 통화기호로 출력된다.
	var속성 지정시 즉시 출력되지 않고 원하는 위치에 EL을 통해 출력한다.
	currencySymbol 속성으로 통화기호를 변경할 수 있다.
	 -->
	<fmt:formatNumber value="${ number1 }" type="currency" var="printNum1"/>
	통화기호 : ${ printNum1 } <br />
	<fmt:formatNumber value="${ number1 }" type="currency" var="printNum1" currencySymbol="$"/>
	통화기호(달러) : ${ printNum1 } <br />
	
	<!-- 
	value 속성값을 %단위로 변환해서 출력한다. 즉 100을 곱한 결과에 %기호까지 추가해준다.
	 -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	퍼센트 : ${ printNum2 }
	<!-- 
	Integer.parseInt()와 동일한 기능으로 문자열을 숫자로 변경한다.
	pattern : 반환할 문자열의 패턴을 지정하여 파싱한다.
	integerOnly : 소수점 이하를 절삭하여 정수부분만 출력한다.
	 -->
	<h4>문자열을 숫자로 변경</h4>
	<c:set var="number2" value="86,789.01"/>
	<!-- 
	pattern으로 주어진 부분을 분석하여 문자열을 숫자형식으로 파싱한다.
	해당 속성값으로 
		000,000.00 사용시 정상
		0,0.0 사용시 정상
		,. 사용시에는 에러가 발생한다.
	 -->
	<fmt:parseNumber value="${ number2 }" pattern="0,0.0" var="printNum3"/>
	소수점까지 : ${ printNum3 } <br />
	<fmt:parseNumber value="${ number2 }" integerOnly="true" var="printNum4"/>
	정수 부분만 : ${ printNum4 }
</body>
</html>





















