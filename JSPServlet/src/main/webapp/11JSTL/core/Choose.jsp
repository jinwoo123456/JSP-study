<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL = choose/when/otherwise</title>
</head>
<body>
<!-- 
choose~when~otherwise 태그
: 여러개의 조건이 있는 경우에 사용할 수 있는 태그로 <if>태그를
보완하는 기능을 가지고 있다.
 -->
	<!-- 변수 선언 -->
	<c:set var="number" value="100"/>
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	<!-- number를 2로 나눈 나머지가 0이면 짝수로 판단하고 아니면 홀수로 판단하는 문장 -->
	<c:choose>
		<c:when test="${ number mod 2 eq 0 }">
			${ number }는 짝수입니다.
		</c:when>
		<c:otherwise>
			<!-- if문의 else와 동일한 역할을 한다. 위의 조건에
			만족하지 않을 때 실행된다. -->
			${ number }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	<!-- 
	choose태그와 when태그 사이에 HTML주석을 기술하면 에러가 발생한다.
	또한 when과 otherwise사이에도 기술하면 안된다.
	 -->
	
	<h4>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h4>
	<form action="">
		국어 : <input type="text" name="kor"/> <br />
		영어 : <input type="text" name="eng" /> <br />
		수학 : <input type="text" name="math" /> <br />
		<input type="submit" value="학점 구하기"/>
	</form>
	<!-- 국, 영, 수 세과목 모두 점수를 입력해야하지만 조건에 만족하므로
	하나라도 입력하지 않으면 평균점수는 출력되지 않는다. -->
	<c:if test="${ not (empty param.kor or empty param.eng or empty param.math) }">
		<!-- 3과목의 점수를 더한 후 평균을 계산한다. EL은 자동형변환이 지원되므로
		경우에 따라 실수의 결과가 나올 수 있다. -->
		<c:set var="avg" value=
		"${ (param.kor + param.eng + param.math) / 3 }"/>
		평균 점수는 ${ avg } 으로
		<!-- 평균점수를 통해 조건을 걸어 학점을 출력한다.
		when 태그는 if/else if 와 동일하고, otherwise는 else와 동일하다. -->
		<c:choose>
			<c:when test="${avg >= 90 }">A 학점</c:when>
			<c:when test="${avg >= 80 }">B 학점</c:when>
			<c:when test="${avg ge 70 }">C 학점</c:when>
			<c:when test="${avg ge 60 }">D 학점</c:when>
			<c:otherwise>F 학점</c:otherwise>
		</c:choose>
		입니다.
	</c:if>
</body>
</html>























