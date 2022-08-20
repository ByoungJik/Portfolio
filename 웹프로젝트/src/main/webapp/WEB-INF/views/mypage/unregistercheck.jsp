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

	.list {
		width: 840px;
		margin: 10px auto;
	}
	
	.list > h2 {
		padding-bottom: 10px;
		margin-top: 30px;
		margin-bottom: 15px;
		border-bottom: 1px dashed #DDD;
		
	}
	
	.homelist, .actlist, .carlist {
		padding-bottom: 10px;
		border-bottom: 1px dashed #DDD;
	}
	
	main > h1 {
		font-size: 23px;
		border-bottom: 1px solid #CCC;
		padding: 10px 0px 20px 0px;
	}
	
	.highlight {
		color: tomato;
	}
	
	.card {
		border: 1px solid #CCC;
		border-radius: 10px;
		overflow: hidden;
		max-width: 840px;
		max-height: 200px;
	}
	
	.col-md-4 img {
		width: 250px;
		height: 200px;
	}
	
	.card-title {
		font-size: 25px;
		margin-top: 25px;
	}
	
	.card-title small {
		font-size: 15px;
		margin-left: 15px;
	}
	
	.card-text.won {
		margin-bottom: 0px;	
	}
	.card-bottom .price {
		text-align: right;
		margin-right: 15px;
		margin-bottom: 10px;
		padding-right: 10px;
		border-right: 1px solid #DDD;
	}
	
	.card-bottom {
		float: right;
		display: flex;
	}
	
	.card-bottom .price .won {
		font-size: 20px;
	}
	
	p.card-text.context {
		margin-bottom: 3px;
	}
	
	.text-muted i {
		margin-left: 15px;
	}
	
	.state h2 {
		margin: 10px 15px 0px 0px;
	}
	
	.none {
		font-size: 15px;
		text-align: center;
	}
	
	
	.unregister {
		margin: 20px 0px 40px 0px;
		float: right;
	}
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      
      <h1>* '예약중' 상품이 있을 경우, 탈퇴 시 상품은 모두 <span class=highlight>취소</span>됩니다.</h1>
      
      <div class="list">
      
      <h2>숙소</h2>
      <div class="items homelist">
    	<c:if test="${not empty homeList}">  
	      	<c:forEach items="${homeList}" var="dto">
	      		<div class="card mb-3 item home">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <img src="/tripnow/${dto.pic}" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">${dto.bookName}<small>${dto.roomName}</small></h5>
				        <p class="card-text"><span class="badge badge-pill badge-secondary">날짜</span>&nbsp;&nbsp;${dto.startdate} ~ ${dto.enddate}</p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;체크인: ${dto.checkin}, 체크아웃: ${dto.checkout}</small></p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;&nbsp;위치 정보: ${dto.location}</small></p>
				        
				        <div class="card-bottom">
					        <div class="price">
					        <p class="card-text context"><small class="text-muted">주문금액</small></p>
					        <p class="card-text won">￦ ${dto.price}</p>
					        </div>
					        
					        <div class="state"><h2>${dto.state}</h2></div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				
			</c:forEach>
		</c:if>
		
		<c:if test="${empty homeList}">
			<h3 class="none">'예약중' 상태인 숙소가 없습니다.</h3>
		</c:if>
      </div>
		
		
      <h2>액티비티</h2>
      <div class="items actlist">
      
      <c:if test="${not empty actList}">  
	      	<c:forEach items="${actList}" var="dto">
	      		<div class="card mb-3 item home">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <img src="/tripnow/${dto.pic}" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">${dto.bookName}</h5>
				        <p class="card-text"><span class="badge badge-pill badge-secondary">예약 날짜</span>&nbsp;&nbsp;${dto.startdate}&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-pill badge-secondary">만료 기한</span>&nbsp;&nbsp;${dto.enddate}</p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;예약 인원: ${dto.count} 명</small></p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;&nbsp;위치 정보: ${dto.location}</small></p>
				        
				        <div class="card-bottom">
					        <div class="price">
					        <p class="card-text context"><small class="text-muted">주문금액</small></p>
					        <p class="card-text won">￦ ${dto.price}</p>
					        </div>
					        
					        <div class="state"><h2>${dto.state}</h2></div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				
			</c:forEach>
		</c:if>
     
 		<c:if test="${empty actList}">
			<h3 class="none">'예약중' 상태인 액티비티가 없습니다.</h3>
		</c:if>
      </div>
      
      
      <h2>렌터카</h2>
      <div class="items carlist">
      
          	<c:if test="${not empty carList}">  
	      	<c:forEach items="${carList}" var="dto">
	      		<div class="card mb-3 item home">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <img src="/tripnow/${dto.pic}" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">${dto.bookName}</h5>
				        <p class="card-text"><span class="badge badge-pill badge-secondary">날짜</span>&nbsp;&nbsp;${dto.startdate} ~ ${dto.enddate}</p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;대여 시각: ${dto.checkin}, 반납 시각: ${dto.checkout}</small></p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;&nbsp;위치 정보: ${dto.location}</small></p>
				        
				        <div class="card-bottom">
					        <div class="price">
					        <p class="card-text context"><small class="text-muted">주문금액</small></p>
					        <p class="card-text won">￦ ${dto.price}</p>
					        </div>
					        
					        <div class="state"><h2>${dto.state}</h2></div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				
			</c:forEach>
		</c:if>
      
      
      	<c:if test="${empty carList}">
      		<h3 class="none">'예약중' 상태인 렌터카가 없습니다.</h3>
      	</c:if>
      </div>
 		
		
		
 
 	  <input type="button" class="btn btn-danger unregister" value="탈퇴하기">
      </div>
      
      
      
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   
   	$('.btn.unregister').click(function() {
   	
   		if (confirm('정말 탈퇴하시겠습니까?')) {
   			location.href = "/tripnow/mypage/unregisterok.do?id=${auth}";
   		} else {
   			location.href = "/tripnow/mypage/mypagemain.do";
   		}
   		
   	});
   	
   	
   </script>

</body>
</html>