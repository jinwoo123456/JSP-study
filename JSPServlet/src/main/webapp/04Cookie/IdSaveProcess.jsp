    <%@ page import = "utils.CookieManager" %>
        <%@ page import = "utils.JSFunction" %>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //전송된 폼값을 받는다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");
/* 
체크박스의 경우 2개 이상의 항목이라면 getParameterValues 메서드를 사용해야한다.
1개인 경우에는 일반적인 폼값과 동일하게 받을 수 있다.
*/

//로그인 성공
if ("must".equals(user_id)&& "1234".equals(user_pw)){
	if (save_check !=null && save_check.equals("Y")){
		//로그인 성공하고 아이디 저장에 체크한 상태라면
		//쿠키를 생성한다.
		CookieManager.makeCookie(response,"loginId",user_id,86400);
		//쿠키에는 로그인 아이디를 저장하고 유효시간은 하루로 설정한다.
	}
	
	else{
		//로그인 성공했지만 체크를 해제한 상태라면 쿠키를 삭제한다.
		CookieManager.deleteCookie(response,"loginId");
	}
	JSFunction.alertLocation("로그인에 성공하였습니다.", "IdSaveMain.jsp", out);
}
else{
	
	//로그인 실패 // 메세지를 띄우고 뒤로 이동한다.
	JSFunction.alertBack("로그인실패", out);
/* 
유틸리티 클래스(현재는 JSFunction)가 없다면 이와 
같이 스크립트렛으로 html영역을 만들어준 뒤 스크립트 태그를 추가해야 하므로 
불편하다 
예( 이거 추가해야 함 ):
	<script>
alert('로구인실패')
history.go(-1);
</script>
*/

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>	