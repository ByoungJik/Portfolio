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
   
	#starall {
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 8px;
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
					<label><span id="star4"></span>4 점 이상</label>
					<label><span id="star3"></span>3 점 이상</label>
					<label><span id="star2"></span>2 점 이상</label>
					<label><span id="star1"></span>1 점 이상</label>
				</div>
			</div>
			<div id="optionlist">
				<h3>옵션리스트</h3>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
				<p><label><input type="checkbox">옵션</label></p>
			</div>
		</nav>
		<section>
		<form method="GET" action="/tripnow/home/view.do">
		<div class="homelist">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="/tripnow/images/jeju.jpg" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">숙소명</h3>
	        			<p class="card-text">★★★★★ (리뷰개수)</p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text money"> ￦ 66,666원</p>
	        			<input type="submit" class="btn btn-primary booking" value="객실 선택하기"/>
	      			</div>
	    		</div>
	  		 </div>
		</div>
	</div>
	<div class="homelist">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="/tripnow/images/jeju.jpg" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">숙소명</h3>
	        			<p class="card-text">★★★★★ (리뷰개수)</p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text money"> ￦ 66,666원</p>
	        			<input type="submit" class="btn btn-primary booking" value="객실 선택하기"/>
	      			</div>
	    		</div>
	  		 </div>
		</div>
	</div>
	<div class="homelist">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="/tripnow/images/jeju.jpg" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">숙소명</h3>
	        			<p class="card-text">★★★★★ (리뷰개수)</p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text money"> ￦ 66,666원</p>
	        			<input type="submit" class="btn btn-primary booking" value="객실 선택하기"/>
	      			</div>
	    		</div>
	  		 </div>
		</div>
	</div>
	<div class="homelist">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="/tripnow/images/jeju.jpg" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">숙소명</h3>
	        			<p class="card-text">★★★★★ (리뷰개수)</p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text money"> ￦ 66,666원</p>
	        			<input type="submit" class="btn btn-primary booking" value="객실 선택하기"/>
	      			</div>
	    		</div>
	  		 </div>
		</div>
	</div>
	<div class="homelist">
			<div class="card mb-3">
	  			<div class="row no-gutters">
	    			<div class="col-md-4">
	      				<img src="/tripnow/images/jeju.jpg" alt="..." class="thumbnail">
	    			</div>
	    			<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">숙소명</h3>
	        			<p class="card-text">★★★★★ (리뷰개수)</p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text badge badge-light"><span>숙소 타입</span></p>
	        			<p class="card-text money"> ￦ 66,666원</p>
	        			<input type="submit" class="btn btn-primary booking" value="객실 선택하기"/>
	      			</div>
	    		</div>
	  		 </div>
		</div>
	</div>
	
	</form>
	</section>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	
	<script>
		$(".badoption [type=button]").click(function() {
			$(".badoption [type=button]").removeClass("btn-primary");
			$(this).addClass("btn-primary");
		});
	</script>

</body>
</html>
























