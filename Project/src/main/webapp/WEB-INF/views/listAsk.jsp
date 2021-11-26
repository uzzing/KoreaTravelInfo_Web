<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	function detailAsk(num){
		let tergetPlace = 'detailAsk?ask_seq='+num;
		
		location.href = tergetPlace;
	}
	function writeAsk(){
		let tergetPlace = 'writeAsk';
		
		location.href = tergetPlace;
	}
</script>
<style type="text/css">
#btn_write{
	position: absolute;
	top: 94px;
	right: 200px;
}
</style>
</head>
<body>
<div class="container">
	<h2> 문의게시판 </h2>
	<hr width = "100%" color = "gray">
	
	<div class="home">
		<form id="search" action="/" method="GET"><!-- 검색하는 기능 -->
			<select name="searchItem">
				<option value="ask_title" ${searchItem =='ask_title'?'selected':''}>제목</option>
				<option value="userid" ${searchItem =='userid'?'selected':''}>작성자</option>
			</select>
			<input type="text" name="searchWord" value="${searchWord}">
			<input class="btn" type="submit" value="검색">
		</form>
	<!-- 글쓰기 버튼 -->
	<button type="button" class="btn" onclick="writeAsk();" id="btn_write">글쓰기</button>
	</div>
	<br>
	<!-- 게시글 목록 시작 -->
	<table class="table table-striped " style="width: 100%; margin: auto;">
		<thead>
            <tr>
				<th class="info">번호</th>
				<th class="info">문의 제목</th>
				<th class="info">작성일</th>
				<th class="info">작성자</th>
			</tr>
        </thead>
		<tbody>
			<c:forEach var="ask" items="${list}" varStatus="stat">
				<tr>
					<td>${stat.index + navi.srow }</td>
					<td class="title">
						<a href="javascript:detailAsk(${ask.ask_seq});">${ask.ask_title}</a>
					</td> 
					<td>${ask.ask_date}</td>
					<td>${ask.userid}</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
	<!-- 페이징출력 -->
	<div class="navigator">
		<a href="/?currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">
		◁◁
		</a>
		<!-- 지금 무조건 1페이지로 이동함,,, 선생님 코드랑 비교해서 알아볼것. -->
		<a href="/?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>&nbsp;<!-- "<"표기 -->
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<!-- 요청페이지와 현재 페이지가 같을 경우. -->
			<c:if test="${currentPage == page}">
				<span style="color:blue; font-weight: bolder; font-size: 1.1em">${page}</span>&nbsp;
			</c:if>
			<c:if test="${currentPage != page}">
				<a href="/?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
			</c:if>
		</c:forEach>
		<a href="/?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>&nbsp;<!-- ">"표기 -->
		
		<a href="/?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">
		▷▷
		</a>
	</div>
	
</div><!-- container 종료  -->
</body>
</html>