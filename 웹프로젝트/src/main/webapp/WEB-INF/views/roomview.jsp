<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripNow(트립나우)</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
   
   .money {
		float: right;
		font-size: 20px;
		font-weight: bold;
	}

	.btn.btn-primary.booking {
		float: right;
		clear: both;
		margin-bottom: 10px;
	}

	.money, .btn.btn-primary.booking {
		margin-right: 30px;
	}
	
	.mb-3 {
		border: 1px solid #fbceb1;
		width: 1060px;
		box-shadow: rgb(33 37 41/ 10%) 0px 4px 8px 0px;
		border-radius: 20px;
	}
	.mb-3.main {
		border-bottom-right-radius: 0px;
		border-bottom-left-radius: 0px;
	}
	
	.col-md-4>.thumbnail {
		width: 330px;
		height: 200px;
		border: none;
		border-radius: 20px;
	}
	
	.col-md-4 {
		height: 200px;
	}
	
	.card.mb-3 {
		margin-bottom: 0px;
	}
	
	section > h5 {
		margin: 40px 0 20px 10px;
	}
   
   	#contbox {
 		width: 1060px;
   		height: 500px;
   		padding: 0px;
   		box-shadow: rgb(33 37 41 / 30%) 0px 4px 8px 0px;
   	}
   	
   	.item, .item img {
   		width: 1060px;
   		height: 500px;
   		object-fit: cover;
   	}
   	
   	.sub {
   		margin-top: 30px;
   		padding: 25px;
   		height: 215px;
   	}
   	
   	.sub ul {
   		float: left;
   		margin-right: 120px;
   		font-size: 16px;
   	}
   	
   	.sub ul:last-child {
   		margin-right: 0px;
   	}
   
</style>

</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<%@ include file="/WEB-INF/views/home/menubar.jsp"%>
		<section>

			<h5>${dto.name}> ${dto.roomname}</h5>
			<div class="card mb-3 main">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="/tripnow/${dto.path}" alt="..." class="thumbnail">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h3 class="card-title">${dto.roomname}</h3>
							<ul>
								<li>베드옵션정보 : (${dto.value})</li>
								<li>최대수용인원 : (${dto.maxpeople} 명)</li>
							</ul>
							<p class="card-text money">
								￦
								<fmt:formatNumber value="${dto.price}" pattern="#,###,###" />
								원
							</p>
							<c:if test="${not empty auth}">
								<button class="btn btn-primary booking"
									onclick="location.href='/tripnow/home/homepayment.do?seq=${seq}&dates=${dates}';">예약하기</button>
							</c:if>
							<c:if test="${empty auth}">
								<br>
								<br>
								<div style="float: right; margin-right: 20px; color: tomato;">예약은 로그인 후 이용가능합니다.</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>


			<c:if test="${plist.size() > 0}">
				<div id="contbox" class="container">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">

							<c:forEach var="i" begin="0" end="${plist.size() - 1}">
								<li data-target="#myCarousel" data-slide-to="${i}"></li>
							</c:forEach>

						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<c:forEach items="${plist}" var="plist">
								<div class="item">
									<img src="/tripnow/${plist.fpath}" alt="사진1">
								</div>
							</c:forEach>

						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</c:if>


			<div class="card mb-3 sub">

				<h2>전체 옵션 정보</h2>
				<ul>
					<c:if test="${dto.bath == 'y'}">
						<li>O 욕조</li>
					</c:if>
					<c:if test="${dto.bath == 'n'}">
						<li>X 욕조</li>
					</c:if>
					<c:if test="${dto.pet == 'y'}">
						<li>O 반려견/묘 동반</li>
					</c:if>
					<c:if test="${dto.pet == 'n'}">
						<li>X 반려견/묘 동반</li>
					</c:if>
					<c:if test="${dto.smoke == 'y'}">
						<li>O 흡연</li>
					</c:if>
					<c:if test="${dto.smoke == 'n'}">
						<li>X 흡연</li>
					</c:if>
				</ul>
				<ul>
					<c:if test="${dto.pool == 'y'}">
						<li>O 수영장</li>
					</c:if>
					<c:if test="${dto.pool == 'n'}">
						<li>X 수영장</li>
					</c:if>
					<c:if test="${dto.parking == 'y'}">
						<li>O 주차</li>
					</c:if>
					<c:if test="${dto.parking == 'n'}">
						<li>X 주차</li>
					</c:if>
					<c:if test="${dto.cook == 'y'}">
						<li>O 취사</li>
					</c:if>
					<c:if test="${dto.cook == 'n'}">
						<li>X 취사</li>
					</c:if>
					<c:if test="${dto.wifi == 'y'}">
						<li>O WIFI</li>
					</c:if>
					<c:if test="${dto.wifi == 'n'}">
						<li>X WIFI</li>
					</c:if>
				</ul>
				<ul>
					<li>베드옵션 : ${dto.value}</li>
					<li>최대수용인원 ${dto.maxpeople} 명</li>
				</ul>
				<ul>
					<li>체크인: PM ${dto.enterhome}</li>
					<li>체크아웃: AM ${dto.outerhome}</li>
				</ul>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   
   <script>
	   $(function() {
	       
	       $('.carousel-indicators li:first-child').addClass("active");
	       $('.carousel-inner div:first-child').addClass("active");
	       
	    });
	    
   </script>

</body>
</html>