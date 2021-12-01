<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/css/home.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"></link>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/slick.min.js"></script>
<script type="text/javascript">

	let areaData = {};
	let pages = "";
	var numSlick = 0;
	
	$(document).ready(function() {
		
		const url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		const path = "areaBasedList?";
		const serviceKey = "ZPZNEe3AqoTdcuRy%2BOxvrTqrmXJYb%2FYXN9rsn%2FCjtVvkQaV7X7UKeWk6HgOplQomrxQi2WjubBqYXVWndEb2Jg%3D%3D";
		const MobileApp = "AppTest";
		const MobileOS = "ETC";
		const _type = "json";
		const numOfRows = "10";
		
		let uri = url + path
						  + "serviceKey=" + serviceKey + "&"
						  + "MobileApp=" + MobileApp + "&"
						  + "MobileOS=" + MobileOS + "&" 
						  + "_type=" + _type + "&"
						  + "numOfRows=" + numOfRows + "&"
						  + "contentTypeId=";
		
		attractionList(uri);
		accommodationList(uri);
		restaurantList(uri);
		shoppingList(uri);
		
		buttons();
		googleTranslateElementInit();
	});
	
	function attractionList(uri) {
		
		const contentTypeId = "12";
		
		// show list
		$.get(uri + contentTypeId + "&pageNo=10&areaCode=1", function(data, status) {
			if (status === 'success') {
				areaData = data.response.body.items;
				showList(areaData, contentTypeId);
			} 
			else alert('fail api');
		});
	}
	
	function accommodationList(uri) {
		
		const contentTypeId = "32";
		
		// show list
		$.get(uri + contentTypeId + "&pageNo=50", function(data, status) {
			if (status === 'success') {
				areaData = data.response.body.items;
				showList(areaData, contentTypeId);
			} 
			else alert('fail api');
		});
	}
	
	function restaurantList(uri) {

		const contentTypeId = "39";
		
		// show list
		$.get(uri + contentTypeId + "&pageNo=100", function(data, status) {
			if (status === 'success') {
				areaData = data.response.body.items;
				showList(areaData, contentTypeId);
			} 
			else alert('fail api');
		});
	}
	
	function shoppingList(uri) {
		
		const contentTypeId = "38";
		
		// show list
		$.get(uri + contentTypeId + "&pageNo=70", function(data, status) {
			if (status === 'success') {
				areaData = data.response.body.items;
				showList(areaData, contentTypeId);
			} 
			else alert('fail api');
		});
	}
	
	// common method
	function showList(areaData, contentTypeId) {
		
		let container = "";
		
		if (contentTypeId === "12") container = "#container1";
		else if (contentTypeId === "32") container = "#container2";
		else if (contentTypeId === "39") container = "#container3";
		else if (contentTypeId === "38") container = "#container4";
		
		$.each(areaData.item, function(i, data) {
			let thumbnail = "";
			
		    if (data.firstimage) {
		    	thumbnail = "<img src=" + data.firstimage + " class='thumbnail'/>";
		    }
		    else {
		    	if (contentTypeId === "12")
					thumbnail = "<img src='resources/image/default/default_attraction.jpeg' class='thumbnail'/>";
				else if (contentTypeId === "32")
					thumbnail = "<img src='resources/image/default/default_hotel.jpg' class='thumbnail'/>";
				else if (contentTypeId === "39")
					thumbnail = "<img src='resources/image/default/default_restaurant.jpg' class='thumbnail'/>";
				else if (contentTypeId === "38")
					thumbnail = "<img src='resources/image/default/default_shopping.jpg' class='thumbnail'/>";
		    }
		    
		    let html = "";
		    html += "<div class='placeBox'>";
		    html += 	"<div class='imgBox'>" + thumbnail + "</div>";
		    html += 	"<div class='title' onclick='goMap(this)'>" + data.title + "</div>";
		    html += 	"<div class='addr' onclick='goMap(this)'>" + data.addr1 + "</div>";
		    html += "</div>";
		    
		    $(container).append(html);
		});
		
		$(container).slick({
			slide: 'div',
			slidesToShow: 4,
			slidesToScroll: 1,
			arrows: true,
			autoplay : true,
			autoplaySpeed : 2000
		});
	}
	
	function goMap(obj) {
		var title = $(obj).text();
		console.log(title);
		var url = "https://map.naver.com/v5/search/" + title;
		window.open(url, '_blank');
	}
	
	function buttons() {
		$('.login').click(function() {
			$(location).attr('href', '/loginForm');
		})
		
		$('.logout').click(function() {
			$(location).attr('href', '/logout');
		})
		
		$(".tabs1 img").click(function() {
			$(".tabs1 img").mouseenter();
			$(location).attr('href', '/attractions');
		})
		
		$(".tabs2 img").click(function() {
			$(location).attr('href', '/accommodations');
		})
		
		$(".tabs3 img").click(function() {
			$(location).attr('href', '/restaurants');
		})
		
		$(".tabs4 img").click(function() {
			$(location).attr('href', '/shopping');
		})
		
		$('.bookmark').click(function() {
			$(location).attr('href', '/bookmark');
		})
		
		$('.question').click(function() {
			$(location).attr('href', '/listAsk');
		})
		
		$('.login_icon').click(function() {
			$(location).attr('href', '/loginFormAdmin');
		})
	}
	
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage: 'ko',
			includedLanguages: 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
			layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
			autoDisplay: false
		}, 'google_translate_element');
	}
