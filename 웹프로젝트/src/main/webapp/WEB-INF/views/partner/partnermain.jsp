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
/* 		background-color: #eee; */
		
		width: 780px;
		height: 500px;
		padding:0 30px 30px 30px;
		margin: 50px auto;
		border-top: 1px solid #DDD;
		border-bottom: 1px solid #DDD;

	}
	
	#regist{
/* 		background-color: #ccc; */
		
		width:540px;
		display: flex;
		margin:auto;
		
	}
	#etc{
		
		margin-top: 40px;
		display: flex;

		
	}
	
	#main .item {
		text-align: center;
		width: 180px;
		height: 180px;
		cursor:pointer;
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

	
	
	#home{
		width: 135px;
		height: 135px;
		background-image: url('/tripnow/images/homeimg.png');
		background-size: contain;
		background-repeat: no-repeat;		
	}
	
	#regist > div:nth-child(1) > p{
		
		margin-top: 16px;
   	 	margin-left: -15px;
	
	}
	
	#car{
		width: 140px;
		height: 140px;
		background-image: url('/tripnow/images/carimg.png');
		background-size: contain;
		background-repeat: no-repeat;		
	
	}
	#act{
		width: 140px;
		height: 140px;
		background-image: url('/tripnow/images/actimg.png');
		background-size: contain;
		background-repeat: no-repeat;		
	
	}
	
	#chart{
		width: 135px;
		height: 135px;
		background-image: url('/tripnow/images/chartimg.png');
		background-size: contain;
		background-repeat: no-repeat;	
	
	}
	
	#etc > div:nth-child(4) > p{
		margin-top:25px;
	}
	
	#item{
		width: 150px;
		height: 150px;
		background-image: url('/tripnow/images/itemimg.png');
		background-size: contain;
		background-repeat: no-repeat;	
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
      
      <h1>Partner</h1>
      <div id="main">
      
      		<div id="regist">
	      		<div class="item" onclick="location.href='/tripnow/partner/homeadd.do'"><div class="menubtn" id="home"></div><p>숙소 등록</p></div>
	      		<div class="item" onclick="location.href='/tripnow/partner/addcar.do'"><div class="menubtn" id="car"></div><p>랜터카 등록</p></div>
	      		<div class="item" onclick="location.href='/tripnow/partner/actregister.do'"><div class="menubtn" id="act"></div><p>액티비티 등록</p></div>
      		</div>
      		
      		
      		<div id = "etc">
	      		<div class="item" onclick="location.href='/tripnow/partner/mylist.do'"><div class="menubtn" id="item"></div><p>내 상품들</p></div>
	      		<div class="item" onclick="location.href='/tripnow/partner/bookmanage.do'"><div class="menubtn" id="booklist"></div><p>예약관리</p></div>
	      		<div class="item" onclick="location.href='/tripnow/partner/reviewreply.do'"><div class="menubtn" id="qna"></div><p>리뷰답변</p></div>
	      		<div class="item" onclick="location.href='/tripnow/partner/sales.do'"><div class="menubtn" id="chart"></div><p>매출현황</p></div>
      		</div>
      		
      		
      		
      </div>
      
      
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   </script>

</body>
</html>