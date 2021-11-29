<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
		const serviceKey = "DhLDqraxdid6%2Fja9et1Tx%2FwOaDHEmOy7Q8N65a33AQbfwLTxrOkTbFqr1Wt8RPB6G1zogF1iQ6aTB3AouTKrjw%3D%3D";
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
		$.get(uri + contentTypeId + "&pageNo=4", function(data, status) {
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
		$.get(uri + contentTypeId + "&pageNo=3", function(data, status) {
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
		$.get(uri + contentTypeId + "&pageNo=9", function(data, status) {
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
		    html += 	"<div class='title'>" + data.title + "</div>";
		    html += 	"<div class='addr'>" + data.addr1 + "</div>";
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
	
	function buttons() {
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
			$(location).attr('href', '/board');
		})
	}
</script>
</head>
<body>
<div id="logo">K-Travel</div>
<hr size="1" width="90%" color="#adadad">
<div id="tabs">
	<div class="tabs-Title">테마별 여행</div>
	<div class="tabs1">
		<img src="resources/image/tabs/attraction.jpg"/>
		<div class="tabsTitle">관광지</div>
		<div class="tabsSub">10914건의 정보</div>
	</div>
	<div class="tabs2">
		<img src="resources/image/tabs/hotel.jpg"/>
		<div class="tabsTitle">숙박</div>
		<div class="tabsSub">3403건의 정보</div>
	</div>
	<div class="tabs3">
		<img src="resources/image/tabs/restaurant.jpg"/>
		<div class="tabsTitle">음식점</div>
		<div class="tabsSub">7372건의 정보</div>
	</div>
	<div class="tabs4">
		<img src="resources/image/tabs/shopping.jpg"/>
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

<div id="footer">
<p>Copyright 2021. 이거사조 team, Ltd. all rights reserved.</p>
<p>조유하, 이현경, 정우성, 좌준호</p>
<p>Inquiry : uzzing1219@gmail.com</p>
</div>
</body>
</html>