</script>
</head>
<body>
<div id="logo">K-Travel</div>
<hr size="1" width="90%" color="#adadad">
<div id="tabs">
	<div id="member">
		<div class="tabs-Title">테마별 여행</div>
		<c:if test="${empty sessionScope.loginId}">
			<div class="login">로그인</div>
		</c:if>
		<c:if test="${not empty sessionScope.loginId}">
			<div class="loginid">안녕하세요 ${sessionScope.loginId}님</div>
			<div class="logout">로그아웃</div>
		</c:if>
	</div>
	<div class="tabs1">
		<div class="scale"><img src="resources/image/tabs/attraction.jpg"/></div>
		<div class="tabsTitle">관광지</div>
		<div class="tabsSub">10914건의 정보</div>
	</div>
	<div class="tabs2">
		<div class="scale"><img src="resources/image/tabs/hotel.jpg"/></div>
		<div class="tabsTitle">숙박</div>
		<div class="tabsSub">3403건의 정보</div>
	</div>
	<div class="tabs3">
		<div class="scale"><img src="resources/image/tabs/restaurant.jpg"/></div>
		<div class="tabsTitle">음식점</div>
		<div class="tabsSub">7372건의 정보</div>
	</div>
	<div class="tabs4">
		<div class="scale"><img src="resources/image/tabs/shopping.jpg"/></div>
		<div class="tabsTitle">쇼핑/시장</div>
		<div class="tabsSub">1283건의 정보</div>
	</div>
</div>
<div id="header2">
	<div class="bookmark">
		<img src="resources/image/bookmark.jpg"/>
		<div class="text">관심장소보기</div>
	</div>
	<div class="question">
		<img src="resources/image/question.jpg"/>
		<div class="text">문의게시판</div>
	</div>
</div>

<div id="box">
  <div class="box1">
  	<div class='boxTitle'>추천 관광지</div>
  	<div id="container1" class="container"></div>
  </div>
  <div class="box2">
  	<div class='boxTitle'>추천 숙소</div>
    <div id="container2" class="container"></div>
   </div>
  <div class="box3">
  	<div class='boxTitle'>추천 음식점</div>
    <div id="container3" class="container"></div>
  </div>
  <div class="box4">
  	<div class='boxTitle'>추천 쇼핑지/시장</div>
    <div id="container4" class="container"></div>
  </div>
</div>
<c:if test="${empty sessionScope.loginId}">
	<div id="login_admin">
		<img src="resources/image/login_admin.png" class="login_icon"/>
	</div>
</c:if>
<div id="footer">
<p>Copyright 2021. 이거사조 team, Ltd. all rights reserved.</p>
<p>조유하, 이현경, 정우성, 좌준호</p>
<p>Inquiry : uzzing1219@gmail.com</p>
</div>
</body>
</html>
