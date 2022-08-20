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
		width: 160px;
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
	}
	
	.table th {
		text-align: center;
	}
	
	.table th:nth-child(1) { width: 60px; }
	.table th:nth-child(2) { width: 200px; }
	.table th:nth-child(3) { width: auto; }
	.table th:nth-child(4) { width: 100px; }
	.table th:nth-child(5) { width: 100px; }
	
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
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
	  <section>
		<div id="title"><div id="icon"></div><h1>&nbsp;1:1 문의</h1></div>
	  	
	  	<div id="top">
	  	<p><a href="/tripnow/mypage/mypagemain.do">마이페이지</a> > <a href="/tripnow/mypage/qna.do">1:1문의</a></p>
	  	</div>
	  	
	  	<table class="table table-hover">
	  		<thead>
	  			<tr>
	  				<th>글번호</th>
	  				<th>종류</th>
	  				<th>제목</th>
	  				<th>등록일</th>
	  				<th>처리 상태</th>
	  			</tr>
	  			
	  		</thead>
	  		<tbody>
	  			<c:forEach items="${nlist}" var="dto" varStatus="status">
	  					
	  					<tr class="bg-info">
	  						<th>${dto.qseq}</th>
	  						<td>${dto.category}</td>
	  						<td><a href="/tripnow/mypage/qnaview.do?seq=${dto.qseq}&notice=y&page=${nowPage}">${dto.qsubject}</a></td>
	  						<td>${dto.qregdate}</td>
	  						<td>${dto.state}</td>
	  					</tr>
	  				
	  			</c:forEach>
	  			
	  			<c:forEach items="${list}" var="dto" varStatus="status">
	  				
	  					<tr class="question">
	  						<th>${dto.qseq}</th>
	  						<td>${dto.category}</td>
	  						<td><a href="/tripnow/mypage/qnaview.do?seq=${dto.qseq}&notice=n&page=${nowPage}">${dto.qsubject}</a></td>
	  						<td>${dto.qregdate}</td>
	  						<td>${dto.state}</td>
	  					</tr>

	  			</c:forEach>
	  		</tbody>
	  	</table>
	  	
	  	<div id="btn"><input type="button" class="btn btn-info" value="작성하기" onclick="location.href='/tripnow/mypage/qnaadd.do'"></div>
	  	
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