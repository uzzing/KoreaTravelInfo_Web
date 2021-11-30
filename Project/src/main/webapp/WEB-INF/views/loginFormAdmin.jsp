<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Login for Administrator</title>
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
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#btn_login").on("click", function() {
		$("form").submit();
	});
	
	// validation
	$("form").submit(function(event) {
		
		let adminid = $("#adminid").val();
		let adminpwd = $("#adminpwd").val();
		
		if (adminid === "") {
			alert("아이디를 입력해주세요");
			event.preventDefault();
			return;
		}
		
		if (adminpwd === "") {
			alert("패스워드를 입력해주세요");
			event.preventDefault();
			return;
		}
	});
	
	$('#logo').click(function() {
		$(location).attr('href', '/');
	});

});
</script>
</head>
<body>
<div id="logo">K-Travel</div>
<div class="wrap">
	<form action="/loginAdmin" method="POST">
		<label>ID &nbsp; &nbsp; &nbsp;<input type="text" id="adminid" name="adminid"></label>
		<br>
		<label>PW &nbsp; &nbsp;<input type="password" id="adminpwd" name="adminpwd"></label>
		<div style="padding-top: 10px; padding-left: 30px;">
			<input type="submit" id="btn_login" value="LOGIN">
		</div>
	</form>
</div>
</body>
</html>