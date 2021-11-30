<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Bookmark</title>
<link rel="stylesheet" type="text/css" href="resources/css/bookmark.css"/>
<link rel="stylesheet" href="resources/css/jqueryui/jquery-ui.min.css"/>
<link rel="stylesheet" href="resources/css/jqueryui/jquery-ui.structure.min.css"/>
<link rel="stylesheet" href="resources/css/jqueryui/jquery-ui.theme.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"></link>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script type="text/javascript">

	let areaData = {};
	let pageNo = 1;
	let areaCode = 0;
	var typeOf = "";
	var userid = "";
	
	$(function() {
		userid = $('#loginId').val();
		$( "#tabs" ).tabs();
		home();
		
		if (userid !== "yuha1219") {
			getBookmark("1");
			buttons();
		}
	});
	
	function buttons() {
		$("#tabs ul li").click(function() {
			typeOf = $(this).children("a").attr("id");
			console.log(typeOf);
			getBookmark(typeOf);
		});
	}
	
	function getBookmark(typeOf) {
		userid = $('#loginId').val();
		console.log(userid);
		
		$.ajax({
			type: 'get',
			url: 'getBookmark',
			data: { userid: userid, typeOf: typeOf },
			dataType: 'json',
			success: showList,
			error: function(e) {
				alert('북마크 불러오기 에러 : ' + e);
				console.log(e);
				return false;
			}
		});
	}
	
	function showList(res) {
		
		$(".list").html('');
		
		if (res.length != 0) {
			
			// get image first
			const url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
			const path = "detailImage?";
			const serviceKey = "DhLDqraxdid6%2Fja9et1Tx%2FwOaDHEmOy7Q8N65a33AQbfwLTxrOkTbFqr1Wt8RPB6G1zogF1iQ6aTB3AouTKrjw%3D%3D";
			const MobileApp = "AppTest";
			const MobileOS = "ETC";
			const _type = "json";
			
			$.each(res, function(i, data) {
				
				let uri = url + path
								  + "serviceKey=" + serviceKey + "&"
								  + "MobileApp=" + MobileApp + "&"
								  + "MobileOS=" + MobileOS + "&" 
								  + "_type=" + _type + "&"
								  + "contentId=" + data.contentId;
				
				let link = 'resources/image/default/default_bookmark.jpg';
				
				// get image
				$.get(uri, function(item, status) {
					if (status === 'success') {
						console.log(item.response.body.items.item);
						var json = item.response.body.items;
						
						if (json !== "") {
							console.log(json.length);
							if (typeof json.item.length !== 'undefined')
								link = item.response.body.items.item[0].originimgurl;
							else
								link = item.response.body.items.item.originimgurl;
						}
						
						console.log(link);
						
						let thumbnail = "<img src='" + link + "' class='thumbnail'/>";
						
					    let html = "";
					    html += "<div class='placeBox'>";
					    html += 	"<input type='hidden' class='contentId' value='" + data.contentId + "'/>";
					    html += 	"<div class='imgBox'>";
					    html += 		thumbnail;
					    html +=			"<img src='resources/image/full_heart.png' class='heart full_heart' onclick='deleteFromDB(this)'/>";
					    html += 	"</div>";
					    html += 	"<div class='title' onclick='goMap(this)'>" + data.title + "</div>";
					    html += 	"<div class='addr' onclick='goMap(this)'>" + data.addr + "</div>";
					    html += "</div>";
					    
					    $(".list").append(html);
					}
					else alert('fail api');
				});
			});
			
		}
	}
	
	function goMap(obj) {
		var title = $(obj).text();
		var url = "https://map.naver.com/v5/search/" + title;
		window.open(url, '_blank');
	}
	
	function deleteFromDB(obj) {
		userid = $('#loginId').val();
		var contentId = $(obj).parents('.placeBox').find('.contentId').val();

		$.ajax({
			type: 'post',
			url: 'deleteBookmark',
			data: { contentId : contentId, userid: userid },
			success: function() {
				alert('북마크가 취소되었습니다.');
				getBookmark(typeOf);
			},
			error: function(e) {
				alert('에러발생 : ' + e);
				return false;
			}
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
	<div id="logo">K-Travel</div>
	<input type="hidden" id="loginId" value="${sessionScope.loginId}">
	<div id="header" style="font-size: 35px; margin-bottom: 15px; margin-left: 10px;">나의 관심장소</div>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1" id="1">관광지</a></li>
			<li><a href="#tabs-2" id="2">숙박</a></li>
			<li><a href="#tabs-3" id="3">식당</a></li>
			<li><a href="#tabs-4" id="4">쇼핑</a></li>
		</ul>
		<div id="tabs-1">
			<div class="list"></div>
		</div>
		<div id="tabs-2">
			<div class="list"></div>
		</div>
		<div id="tabs-3">
			<div class="list"></div>
		</div>
		<div id="tabs-4">
			<div class="list"></div>
		</div>
	</div>
	<div id="footer">
		<p>Copyright 2021. 이거사조 team, Ltd. all rights reserved.</p>
		<p>조유하, 이현경, 정우성, 좌준호</p>
		<p>Inquiry : uzzing1219@gmail.com</p>
	</div>
</body>
</html>
