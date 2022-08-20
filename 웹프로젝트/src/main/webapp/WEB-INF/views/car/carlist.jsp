<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	#stars > label:hover{
		cursor: pointer;
		opacity: 100%;
	}
	
	#stars > label{
		opacity : 50%;
	}
	
	#star1 {
		display: inline-block;
		margin-right: 10px;
		width: 80px;
		height: 23px;
		background-image: url("/tripnow/images/star.png");
		background-size: 420%;
		font-size: 18px;
		vertical-align: top
	}
	
	#star2 {
		margin-right: 10px;
		display: inline-block;
		width: 80px;
		height: 23px;
		background-image: url("/tripnow/images/star.png");
		background-position: 0px -23px;
		background-size: 420%;
		font-size: 18px;
		vertical-align: top
	}
	
	#star3 {
		display: inline-block;
		margin-right: 10px;
		vertical-align: top;
		width: 80px;
		height: 23px;
		background-image: url("/tripnow/images/star.png");
		background-position: 0px -47px;
		background-size: 420%;
		font-size: 18px;
	}
	
	#star4 {
		display: inline-block;
		margin-right: 10px;
		width: 80px;
		height: 23px;
		background-image: url("/tripnow/images/star.png");
		background-position: 0px -70px;
		background-size: 420%;
		vertical-align: top
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
   
    #options {
	 	background-color : #f0f0f0;
	 	border-radius: 8px;
	 	padding-top : 8px;
    }

	#options > p {
	 	margin-left : 15px;
	}
   
	#starall {
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 8px;
	}
	
	div > i {
		margin-right : 30px;
	}
	
	.countblock {
		font-size : 17px;
		
	}

	input.carcount {
		width : 50px;
		height : 40px;
		border : none;
		margin-left : 50px;
	}
	
	input.carcount:focus {
		outline : none;
	}
	
	.menubarcount, #searchbar > #homecategory, .countdiv {
		display : none;
	}
	
	main > main #searchbar {
		height : 80px;
	}
	
	
	
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/car/menubar.jsp" %>
		<nav>
			<div id="carlist">
				<h3>차종</h3>
				<div class="btn-group-vertical badoption">
					<button type="button" class="btn btn-primary all">모두보기</button>
					<button type="button" class="btn light">경차</button>
					<button type="button" class="btn small">소형</button>
					<button type="button" class="btn subcompact">준중형</button>
					<button type="button" class="btn mid">중형</button>
					<button type="button" class="btn top">고급</button>
					<button type="button" class="btn suv">SUV</button>
					<button type="button" class="btn van">승합</button>
				</div>
				<div id="optionlist">
					<h3>연료</h3>
					<div id="options">
						<p><label><input type="checkbox" class="g" checked>가솔린</label></p>
						<p><label><input type="checkbox" class="d" checked>디젤</label></p>
						<p><label><input type="checkbox" class="l" checked>LPG</label></p>
						<p><label><input type="checkbox" class="h" checked>하이브리드</label></p>
						<p><label><input type="checkbox" class="e" checked>전기</label></p>
					</div>
				</div>
			</div>
			<div class="countblock">
				<h3>최대 탑승 인원</h3>
				<i class="fa-solid fa-children car"></i>
				<input type="number" class="carcount" value="4" min="2" max="12">명
			</div>
			<div>
				<h3>별점</h3>
				<div id="starall">별점 전체보기</div>
				<div id="stars">
					<label><span id="star4"></span>4 점 이상</label>
					<label><span id="star3"></span>3 점 이상</label>
					<label><span id="star2"></span>2 점 이상</label>
					<label><span id="star1"></span>1 점 이상</label>
				</div>
			</div>
		</nav>
		<section>
		<form method="GET" action="/tripnow/car/carview.do">
		<c:forEach items="${list}" var="dto" varStatus="status">
		<c:if test="${dto.show == 'y'}">
		<div class="homelist ${dto.seq}">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="${dto.path}" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">${dto.cnseq}</h3>
	        			<p class="card-text">별점 : ${rclist[status.index].rating} (${rclist[status.index].count})</p>
	        			<p><span>${dto.location}</span></p>
	        			<p><span>대여 시작 : ${dto.rentstart} / 반납 시간 : ${dto.rentend}</span></p>
	        			<p class="card-text badge badge-light ctvalue"><span>${dto.ctvalue}</span></p>
	        			<p class="card-text badge badge-light fvalue"><span>${dto.fvalue}<input type="hidden" id="${dto.fseq}" /></span></p>
	        			<p class="card-text badge badge-light mileage"><span>${dto.mileage}Km/L</span></p>
	        			<p class="card-text badge badge-light geartype"><span>${dto.geartype}</span></p>
	        			<p class="card-text money price"> ￦ <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</p>
	        			<a class="btn btn-primary booking" name="carview" href="/tripnow/car/carview.do?seq=${dto.seq}">차량 선택하기</a>
	      			</div>
		    		</div>
		  		 </div>
			</div>
		</div>
		</c:if>
		</c:forEach>
		
		</form>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	<%@ include file="/WEB-INF/views/car/cartype.jsp" %>

	<script>
	
		$(".badoption [type=button]").click(function() {
			$(".badoption [type=button]").removeClass("btn-primary");
			$(this).addClass("btn-primary");
		});
		
		
	 	 
	 	$(".booking").click(function(event) {
	 		var aaa = event.target + "&loca=" + $("#loca").val() + "&dates=" + $(".flatpickr-input").val();
	 		$(".booking").attr("href", aaa);;
	 	});
	 	
	 	
	 	
	 	
	 	
		
	</script>

</body>
</html>
























