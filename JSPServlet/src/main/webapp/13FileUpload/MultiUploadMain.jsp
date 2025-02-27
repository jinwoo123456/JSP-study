<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	/* 
	폼값을 submit(제출 or 전송) 할 떄 빈 값에 대한 검증을 진행한다.
	만약 빈값이 발견되면 이벤트 리스너 쪽으로 false를 반환한다.
	그러면 전송은 취소된다.
	*/
	function validateForm(form) {
		if (form.title.value =="") {
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if (form.ofile.value =="") {
			alert("첨부파일은 필수 입력입니다.");
			return false;
		}
	}
</script>
<body>
	<h3>파일 업로드(multiple속성추가)</h3>
	<span style="color:red;">${errorMessage }</span>
	<form action="MultipleProcess.do"
			name="fileForm" method="post"
			enctype="multipart/form-data"
			onsubmit="return validateForm(this);">
		제목 : <input type="text" name="title" /> <br />
		<!-- file타입의 input태그에 multiple 속성을 부여하면
		ctrl, shift 혹은 드래그&드롭으로 2개이상 파일을 선택할 수 있다. -->
		첨부파일: <input type="file" name="ofile" multiple /> <br />
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>