<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Attractions</title>
<link rel="stylesheet" type="text/css" href="resources/css/tabs-common.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"></link>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	let areaData = {};
	var pageNo = 1;
	let areaCode = 0;
	const typeOf = '1';
	
	$(document).ready(function() {
		
		let uri = initUri();
		getData(uri);
		getBookmark();
		initPage();
		selectCity();
		buttons();
		home();
	});
	
	function initUri() {
		const url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		const path = "areaBasedList?";
		const serviceKey = "ZPZNEe3AqoTdcuRy%2BOxvrTqrmXJYb%2FYXN9rsn%2FCjtVvkQaV7X7UKeWk6HgOplQomrxQi2WjubBqYXVWndEb2Jg%3D%3D";
		const MobileApp = "AppTest";
		const MobileOS = "ETC";
		const _type = "json";
		const contentTypeId = "12";
		const numOfRows = "8";
		
		let uri = url + path
						  + "serviceKey=" + serviceKey + "&"
						  + "MobileApp=" + MobileApp + "&"
						  + "MobileOS=" + MobileOS + "&" 
						  + "_type=" + _type + "&"
						  + "numOfRows=" + numOfRows + "&"
						  + "contentTypeId=" + contentTypeId;
		return uri;
	}
	
	function initPage() {
		let html = "<div class='pageNo'> 1 </div>";
		$('#pageNo').append(html);
	}
	
	function selectCity() {
		$('.btn_city').on('click', function() {
			pageNo = 1;
			
			areaCode = $(this).attr('value');
			console.log(areaCode);
			
			let uri = initUri() + "&areaCode=" + areaCode;
			getData(uri);
			
			let html = "<div class='pageNo'>" + pageNo + "</div>";
			$('#pageNo').html('');
			$('#pageNo').append(html);
		});
	}
	
	
	function getData(uri) {
		$.get(uri, function(data, status) {
			if (status === 'success') {
				areaData = data.response.body.items;
				showList(areaData);

				let page = Math.floor(data.response.body.totalCount / 8);
				let html = "<div class='allPage'>  / " + page + "</div>";
				$('#allPage').html('');
				$('#allPage').append(html);
			} else alert('fail api');
		});
	}

	function getBookmark() {
		var userid = $('#loginId').val();
		console.log(userid);

		if (userid !== '') {
			$.ajax({
				type : 'get',
				url : 'getBookmark',
				data : {
					userid : userid,
					typeOf : typeOf
				},
				dataType : 'json',
				success : showBookmark,
				error : function(e) {
					alert('????????? ???????????? ?????? : ' + e);
					return false;
				}
			});
		}
	}

	function showBookmark(res) {

		if (res.length != 0) {
			$('.placeBox').each(function(index, obj) {
				console.log($(obj));
				var contentId = $(obj).find('.contentId').val();
				console.log(contentId);

				$.each(res, function(index, data) {
					console.log("data : " + data);

					if (data.contentId == contentId) {
						$(obj).find('.heart').attr('src', 'resources/image/full_heart.png');
						$(obj).find('.heart').attr('style', 'width:37px; height:37px;');
						$(obj).find('.heart').addClass('full_heart');
					}
				});
			});
		}
	}

	function showList(areaData) {

		$(".list").html('');

		$.each(areaData.item, function(i, data) {				
			let thumbnail = "<img src='resources/image/default/default_attraction.jpeg' class='thumbnail'/>";
			if (data.firstimage)
				thumbnail = "<img src=" + data.firstimage + " class='thumbnail'/>";

			let html = "";
			html += "<div class='placeBox'>";
			html += "<input type='hidden' class='contentId' value='" + data.contentid + "'/>";
			html += "<div class='imgBox'>";
			html += thumbnail;
			html += "<img src='resources/image/heart.png' class='heart' onclick='bookmark(this)'/>";
			html += "</div>";
			html += "<div class='title' onclick='goMap(this)'>" + data.title + "</div>";
			html += "<div class='addr' onclick='goMap(this)'>" + data.addr1 + "</div>";
			html += "</div>";

			$(".list").append(html);
		});

		getBookmark();
	}

	function goMap(obj) {
		var title = $(obj).text();
		console.log(title);
		var url = "https://map.naver.com/v5/search/" + title;
		window.open(url, '_blank');
	}

	function bookmark(obj) {

		var contentId = $(obj).parents('.placeBox').find('.contentId').val();
		var title = $(obj).parents('.placeBox').find('.title').text();
		var addr = $(obj).parents('.placeBox').find('.addr').text();
		var userid = $('#loginId').val();
		console.log(userid);

		if (userid === '') {
			alert('?????????????????????.');
			$(location).attr('href', '/loginForm');
		} else {
			if (!$(obj).attr('class').includes('full_heart')) {
				$(obj).attr('src', 'resources/image/full_heart.png');
				$(obj).attr('style', 'width:37px; height:37px;');
				$(obj).addClass('full_heart');

				saveToDB(contentId, title, addr, userid);
			} else {
				$(obj).attr('src', 'resources/image/heart.png');
				$(obj).attr('style', 'width:35px; height:35px;');
				$(obj).removeClass('full_heart');

				deleteFromDB(contentId, userid);
			}
		}
	}

	function saveToDB(contentId, title, addr, userid) {
		$.ajax({
			type : 'post',
			url : 'makeBookmark',
			data : {
				contentId : contentId,
				title : title,
				addr : addr,
				userid : userid,
				typeOf : typeOf
			},
			success : function() {
				alert('???????????? ?????????????????????.');
			},
			error : function(e) {
				alert('???????????? : ' + e);
				return false;
			}
		});
	}

	function deleteFromDB(contentId, userid) {
		$.ajax({
			type : 'post',
			url : 'deleteBookmark',
			data : {
				contentId : contentId,
				userid : userid
			},
			success : function() {
				alert('???????????? ?????????????????????.');
			},
			error : function(e) {
				alert('???????????? : ' + e);
				return false;
			}
		});
	}

	function buttons() {
		$('.btn_left').on('click', function() {
			if (pageNo !== 1) {
				pageNo -= 1;
				console.log(pageNo);
				console.log(areaCode);

				let uri = "";
				if (areaCode !== 0)
					uri = initUri() + "&areaCode=" + areaCode + "&pageNo=" + pageNo;
				else
					uri = initUri() + "&pageNo=" + pageNo;
				
				getData(uri);

				let html = "<div class='pageNo'>" + pageNo + "</div>";
				$('#pageNo').html('');
				$('#pageNo').append(html);
			}
		});

		$('.btn_right').on('click', function() {
			pageNo += 1;
			console.log(pageNo);
			console.log(areaCode);

			let uri = "";
			if (areaCode !== 0)
				uri = initUri() + "&areaCode=" + areaCode + "&pageNo=" + pageNo;
			else
				uri = initUri() + "&pageNo=" + pageNo;
			
			getData(uri);

			let html = "<div class='pageNo'>" + pageNo + "</div>";
			$('#pageNo').html('');
			$('#pageNo').append(html);
		});
	}

	function home() {
		$('#logo').click(function() {
			$(location).attr('href', '/');
		});
	}
