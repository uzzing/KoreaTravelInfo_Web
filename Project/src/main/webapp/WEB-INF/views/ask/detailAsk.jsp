<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 자세히 보기</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
function askList(){
	location.href = '/listAsk'; 
}

function askDelete(){
	
	let ask_seq='${ask.ask_seq}';
	let answer =confirm('문의를 삭제하시겠습니까?');
	
	if(answer){
		location.href="deleteAsk?ask_seq="+ask_seq;
	}
}

function askUpdate(){
	let ask_seq='${ask.ask_seq}';
	location.href="updateAsk?ask_seq="+ask_seq;
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
         		  	 <th class="active">답변</th>
         		  	<c:if test="${comment != null}">
            			 <td colspan="3">${comment.comment_text}</td>
                 	 </c:if>
                 	<c:if test="${comment == null}">
            			 <td colspan="3">아직 답변이 작성되지 않았습니다.</td>
                 	 </c:if>	
         		  </tr>
         		  <tr>
        			 <td colspan="4" class="text-center">	
        			 	<c:if test="${ask.userid == sessionScope.loginid}">
  	  					 	<input type="button" class="btn black" value="수정하기" onclick="location.href='/updateAsk?ask_seq=${ask.ask_seq}'">          
							<input type="button" class="btn black" value="삭제하기" onclick="askDelete();">
						</c:if>
						<c:if test="${adminid == sessionScope.loginid && comment != null}">
							<input type="button" class="btn black" value="답변수정" onclick="location.href='/updateComment?ask_seq=${ask.ask_seq}&comment_seq=${comment.comment_seq}'">  
						</c:if>
						<input type="button" class="btn black" value="목록보기" onclick="location.href='/listAsk'">
        			 </td>
       			  </tr>
        	    </table>
        	</div>
        	<div class="form-group">  
        	    <c:if test="${adminid == sessionScope.loginid && comment == null}">
        	    	<form action ="writeComment" method="POST">
        	    		<input type="hidden" name="adminid" value="${adminid}">
        	    		<input type="hidden" name="ask_seq" value="${ask.ask_seq}">
               		
                	<div class="form-group">
                		<label>답변 작성 </label>
               			<textarea name="comment_text" class="form-control" rows="5"></textarea>
                	</div>
		     			<input type="submit" value="답변하기" class="btn">
        	    	</form>
        	    </c:if>
    	    </div>
   		</div>
	</div>
</div>
</body>
</html>