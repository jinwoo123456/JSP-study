
<%@page import="membership.MemberDAO"
 %>
 <%@page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" %>
 
 <%
 String user_id = request.getParameter("id");
 MemberDAO dao = new MemberDAO(application);
 boolean idExist = dao.idOverapping(user_id);%>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script>
    function idUse(){
        opener.document.registFrm.id.value = 
        document.overlapFrm.retype_id.value;
        self.close();
    }
  
    window.onload = function(){
        //현재 주소창에 입력된 URL을 가져온다. 
        var url = location.href;
        console.log(url);
        //물음표(?) 및 엠퍼센트(&)를 통해 문자열을 배열로 만든다. 
        var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
        console.log(parameters[0]);//id=입력된값
        //이퀄(=)을 통해 split한다. 
        returnValue = parameters[0].split('=')[1];
        //span태그에 삽입한다. 
        document.getElementById('user_id').innerHTML = returnValue;
    }
    
</script>
</head>
<body>
<% if(idExist ==true){
	
%>
<h4>
중복된 아이디가 있습니다. 다시 입력해주세요.
</h4>
    <form name="overlapFrm">
        <input type="text" name="id" size="20" />   
        <input type="submit" value="중복확인" />
    </form>
<%
}else{%>
<h3>사용가능한 아이디입니다.</h3>
    <form name="overlapFrm">
        <input type="text" name="retype_id" size="20"
        value="<%=request.getParameter("id") %>" readonly />   
        <input type="button" value="아이디사용하기" onclick="idUse();" />
    </form>
<%} %>
    <h2>아이디 중복 확인하기</h2>
    <h3>부모창에서 입력한 아이디 : <%=request.getParameter("id")%></h3>
    <h3>아이디가 중복되었을때 재입력한 아이디</h3>
    <form name="overlapFrm">
        <input type="text" name="retype_id" size="20" />   
        <input type="button" value="아이디사용하기" onclick="idUse();" />
    </form>
</body>
</html>