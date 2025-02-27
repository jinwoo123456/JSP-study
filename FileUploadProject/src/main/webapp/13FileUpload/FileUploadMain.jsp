<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
<script>

/* 폼값을 submit (제출 or 전송) 할 떄 빈값에 대한 검증을 진행한다.
만약 빈값이 발견되면 이벤트 리스너 쪽으로 false를 반환한다.
그러면 전송은 취소된다.*/
function validateForm(form){
	if (form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
		
	}
	if (form.ofile.value == ""){
		alert("첨부파일은 필수 입력입니다.");
		return false;
	}
}
</script>

</head>
<body>
<h3>파일 업로드</h3>
<!-- 
파일첨부를 위한 <form>태그 구성 시 2가지 필수사항
1.method(전송방식)은 반드시 post로 지정
2.enctype 속성은 'multipart/form-data'로 지정
만약 get방식으로 지정하면 파일이 전송되는게 아니라 파일명만 전송된다.
 -->
<span  style="color: red;">${errorMessage }</span> 
<form name="fileForm" method="post" 
enctype="multipart/form-data" 
action="MultipleProcess.do"`
onsubmit="return validateForm(this);"
	
>
<!-- action="UploadProcess.do" -->
<!-- onsubmit="return validateForm(this);" -->
<!-- text타입은 일반적인 한줄 입력상자 -->
제목 : <input type="text" name="title"	 /> <br />







카테고리 :
<input type="checkbox" name="cate" value="Java" / >Java
<input type="checkbox" name="cate" value="JSP" / >JSP
<input type="checkbox" name="cate" value="Python" / >Python
<input type="checkbox" name="cate" value="Ai" / >Ai
<br />





<!-- 파일 첨부를 위한 file타입 지정. 파일 선택을 위한 버튼이 출력된다. -->
<!-- file타입에 input태그에 muliple 속성을 부여하면
ctrl,shift 혹은 드래그&드롭으로 2개 이상의 파일을 선택할 수 있다. -->
첨부파일 : <input type="file" name="ofile" multiple /> <br />
<input type="submit" value="전송하기" /> 
</form>
</body>
</html>