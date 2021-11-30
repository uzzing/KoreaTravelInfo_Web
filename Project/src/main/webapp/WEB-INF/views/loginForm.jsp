<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"></link>
<style type="text/css">
body {
	position: absolute;
  	top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
	font-family: 'Gowun Dodum', sans-serif;
}

#logo {
	font-size: 70px;
	font-family: 'Comforter Brush', cursive;
	text-align: center;
}

#logo:hover {
	cursor: pointer;
}

.wrap form {
	text-align: center;
}

#joinLine {
	width: 330px;
	display: table;
	text-align: center;
}

.text {
	margin-right: 10px;
	margin-left: 30px;
	margin-top: 25px;
	font-size: 20px;
	float: left;
	text-align: center;
}

.join {
	width: 70px;
    font-size: 15px;
    padding: 5px;
    border: 1px solid #adadad;
    border-radius: 5px;
    box-shadow: 1px 1px 2px 1px #adadad;
    text-align: center;
    float: left;
    margin-top: 23px;
}

.join:hover {
	cursor: pointer;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#btn_login").on("click", function() {
		$("form").submit();
	});
	
	// validation
	$("form").submit(function(event) {
		
		let userid = $("#userid").val();
		let userpwd = $("#userpwd").val();
		
		if (userid === "") {
			alert("아이디를 입력해주세요");
			event.preventDefault();
			return;
		}
		
		if (userpwd === "") {
			alert("패스워드를 입력해주세요");
			event.preventDefault();
			return;
		}
	});
	
	$('#logo').click(function() {
		$(location).attr('href', '/');
	});
	
	$('.join').click(function() {
		$(location).attr('href', '/joinForm');
	});
});
</script>
</head>
<body>
<div id="logo">K-Travel</div>
<div class="wrap">
	<form action="/login" method="POST">
		<label>ID &nbsp; &nbsp; &nbsp;<input type="text" id="userid" name="userid"></label>
		<br>
		<label>PW &nbsp; &nbsp;<input type="password" id="userpwd" name="userpwd"></label>
		<div style="padding-top: 10px; padding-left: 30px;">
			<input type="submit" id="btn_login" value="LOGIN">
		</div>
	</form>
</div>
<div id="joinLine">
	<div class="text">아직 계정이 없으신가요?</div>
	<div class="join">회원가입</div>
</div>
</body>
</html>