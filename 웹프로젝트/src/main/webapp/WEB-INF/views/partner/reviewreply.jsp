<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripNow(트립나우)</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

	#title {
		width: 200px;
		height: 50px;
		margin: 20px auto;
		display: flex;
	}
	
	#icon {
		background-image: url("/tripnow/images/qna.png");
		margin-top: 20px;
		width: 40px;
		height: 40px;
		background-size: contain;
		background-repeat: no-repeat;
	}
	
	.table {
		width: 840px;
		margin: 15px auto 0px auto;
		text-align: center;
		font-size:14px;
		
	}
	
	.table th {
		text-align: center;
	}
	
	.table th:nth-child(1) { width: 60px; }
	.table th:nth-child(2) { width: 100px; }
	.table th:nth-child(3) { width: auto; }
	.table th:nth-child(4) { width: 100px; }
	.table th:nth-child(5) { width: 100px; }
	.table th:nth-child(6) { width: 120px; }
	
	.table tr td:nth-child(3) {
		text-align: left;
	}
	
	#btn {
		width: 840px;
		margin: 20px auto 20px auto;
		text-align: right;
	}
	
	#top {
		width: 840px;
		margin: 10px auto;
		margin-top: 60px;
		padding-left: 8px;
	}
	
	#top p {
		float: left;
	}
	
	#button{
		
		border-top : 1px solid gray;
		
		width:840px;
		margin:auto;
		
	}
	
	#button > div {
		
		margin: 22px 22px 22px;
		background-color: #eee;
		float:right;
	
	}
	
	#button > div > input {
		
		background-color: #ccc;
    	border: 1px solid #ccc;
	
	}
	
	#button > input:nth-child(2){
		
		margin-left: 4px;
	
	}
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
	  <section>
		<div id="title"><div id="icon"></div><h1>&nbsp;리뷰 답변</h1></div>
	  	
	  	<div id="top">
	  	<p><a href="">Partner</a> > <a href="/tripnow/partner/reviewreply.do">리뷰 답변</a></p>
	  	</div>
	  	
	  	<table class="table table-hover">
	  		<thead>
	  			<tr>
	  				<th>글번호</th>
	  				<th>별점</th>
	  				<th>제목</th>
	  				<th>처리상태</th>
	  				<th>등록일</th>
	  				<th>처리 상태</th>
	  			</tr>
	  			
	  		</thead>
	  		<tbody>	  			
	  			<c:forEach items="${list}" var="dto" >
	  				
	  					<tr class="question">
	  						<th>${dto.num}</th>
	  						<td>${dto.star}점</td>
	  						<td>${dto.name}</td>
	  						<td>${dto.reply == null ? "답변전" : "답변완료"}</td>
	  						<td>${dto.regdate}</td>
	  						<td>
								<c:if test="${dto.reply == null }">
									<form  method ="POST" action="/tripnow/partner/replyview.do">
										<input type="hidden" name="seq" value="${dto.seq}" />
										<input type="hidden" name="category" value="${dto.category}" />
										<input type="hidden" name="name" value="${dto.name}" />
	      								<button class="btn" value="답변하기"style="background-color:#81BEF7;">답변하기</button>
	      							</form>	
								</c:if>		
								<c:if test="${dto.reply != null }">	
									<form  method ="POST" action="/tripnow/partner/replyviewdetail.do">
										<input type="hidden" name="seq" value="${dto.seq}" />
										<input type="hidden" name="category" value="${dto.category}" />
										<input type="hidden" name="name" value="${dto.name}" />
	      								<button class="btn" value="상세보기" style="background-color:#ccc;">상세보기</button>
	      							</form>	
								</c:if>							  						
	  						</td>	  						
	  					</tr>

	  			</c:forEach>
	  		</tbody>
	  		
	  	</table>
	  	
	  	
	  	<div id="button">
			<div><input type="button" class="btn btn-info" value="돌아가기" onClick="history.go(-1)"></div>
		</div>
	  	
  		<div style="text-align: center;">
	 		${pagebar}
	 	</div>
	  
	  
	  
	  </section>
		
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   		
   		
   		
   		
				   
   
		$('#pagebar').change(function() {
			
			location.href = '/tripnow/mypage/list.do?page=' + $(this).val();
			
		});
		
		
		$('#pagebar').val(${nowPage});
		
   </script>

</body>
</html>















