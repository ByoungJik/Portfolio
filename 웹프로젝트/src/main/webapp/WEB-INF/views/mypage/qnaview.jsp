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
	
	
	
	.table tr:nth-child(1) th {
		text-align: center;
		vertical-align: middle;
		height: 80px;
		font-size: 25px;
	}
	
	#table.table > thead > tr > th {
		border-top: 2px solid #DDD;
		border-bottom: none;
	}
	
	#table tr:nth-child(2) th:nth-child(1) { width: 280px; }
	#table tr:nth-child(2) th:nth-child(2) { width: 280px; text-align: center;}
	#table tr:nth-child(2) th:nth-child(3) { width: 280px; text-align: right; }
	
	#table tr:nth-child(3) {
		height: 100px;
		border-bottom: 1px solid #CCC;
	}
	
	#table tr:nth-child(3) td {
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
	
	
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
	  <section>
		<div id="title"><div id="icon"></div><h1>&nbsp;1:1 문의</h1></div>
	  	
	  	<div id="top">
	  	<p><a href="/tripnow/mypage/mypagemain.do">마이페이지</a> > <a href="/tripnow/mypageqna.do">1:1문의</a> > ${dto.category}</p>
	  		<c:if test="${dto.state == '답변완료'}">
	  			<span class="badge btn-info">${dto.state}</span>
	  		</c:if>
	  		
	  		<c:if test="${dto.state == '처리중'}">
	  			<span class="badge btn-danger">${dto.state}</span>
	  		</c:if>
	  	</div>
	  	
	  	<table class="table" id="table">
	  		<thead>
	  			<tr>
	  				<th colspan="3" class="center">${dto.qsubject}</th>
	  			</tr>
	  			
	  			<tr>
	  				<th>글번호: ${dto.qseq}</th>
	  				<th>작성자: ${dto.id}</th>
	  				<th>등록일: ${dto.qregdate}</th>
	  			</tr>
	  			
	  			<tr>
	  				<td colspan="3">${dto.qcontent}</td>
	  			</tr>
	  		</thead>
	  		<tbody>
	  		</tbody>
	  	</table>
	  	
	  	<div id="answer">
	  	
	  		<c:if test="${dto.aseq != null}">
	  			<div id="arrow"><i class="fa-solid fa-angle-down"></i></div>
	  			<div class="answerbox">
	  				<p class="answertitle">안녕하세요, 트립나우입니다.</p>
	  				<p class="maintext">${dto.acontent}</p>
	  				<p class="subtext">답변일: ${dto.aregdate}</p>
	  			</div>
	  		
	  		</c:if>
	  	</div>
	  	
	  	<div id="button">
	  		<input type="button" class="btn btn-info" value="목록" onclick="location.href='/tripnow/mypage/qna.do?page=${nowPage}'">
	  		
	  		<c:if test="${dto.id == auth}">
	  		<input type="button" class="btn btn-warning" value="추가 문의" onclick="location.href='/tripnow/mypage/qnaadd.do'">
	  		</c:if>
	  		<c:if test="${auth == 'admin' && dto.aseq == null}">
	  		<input type="button" class="btn btn-warning" value="답변 작성" onclick="addanswer()">
	  		</c:if>
	  	</div>
	 
	  		
	  
	  
	  </section>
		
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   
   		function addanswer() {
   			
   			alert('답변 작성');
   		}
   
   </script>

</body>
</html>