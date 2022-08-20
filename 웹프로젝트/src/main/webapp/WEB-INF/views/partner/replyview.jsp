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
		width: 183px;
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
	
	#top {
		width: 840px;
		margin: 10px auto;
		margin-top: 60px;
		padding-left: 8px;
	}
	
	#top p {
		float: left;
	}
	
	#top span {
		float: right;
	}
	
	.table {
		width: 840px;
		margin: 0px auto;
		text-align: center;
	}
	
	
	#table.table > thead > tr > th {
		border-top: 2px solid #DDD;
		border-bottom: none;
	}
	
	#table tr:nth-child(1) th:nth-child(1) { width: 280px; }
	#table tr:nth-child(1) th:nth-child(2) { width: 280px; text-align: center;}
	#table tr:nth-child(1) th:nth-child(3) { width: 280px; text-align: right; }
	
	#table tr:nth-child(2) {
		height: 100px;
		border-bottom: 1px solid #CCC;
	}
	
	#table tr:nth-child(2) td {
		text-align: left;
		font-size: 16px;
		padding: 40px 20px 40px 20px;
	}
	
	#top .btn-info {
		background-color: #5bc0de;
	}

	#top .btn-danger {
		background-color: #d9534f;
	}
	
	
	#answer {
		width: 840px;
		height: ;
		margin: 30px auto;
	}
	
	#arrow {
		text-align: center;
	}
	 
	#answer i {
		text-align: center;
		font-size: 40px;
	}
	
	.answerbox {
		width: 840px;
		height: auto;
		padding: 25px 40px 20px 40px;
		margin: 20px 0px 20px 0px;
		border: 1px solid #CCC;
		border-radius: 15px;
	}
	
	.answerbox .answertitle {	
		font-size: 20px;
		font-weight: bold;
		color: cornflowerblue;
	}
	.answerbox .maintext {
		font-size: 16px;
	}
	
	.answerbox .subtext {
		color: #888;
	    text-align: right;
	}
	
	#button {
		width: 840px;
		margin: 0 auto;
		display: flex;
		justify-content: flex-end;
	}
	
	#button input[type=button] {
		margin-left: 5px;
	}
	
	#button > input:nth-child(1){
		background-color : #ccc;
		border: 1px solid #ccc;
	}
	
	.replyContent{
		width: 760px;
		resize: none;
		height:145px;
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
	  		<p><a href="/tripnow/mypage/mypagemain.do">partner</a> > <a href="/tripnow/mypageqna.do">리뷰답변</a></p>
	  	</div>
	  	
	  	<table class="table" id="table">
	  		<thead>
	  			<tr>
	  				<th>상품명: ${dto.name} </th>
	  				<th>작성자: ${dto.id} </th>
	  				<th>등록일: ${dto.regdate} </th>
	  			</tr>
	  			
	  			<tr>
	  				<td colspan="3">${dto.content}</td>
	  			</tr>
	  		</thead>
	  		<tbody>
	  		</tbody>
	  	</table>
	  	
	  	<form method="POST" action="/tripnow/partner/reviewreplyok.do" id="replyreview" name="replyreview">
		  	<div id="answer">
				<div id="arrow"><i class="fa-solid fa-angle-down"></i></div>
				<div class="answerbox">
					<input type="hidden" name="rseq" value="${dto.seq}" />
					<input type="hidden" name="pid" value="${id}" />
					<input type="hidden" name="category" value="${category}" />
					<textarea class="replyContent" name="content" placeholder="내용을 입력해 주세요."></textarea>
				</div>
		  	</div>
		  	<div id="button">
		  		<input type="button" class="btn btn-info" value="돌아가기" onClick="history.go(-1)">
		  		<input type="submit" class="btn btn-info" value="작성하기" >
		  	</div>
	    </form>
	  </section>
		
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

   	  
   <script>   	
   
   </script>

</body>




















</html>