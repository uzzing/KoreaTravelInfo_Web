<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	function formCheck(){
		let title = document.getElementById("title");
		let text = document.getElementById("text");
		
		if(title.value.trim().length == 0 || text.value.trim().length == 0 ){
			alert('글제목과 내용은 입력되어야합니다');
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container" style="padding: 30px; max-width: 40%">
		<h2 class="text-center">문의 작성</h2>
		<hr width="100%" color="gray">
		<form action="writeAsk" method="POST">
			<input type="hidden" name="userid" value="${sessionScope.loginId}">
			<div class="form-group">
				<label>작성자</label>
				<br>
				<span>${sessionScope.loginId}</span>
			</div>
			<div class="form-group">
				<label>문의 제목</label>
				<input type="text" name="ask_title" class="form-control" id="title">
			</div>
			<div class="form-group">
				<label>문의 내용</label>
				<textarea name="ask_text" class="form-control" rows="5" id="text"></textarea>
			</div>
			<input type="button" value="목록으로" onclick="location.href='/listAsk'" class="btn"> 
			<input type="submit" value="문의하기" onclick="return formCheck();" class="btn">
		</form>
	</div>
	<!-- wrapper 종료 -->
</body>
</html>