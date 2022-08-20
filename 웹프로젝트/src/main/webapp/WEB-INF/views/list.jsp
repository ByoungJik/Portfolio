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
	nav {
		margin-top: 30px;
		margin-right: 15px;
		float: left;
		width: 250px;
		height: 1500px;
		/* background-color: #999; */
	}
	
	.homelist {
		margin-top: 30px;
		padding-right: 10px;
		border: 1px solid black;
		float: left;
		width: 795px;
		height: 228px;
	}
	
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
	
	.col-md-4 > .thumbnail {
		width: 250px;
		height: 226px;
		border: none;
	}
	
	#bad ul {
		list-style: none;
	}
	
	#bad ul li {
		border: 1px solid black;
	}
	
	.btn-group-vertical.badoption {
		/* width: 210px; */
		display: inline;
	}
	
	.btn-group-vertical.badoption > button {
		outline: 0;
		border: 0;
		box-shadow: none;
	}
	
	#stars label {
		font-size: 18px;
		padding-bottom: 5px;
	}
	
	.starsvalue {
		margin-left: 60px;
	}
	
   p input[type='checkbox'] {
      margin-right: 10px;
   }
   
   #optionlist p label {
      font-size: 16px;
      font-weight: normal;
   }
   
	#starall {
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 8px;
	}
	
	.fontup {
		font-size: 18px;
	}
	
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/home/menubar.jsp" %>
		<nav>
			<div id="bad">
				<h3>베드옵션</h3>
				<div class="btn-group-vertical badoption">
					<button type="button" class="btn btn-primary">일반</button>
					<button type="button" class="btn btn-secondary">트윈</button>
					<button type="button" class="btn btn-secondary">퀸</button>
					<button type="button" class="btn btn-secondary">온돌</button>
				</div>
			</div>
			<div>
				<h3>별점</h3>
				<div id="starall">별점 전체보기</div>
				<div id="stars">
					<label><span class="star4"></span>4 점 이상</label>
					<label><span class="star3"></span>3 점 이상</label>
					<label><span class="star2"></span>2 점 이상</label>
					<label><span class="star1"></span>1 점 이상</label>
				</div>
			</div>
			<div id="optionlist">
				<h3>옵션리스트</h3>
				<p><label><input type="checkbox" id="bath">욕조</label></p>
				<p><label><input type="checkbox" id="pet">애견동반</label></p>
				<p><label><input type="checkbox" id="smoke">흡연</label></p>
				<p><label><input type="checkbox" id="pool">수영장</label></p>
				<p><label><input type="checkbox" id="parking">주차</label></p>
				<p><label><input type="checkbox" id="cook">취사</label></p>
				<p><label><input type="checkbox" id="wifi">와이파이</label></p>
			</div>
		</nav>
		<section>
		<c:forEach items="${hif}" var="hif">
		<div class="homelist">
		<input type="hidden" class="bedvalue" value="${hif.bedvalue}">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="/tripnow/${hif.path}" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">${hif.name}</h3>
	        			<p class="card-text fontup">${hif.location}</p>
	        			<p class="card-text fontup">★★★★★
	        				<span id="starval">	
	        			(평균 : <fmt:formatNumber value="${hif.star}" pattern=".0"/>)</span> (${hif.reviewcount})</p>
	        			<c:if test="${hif.bath eq 'y'}">
	        			<p class="card-text badge badge-light"><span>욕조</span></p>
	        			</c:if>
	        			<c:if test="${hif.pet eq 'y'}">
	        			<p class="card-text badge badge-light"><span>애견동반 가능</span></p>
	        			</c:if>
	        			<c:if test="${hif.smoke eq 'y'}">
	        			<p class="card-text badge badge-light"><span>흡연 가능</span></p>
	        			</c:if>
	        			<c:if test="${hif.pool eq 'y'}">
	        			<p class="card-text badge badge-light"><span>수영장 있음</span></p>
	        			</c:if>
	        			<c:if test="${hif.parking eq 'y'}">
	        			<p class="card-text badge badge-light"><span>주차 가능</span></p>
	        			</c:if>
	        			<c:if test="${hif.cook eq 'y'}">
	        			<p class="card-text badge badge-light"><span>취사 가능</span></p>
	        			</c:if>
	        			<c:if test="${hif.wifi eq 'y'}">
	        			<p class="card-text badge badge-light"><span>와이파이</span></p>
	        			</c:if>
	        			<div></div>
	        			<p class="card-text money"> ￦ <fmt:formatNumber value="${hif.price}" pattern="#,###,###" /> 원</p>
	        			<input type="hidden" name="seq" value="${hif.seq}">
	        			<a class="btn btn-primary booking" href="/tripnow/home/view.do?seq=${hif.seq}">객실 선택하기</a>
	      			</div>
	    		</div>
	  		 </div>
		</div>
	</div>
	</c:forEach>
	</section>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	
	<script>
		$(".badoption [type=button]").click(function() {
			
			if ($(".bedvalue").val() === ($(this).text())) {
				$(".bedvalue").parent().addClass("show");
				$(".bedvalue").parent().removeClass("hide");
				
				if($(".bedvalue").val() != ($(this).text())) {
					$(".bedvalue").parent().addClass("hide");
					$(".bedvalue").parent().removeClass("show");
				}
				
			} else {
				$(".bedvalue").parent().addClass("hide");
				$(".bedvalue").parent().removeClass("show");
			}
			
			
			$(".badoption [type=button]").removeClass("btn-primary");
			$(this).addClass("btn-primary");
				
		});
		
		$("#bath").change(function() {
			console.log($(this).is(":checked"));
		});
		
		$(".booking").click(function(event) {
	 		var aaa = event.target + "&loca=" + $("#loca").val() + "&dates=" + $(".flatpickr-input").val() + "&count=" + $(".count").val();
	 		$(".booking").attr("href", aaa);;
	 	});
		
	</script>

</body>
</html>
























