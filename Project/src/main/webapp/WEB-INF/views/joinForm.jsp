<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join member</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"></link>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#idCheck").on("click",function(){
		var id = $("#userid").val();
		console.log(id);
		
		if (id == "") {
			alert("아이디를 입력해 주세요");
			return false;
		} else if (id.length < 3 || id.length > 10) {
			alert("아이디는 3~10 글자 사이로 입력해 주세요");
			return false;
		}
		
		$.ajax({
			url : "idCheck",
			type : "post",
			data : { userid : id },
			success : function(res) {
				console.log(res);
				if (res === 0) alert("사용 가능한 아이디 입니다.");
				else alert("아이디가 있습니다.");
			},
			error : function(e){
				alert("가입 에러 : " + e);
			}
		});
	});
});

function formCheck() {
	var id = $("#userid").val();
	var password = $("#userpwd").val();
	
	if (id == "") {
		alert("아이디를 입력해 주세요");
		return false;
	} else if (id.length < 3 || id.length > 10){
		alert("아이디는 3~10 글자 사이로 입력해 주세요");
		return false;
	}
	
	if (password == "") {
		alert("비밀번호를 입력해 주세요");
		return false;
	} else if (password.length < 3 || password.length > 10) {
		alert("비밀번호는 3~10 글자 사이로 입력해 주세요");
		return false;
	}
	
	return true;
}
</script>
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
</style>
</head>
<body>
<div id="logo">K-Travel</div>
	<form action="/join" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userid" id="userid">
					<input type="button" id="idCheck" value="중복검사">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="userpwd" id="userpwd">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="가입">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>