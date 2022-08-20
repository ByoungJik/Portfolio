<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripNow(트립나우)</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script><script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<style>
	#searchbar {
		margin-top: 60px;
		height: 135px;
		box-shadow: rgb(33 37 41 / 10%) 0px 4px 8px 0px;
	}
	#b_search {
		display: flex;
		justify-content: center;
		margin: 0px 20px 0px 20px;
		padding: 20px 20px 0 20px;
	}
	
	.fa-location-dot, .fa-calendar-check, .fa-children {
		position: absolute;
		padding: 13px 0 15px 10px;
	}
	
	.fa-sort-down {
		position: relative;
		left: -55px;
		top: -2px;
		margin-left: 30px;
	}
	
	#maphide .fa-sort-down {
		left: 195px;
		top: -31px;
	}
	
	#b_search input[type=text], #b_search input[type=number] {
		height: 40px;
		padding-left: 30px;
		padding-right: 30px;
		background-color: #f5f6f7;
		border: 1px solid black;
		border-radius: 5px;
	}
	
	#b_search input[type=number] {
	
	}
	
	#b_search div:nth-child(1) input[type=text] {
		width: 250px;
	}
	
	#b_search div:nth-child(2) input[type=text] {
		width: 250px;
	}
	
	#b_search div:nth-child(3) input[type=number] {
		width: 120px;
		padding-left: 35px;
		margin-right: 10px;
		text-align: center;
		padding-right: 10px;
	}
	
	#b_search div:nth-child(3) .fa-sort-down {
		top: -31px;
		left: 35px;
	}
	
	#b_search div:nth-child(1) { 
		margin-right: 50px; 
	}
	
	#b_search div:nth-child(3) { 
		margin-right: 20px; 
		width: 150px;
	}
	
	#homesearch {
		background-color: #60c1f0; 
		color: white;
		width: 60px;
		height: 40px;
		font-weight: bold;
		border-width: 0;
		border-radius: 5px;
	}
	
	#homecategory {
		width: 920px;
		margin: 0 auto;
	}
	
	#homecategory ul {
		display: flex;
		list-style-type: none;
		border-bottom: 1px solid lightgray;
	}
	
	#homecategory ul > li {
		font-size: 20px;
		margin: 5px 40px 10px 5px;
	}
	
	#homecategory ul > li:hover {
		cursor: pointer;
	}
	
	.catesel {
		font-weight: bold;
		border-bottom: 3px solid #60c1f0;
	}
	
	#maphide > ul {
		display: none;
		margin: 0;
		padding: 10px 0 5px 20px;
		list-style-type: none;
		width: 130px;
		position: relative;
		border: 1px solid black;
		top: -20px;
		z-index: 1;
	}
	
	#maphide:hover ul {
		display: block;
		background-color: white;
	}
	
	#maphide ul > li {
		padding-bottom: 8px;
	}
	
	#maphide ul > li:hover > ul {
		display: block;
	}
	
	#maphide ul > li > ul:hover ul {
		display: block;
	}
	
	#maphide ul > li > ul {
		list-style: none;
		border: 1px solid black;
		position: absolute;
		margin: 0;
		padding: 10px 0 5px 20px;
		width: 180px;
		left: 128px;
		top: -1px;
	}
	
	.inlinetext {
		width: 250px;
	}
	
	#back {
		background-image: url("/tripnow/images/car.jpg");
		background-repeat: no-repeat;
		background-size: 1060px;
		background-position: center center;
		height: 400px;
	}
	
	
	.count {
		width: 100px;
	}
	
	form {
		padding-top : 130px;
	}
	
	.menubarcount, #searchbar > #homecategory, .human{
		display : none;
	}
	
	main > main #searchbar {
		height : 80px;
	}
	
	.mapsido {
    	width: 120px;
   	}
	
		
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		
		<div id="back">
		<section>
			<div id="searchbar">
			<div id="homecategory">
				<ul>
					<li class="catesel">모텔</li>
					<li>호텔</li>
					<li>펜션</li>
				</ul>
			</div>
			<form method="POST" action="/tripnow/car/carlist.do">
				<div id="b_search">
					<div class="inlinetext">
						<div id="maphide">
						<i class="fa-solid fa-location-dot dot"></i>
						<input type="text" id="loca" name="loca" value="서울특별시 강남/역삼/삼성/논현">
						<i class="fa-solid fa-sort-down"></i>
							<ul class="Nmapsido">
                           <li class="mapsido">
                              <div>서울특별시</div>
                              <ul class="hide">
                                 <li>강남/역삼/삼성/논현</li>
                                 <li>서초/교대</li>
                                 <li>잠실/송파/왕십리/강동</li>
                                 <li>을지로/시청/명동</li>
                                 <li>종로/인사동/동대문/강북</li>
                                 <li>서울역/이태원/용산</li>
                                 <li>마포/홍대/신촌/서대문</li>
                                 <li>영등포/여의도/김포공항</li>
                                 <li>구로/금천/관악/동작</li>
                                 <li>마포/홍대/신촌/서대문</li>
                              </ul>
                           </li>
                           <li class="mapsido">
                              <div>경기도</div>
                              <ul class="hide">
                                 <li>수원/성남/판교/가평</li>
                                 <li>용인/평택/여주/이천</li>
                                 <li>화성/동탄/안산/부천/안양</li>
                                 <li>고양/의정부/파주/김포</li>
                                 <li>시흥/군포/광명</li>
                                 <li>남양주시/구리/하남</li>
                              </ul>
                           </li>
                           <li class="mapsido">
                              <div>인천</div>
                              <ul class="hide">
                                 <li>송도/남동구/옹진군</li>
                                 <li>인천국제공항(중구)</li>
                                 <li>부평/계양/서구/미추홀구/강화</li>   
                              </ul>
                           </li>
                            <li class="mapsido">
                              <div>강원도</div>
                              <ul class="hide">
                                 <li>강릉/동해/삼척</li>
                                 <li>속초/고성</li>
                                 <li>양양/홍천/인제/철원</li>
                                 <li>평창/정선/횡성</li>
                                 <li>강릉/동해/삼척</li>
                                 <li>춘천/원주/영월/태백</li>
                              </ul>
                           </li>
                           <li class="mapsido">
                              <div>제주</div>
                              <ul class="hide">
                                 <li>제주시/제주국제공항</li>
                                 <li>애월/협재/한림</li>
                                 <li>조천/함덕/김녕</li>
                                 <li>서귀포시</li>
                                 <li>중문</li>
                                 <li>성산/표선</li>
                              </ul>
                           </li>
                           <li class="mapsido">
                              <div>경상</div>
                              <ul class="hide">
                                 <li>경주</li>
                                 <li>거제/고성</li>
                                 <li>포항/청송/영덕/울진</li>
                                 <li>통영/창년</li>
                                 <li>대구/구미/문경</li>
                                 <li>울산/안동</li>
                                 <li>창원/양산/김해</li>
                                 <li>사천/남해/진주/하동</li>
                              </ul>
                           </li>
                           <li class="mapsido">
                              <div>전라</div>
                              <ul class="hide">
                                 <li>여수</li>
                                 <li>전주</li>
                                 <li>순천/광양</li>
                                 <li>군산/익산/부안/진안/무주</li>
                                 <li>화순/남원/구례</li>
                                 <li>목포/나주/완도/해남/영암</li>
                              </ul>
                           </li>
                           <li class="mapsido">
                              <div>충청</div>
                              <ul class="hide">
                                 <li>대전</li>
                                 <li>천안/아산/예산/당진</li>
                                 <li>보령/태안/서산/부여</li>
                                 <li>충주/제천/단양</li>
                                 <li>청주/세종</li>                               
                              </ul>
                           </li>
                        </ul>
							
						</div>
					</div>
					<div>
						<i class="fa-solid fa-calendar-check"></i>
						<input type="text" id="dates" name="dates">
						<input type="hidden" id="hiddendate" name="hiddendate">
						<i class="fa-solid fa-sort-down"></i>
					</div>
					<div class="human">
						<i class="fa-solid fa-children"></i>
						<input type="number" class="count" name="count" value="2" min="1" max="5">명
					</div>
					<input id="homesearch" type="submit" value="조회">
				</div>
			</form>
		</div>
			
		</section>
		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	</main>
	
	<script>
	
	const changeText = $(".Nmapsido li > div").click(function() {
        
    	$("#loca").val($(this).text());
    	
    });

	const changeText2 = $(".hide li").click(function() {
    	$("#loca").val($(this.parentNode.previousElementSibling).text()+' '+$(this).text());
    	sido = $(this).text();
 	});

	$(".mapsido").mouseover(function() {
	    $(this).find(".hide").removeClass("hide").addClass("show");
	});
	
	$(".mapsido").mouseout(function() {
	    $(this).find(".show").removeClass("show").addClass("hide");
	});
	
	$("#homecategory li").click(function() {
	    $("#homecategory li").removeClass("catesel");
	    $(this).addClass("catesel");
	});
	
	if(!changeText == null) {
	   
	}
	
	
  

	flatpickr.localize(flatpickr.l10ns.ko);
	flatpickr($("#dates"));

    
    const tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate() + 1);
    
    $("#dates").flatpickr({
       local: 'ko',
       mode: "range",
       dateFormat: "Y-m-d",
       autoclose : true,
       minDate: "today",
       defaultDate: ["today", tomorrow]
    });
    
    $("#dates").change(function() {
        $("#hiddendate").val($(".flatpickr-input").val());
    });
	
	</script>




















</body>
</html>