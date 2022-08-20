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

	main {
		text-align: center;
	}
	
	main h1 {
		margin: 40px 0px 40px 0px;
	}
	
	#main {
		width: 780px;
		height: 370px;
		padding: 30px;
		margin: 50px auto;
		border-top: 1px solid #DDD;
		border-bottom: 1px solid #DDD;
		display: flex;
	}
	
	#main .item {
		text-align: center;
		width: 180px;
		height: 180px;
	}
	
	.menubtn {
		margin-top: 50px;
		margin-left: 15px;
		margin-right: 15px;

	}
	
	#qna {
		width: 150px;
		height: 150px;
		background-image: url('/tripnow/images/qna.png');
		background-size: contain;
		
	}
	
	#info {
		width: 150px;
		height: 150px;
		background-image: url('/tripnow/images/info.png');
		background-size: contain;
	}
	#booklist {
		width: 150px;
		height: 150px;
		background-image: url('/tripnow/images/booklist.png');
		background-size: contain;
	}
	#unregister {
		width: 150px;
		height: 150px;
		background-image: url('/tripnow/images/unregister.png');
		background-size: contain;
	}
	
	.item p {
		margin-top: 10px;
		margin-bottom: 15px;
		font-size: 18px;
	}
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      
      <h1>My Page</h1>
      <div id="main">
      		
      		<div class="item"><a href="/tripnow/mypage/qna.do"><div class="menubtn" id="qna"></div><p>1:1 문의</p></a></div>
      		<div class="item"><a href="/tripnow/mypage/info.do"><div class="menubtn" id="info"></div><p>회원 정보 조회/수정</p></div>
      		<div class="item"><a href="/tripnow/mypage/booklist.do"><div class="menubtn" id="booklist"></div><p>내 예약 조회</p></div>
      		<div class="item"><a href="/tripnow/mypage/unregister.do"><div class="menubtn" id="unregister"></div><p>회원 탈퇴</p></div>
      		
      </div>
      
      
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   </script>

</body>
</html>