</script>
</head>
<body>
<div id="all">
	<div id="logo">K-Travel</div>
	<div id="header">
		<img src="resources/image/default/default_attraction.jpeg"/>
		<div class="title">?????????</div>
	</div>
	<div id="location">
		<div class="title">????????? ?????????</div>
		<div class="selectCity">
	        <button class="btn_city" id="seoul" value="1">??????</button>
	        <button class="btn_city" id="gyongki" value="31">??????</button>
	        <button class="btn_city" id="incheon" value="2">??????</button>
	        <button class="btn_city" id="busan" value="6">??????</button>
	        <button class="btn_city" id="daegu" value="4">??????</button>
	        <button class="btn_city" id="gwangju" value="5">??????</button>
	        <button class="btn_city" id="daejeon" value="3">??????</button>
	        <button class="btn_city" id="ulsan" value="7">??????</button>
	        <button class="btn_city" id="gangwon" value="32">??????</button>
	        <button class="btn_city" id="gyungnam" value="36">??????</button>
	        <button class="btn_city" id="gyungbuk" value="35">??????</button>
	        <button class="btn_city" id="jeonnam" value="38">??????</button>
	        <button class="btn_city" id="jeonbuk" value="37">??????</button>
	        <button class="btn_city" id="chungnam" value="34">??????</button>
	        <button class="btn_city" id="chungbuk" value="33">??????</button>
	        <button class="btn_city" id="sejong" value="8">??????</button>
	        <button class="btn_city" id="jeju" value="39">??????</button>
		</div>
	</div>
	<input type="hidden" id="loginId" value="${sessionScope.loginId}">
	<div id="container">
		<div class="btn_left"><img src="resources/image/left.png"/></div>
		<div class="list"></div>
		<div class="btn_right"><img src="resources/image/right.png"/></div>
	</div>
	<div id="page">
		<div id="pageNo"></div>
		<div id="allPage"></div>
	</div>
	<div id="footer">
		<p>Copyright 2021. ???????????? team, Ltd. all rights reserved.</p>
		<p>?????????, ?????????, ?????????, ?????????</p>
		<p>Inquiry : uzzing1219@gmail.com</p>
	</div>
</div>
</body>
</html>
