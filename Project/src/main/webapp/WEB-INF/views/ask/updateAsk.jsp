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

</head>
<body>
<div class="container" style="padding : 30px; max-width: 40%" >
	<h2 class="text-center">문의 수정</h2>
	<hr width = "100%" color = "gray">
	<form action ="updateAsk" method="POST">
	<input type="hidden" name="userid" value="${ask.userid}">
    <input type="hidden" name="ask_seq" value="${ask.ask_seq}">
		<div class="form-group">
            <label>작성자</label><br>
            <span>${ask.userid}</span>
        </div>
        <div class="form-group">
            <label>문의 제목</label>
            <input type="text" name="ask_title" class="form-control" id="title" value="${ask.ask_title}">
        </div>
        <div class="form-group">
            <label>문의내용 </label>
             <textarea name="ask_text" class="form-control" rows="5">${ask.ask_text}</textarea>
        </div>

	<input type="button" value="목록으로" onclick="location.href='/listAsk'" class="btn">
	<input type="submit" value="문의수정" class="btn">
	
	</form>
</div><!-- wrapper 종료 -->
</body>
</html>