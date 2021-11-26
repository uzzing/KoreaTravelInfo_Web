<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
function askList(){
	//let target = '${pageContext.request.contextPath}'; 
	// http://localhost:8088/board/writeboard 중에서의 /board. 동적으로 읽어오기 . 
	//현재 페이지에서만 사용가능. 프로젝트 안에서 얼마든지 앞에/board부분이 얼마든지 바뀌수 있기때문에 동적으로 만드는것. 
	location.href = '/'; 
}

function askDelete(){
	
	let ask_seq='${ask.ask_seq}';
	let answer =confirm('문의를 삭제하시겠습니까?');
	
	if(answer){
		location.href="deleteAsk?ask_seq="+ask_seq
	}
}

function askUpdate(){
	let ask_seq='${ask.ask_seq}';
	location.href="updateAsk?ask_seq="+ask_seq
}
</script>
</head>
<body>
<div class="container" style="padding : 30px; max-width: 100%" >
	<div class="row" >
    	<div class="col-xs-2 col-md-2"></div>
   		<div class="col-xs-8 col-md-8">
    		<h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>
   			<div class="table table-responsive">
    		    <table class="table">
      			  <tr>
       			     <th class="active">작성자</th>
        			 <td>${ask.userid}</td>
           			 <th class="active">작성일</th>
            		 <td>${ask.ask_date}</td>
    		      </tr>
    		      
      			  <tr>
         		     <th class="active">제목</th>
                     <td colspan="3">${ask.ask_title}</td>
                  </tr>
                  
        		  <tr>
          			 <th class="active">글 내용</th>
            		 <td colspan="3">${ask.ask_text}</td>
         		  </tr>
         		  <tr>
        			 <td colspan="4" class="text-center">	
  	  				 	<input type="button" class="btn black" value="수정하기" onclick="location.href='/updateAsk?ask_seq=${ask.ask_seq}'">          
						<input type="button" class="btn black" value="삭제하기" onclick="askDelete();">
						<input type="button" class="btn black" value="목록보기" onclick="location.href='/'">
        			 </td>
       			  </tr>
        	    </table>
    	    </div>
   		</div>
	</div>
</div>
</body>
</html>