<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 2</title>
</head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
	//List 계열의 컬렉션 생성
	LinkedList<Person> lists = new LinkedList<Person>();
	//Person 인스턴스 3개 추가
	lists.add(new Person("맹사성", 34));
	lists.add(new Person("장영실", 44));
	lists.add(new Person("신숙주", 54));
	%>
	<!-- set태그로 page영역에 속성(변수)을 저장 -->
	<c:set var="lists" value="<%= lists %>"/>
	<!-- 
	저장한 속성값을 확장for문에 적용하여 실행한다. items에 지정한
	list에 저장된 인스턴스의 갯수만큼 반복하여 list로 하나씩 전달한다.
	 -->
	<c:forEach items="${ lists }" var="list">
	<!-- 저장된 순서대로 Person 인스턴스를 인출하고, getter를 통해
	멤버변수에 저장된 값을 출력한다. -->
		<li>
			이름 : ${ list.name }, 나이 : ${ list.age }
		</li>
	</c:forEach>
	
	<h4>Java 코드를 통한 출력</h4>
	<%
	/* Java 코드를 사용하면 출력할 인스턴스를 명시한 후 getter를 직접 호출해야한다.
	하지만 JSTL과 EL을 사용하면 멤버변수명 만으로 출력기 기능하다.*/
	for (Person p : lists) {
		out.println("이름: "+ p.getName() +", 나이: "+p.getAge()+"<br>");
	}
	%>
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
	// Map 계열의 컬렉션을 생성. Key는 String, Value는 Person타입으로 지정
	Map<String,Person> maps = new HashMap<String,Person>();
	// 인스턴스 3개 저장
	maps.put("1st", new Person("맹사성",34));
	maps.put("2nd", new Person("장영실",44));
	maps.put("3rd", new Person("신숙주",54));
	%>
	<!-- 변수 선언 -->
	<c:set var="maps" value="<%= maps %>"/>
	<!-- 
	Map 사용시 Key를 별도로 얻어올 필요없이 '변수명.key' 혹은 '변수명.value'를 통해
	값을 인출하여 출력할 수 있다.
	 -->
	<c:forEach items="${ maps }" var="map">
		<li>Key => ${ map.key } <br />
			Value => 이름: ${ map.value.name }, 나이: ${ map.value.age }
		</li>
	</c:forEach>
	
	<h4>Java코드를 통한 출력</h4>
	<%
	//Map은 항상 Key를 먼저 얻어와야한다.
	Set<String> keys = maps.keySet();
	// 얻어온 Key의 갯수만큼 반복한다.
	for(String k : keys) {
		//현재 루프의 Key를 통해 Value를 인출한다.
		Person p = maps.get(k);
		out.print("Key: " + k + "<br>");
		/* 인출된 Value는 Person 인스턴스이므로 getter르 ㄹ통해 멤버변수값을 출력한다. */
		out.print("Value:" + p.getName()+","+ p.getAge()+"<br>");
	}
	%>
</body>
</html>




























