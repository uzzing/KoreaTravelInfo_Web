<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="resources/css/Fhistory.css" type="text/css">
<style>
body{
		margin: 0;
		width: 100%;
        height: 100%;
		background-image : linear-gradient( rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6) );
		background-repeat : no-repeat;
		text-align: center;
		color : black;
	}
div.menu{
	position: relative;
}

div.back{
	
	width:800px;
	height: 900px;
	background-color : white;
	margin: auto; 
	text-align: center;
	
	
}
div.wrapper {
	padding: 30px;
	
}

table{
	
	margin : 0 auto;
	border-collapse: collapse; 
	width:500px;
	height: 700px;
	text-align: center;
	background-color : white;
	color: black;
}
/*상단 메뉴바 관련 css*/
	nav{
    	font-size: 12pt;
    	font-family: 'PT Sans', Arial, Sans-serif;
    	position: relative;
    }
    nav ul{
    	padding: 0;
    	margin: 0 auto;
    	width: auto;
    }
    nav li{
    }
    nav a{
    	line-height: 50px;
      	height: 50px;
    }
    nav li a{
    	box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	-webkit-box-sizing: border-box;
    }
    nav li:last-child a{
    	border-right: 0;
        }
    nav a:hover, nav a:active{
    }
    nav a#pull{
    	display: none;
    }
      html {
      -webkit-touch-callout:none;
      -webkit-user-select:none;
      -webkit-tap-highlight-color:rgba(0, 0, 0, 0);
      }

      ul{
        /*list-style-type: none;*/
        margin: 0;
        padding: 0;
        background-color: #0b421a;
        text-align: center;
      }
      li{
        /*position: relative;*/
        display: inline-block;
      }
      li a{
        color: #FFFFFF;
        text-align: center;
        padding: 14.5px 16px;
        text-decoration: none;
      }
      li a:hover{
        /*color: #597812;*/
        color: #FFD400;
        font-weight:normal;
      }
      .menu {
       width: 5000px;
       height: 50px;
       text-align: center;
       max-width: 100%;
       background-position: center;
       background-size: cover;
       background-color: #0b421a;
       color: white;
       
       position: fixed;
  	   top: 0;
 	   /* width: 100% */
  	   left: 0;
  	   right: 0;
     }
     
/*조회테이블 css*/     
@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700');

$base-spacing-unit: 24px;
$half-spacing-unit: $base-spacing-unit / 2;

$color-alpha: #1772FF;
$color-form-highlight: #EEEEEE;

*, *:before, *:after {
	box-sizing:border-box;
}

body {
	padding:$base-spacing-unit;
	font-family:'Source Sans Pro', sans-serif;
	margin:0;
}

h1,h2,h3,h4,h5,h6 {
	margin:0;
	text-align: left;
}

.container {
	max-width: 1000px;
	margin-right:auto;
	margin-left:auto;
	display:flex;
	justify-content:center;
	align-items:center;
	min-height:100vh;
}

.table {
	width:100%;
	border:1px solid $color-form-highlight;
	
}

.table-header {
	display:flex;
	width:100%;
	background:#000;
	padding:($half-spacing-unit * 1.5) 0;
	color : white;
}

.table-row {
	display:flex;
	width:100%;
	padding:($half-spacing-unit * 1.5) 0;
	
	&:nth-of-type(odd) {
		background:$color-form-highlight;
	}
}

.table-data, .header__item {
	flex: 1 1 20%;
	text-align:center;
}

.header__item {
	text-transform:uppercase;
}

.filter__link {
	color:white;
	text-decoration: none;
	position:relative;
	display:inline-block;
	padding-left:$base-spacing-unit;
	padding-right:$base-spacing-unit;
	
	&::after {
		content:'';
		position:absolute;
		right:-($half-spacing-unit * 1.5);
		color:white;
		font-size:$half-spacing-unit;
		top: 50%;
		transform: translateY(-50%);
	}
	
	&.desc::after {
		content: '(desc)';
	}

	&.asc::after {
		content: '(asc)';
	}
	
}
</style>
<script>
	function detailAsk(num){
		let tergetPlace = 'detailAsk?ask_seq='+num;
		
		location.href = tergetPlace;
	}
</script>
</head>
<body>
 <div class="menu" >
	     <nav class="clearfix">
	        <ul class="clearfix">
	          <li><a href="/">Home</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
	          <li><a href="https://www.starbucks.co.kr/footer/company/index.do">ABOUT US</a></li>
	          <li><a href="https://www.starbucks.co.kr/store/index.do">STORE</a></li>
	          <li><a href="https://www.starbucks.co.kr/msr/index.do">STARBUCKS REWARDS</a></li>
	          <li><a href="https://www.starbucks.co.kr/whats_new/index.do">WHAT'S NEWS</a></li>
	      </ul>
	      <a id="pull" href="#"></a>
	    </nav>
</div>
<div class="back">
<h2>문의 게시판</h2>
<div class="wrapper">
	<div class="container">
		<div class="table">
			<!-- 테이블 제목 -->
			<div class="table-header">
				<div class="header__item">번호</div>
				<div class="header__item">문의 제목</div>
				<div class="header__item">작성자</div>
				<div class="header__item">작성일</div>
			</div>
			<br>
			<!-- 테이블 내용(조회 내용) -->
			<div class="table-content">	
			
				<c:forEach var="ask" items="${list}" varStatus="stat">
					<c:if test="${stat.index < 15}">
						<div class="table-row">		
						<div class="table-data">${ask.ask_seq}</div>
						<div class="table-data">
							<a href="javascript:detailAsk(${ask.ask_seq});">${ask.ask_title}</a>
						</div>
						<div class="table-data">${ask.ask_date}</div>
						<div class="table-data">${ask.userid}</div>
						</div>
					</c:if>
				</c:forEach>
			</div><!-- div class="table-content" 종료 -->	
		</div><!-- div class="table" 종료 -->	
	</div><!-- div class="container" 종료 -->	
</div><!-- div class="wrapper" 종료 -->	
</div>
</body>
</html>