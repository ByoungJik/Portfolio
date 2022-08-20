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
   
   
/* 	//////////////////////////////////////////   	 */

	.ALbar{
		position:relative;
		top:14px;
		
		
	}	
	
	.Acontainer{
		
		margin-top:19px ;
		width: 1060px;
		height:2000px;
/*  		background-color : cornflowerblue;  */
	}
	
		/* 	썸네일 */
	
	.AthumbnailContainer{
		display :flex;
		width: 1030px;
		margin:auto;
		height:360px;
 		background-color: #EEE; 
		padding: 7px;
		border-radius: 10px;
		
		margin-bottom: 17px;
		
		box-shadow: rgb(33 37 41 / 30%) 0px 4px 8px 0px;
		
		
	}
	.Athumbnail{
		width: 520px;
		height: 340px;
/* 		background-color : black; */
		margin-left: 7px;
	}
	
	.Athumbnail > img{
		
		border-radius: 2px;
		width: 520px;
		height: 340px;	
		object-fit: cover;
		border-radius: 6px;
	}
	
	
	
	
	.AvName{
		
		margin-left:24px;
		margin-top:2px; 
		
		width: 459px;
		height: 340px;
		
 		background-color : white;
 		
 		border-radius: 6px;
 		 

	}
	
	.AvName > div{
		word-break:break-all;
	}
	
	
	.AvName > div:nth-child(1){
	
/* 		background-color : white; */
		height: 60px;
		padding-top: 14px;
		margin-left: 20px;
	
	}
	
	.AvName > div:nth-child(1) > p {
		font-size: 17px;
	}
	
	.AvName > div:nth-child(1) > span {
		font-size: 14px;
		
	}
	
	.AvName > div:nth-child(2){
		
/*  		background-color : yellowgreen;  */
		height: 45px;
		padding-left: 17px;
		margin-top: 5px;
		
	}
	
	.AvName > div:nth-child(2) > .star5{
	    display: inline-block;
	    margin-right: 10px;
	    margin-top: 5px;
	    width: 140px;
	    height: 33px;
	    background-image: url(/tripnow/images/star.png);
	    background-position: 0px -134px;
	    background-size: 340%;
	    vertical-align: top;
	    
	    background-color : white; 
	
	}
	
	.AvName > div:nth-child(2) > .star4{
	    display: inline-block;
	    margin-right: 10px;
	    margin-top: 5px;
	    width: 140px;
	    height: 33px;
	    background-image: url(/tripnow/images/star.png);
	    background-position: 0px -100px;
	    background-size: 340%;
	    vertical-align: top;
	    
	    background-color : white; 
	
	}
	.AvName > div:nth-child(2) > .star3{
	    display: inline-block;
	    margin-right: 10px;
	    margin-top: 5px;
	    width: 140px;
	    height: 33px;
	    background-image: url(/tripnow/images/star.png);
	    background-position: 0px -66px;
	    background-size: 340%;
	    vertical-align: top;
	    
	    background-color : white; 
	
	}
	
	.AvName > div:nth-child(2) > .star2{
	    display: inline-block;
	    margin-right: 10px;
	    margin-top: 5px;
	    width: 140px;
	    height: 33px;
	    background-image: url(/tripnow/images/star.png);
	    background-position: 0px -31px;
	    background-size: 340%;
	    vertical-align: top;
	    
	    background-color : white; 
	
	}
	
	.AvName > div:nth-child(2) > .star1{
	    display: inline-block;
	    margin-right: 10px;
	    margin-top: 5px;
	    width: 140px;
	    height: 33px;
	    background-image: url(/tripnow/images/star.png);
	    background-position: 0px 3px;
	    background-size: 340%;
	    vertical-align: top;
	    
	    background-color : white; 
	
	}
	
	
	

	.AvName > div:nth-child(3){
		
/*  		background-color : skyblue;  */
		height: 195px;
		padding: 4px 20px 20px 20px;
		font-size: 15px;
		
	}
	
	.AvName > div:nth-child(3) > p{
		
	}
	
	
	.Actbook > .btn.actbuy{
		position:relative;
		top:-13px;
		left:-9px;
		
		float: right;
		margin-right:9px;
		margin-top:-5px;
	}
	
	.Actbook > .actCount{
	
		width: 45px;
	    height: 34px;
	    position: relative;
	    
	    top: -17px;
	    left: 312px;
	    font-size: 20px;
	    text-align: center;
	}
	
	
		/* 	포토 */
	
	.Actphoto{
		
/* 		background-color : beige; */
		
		width: 1030px;
		height: 585px;
		
		margin: auto;
		
		
	}	
	
	
	
	.Actphoto > div:nth-child(1){
		border-bottom: 1px solid gray;
		height: 40px;
		width: 95px;
		
	}
	
	.Actphoto > div:nth-child(1) > p{
		font-size:22px; 
		font-weight: 500;
	}
	
	.Actphoto > div:nth-child(2){
		
		margin-top: 15px;
		
	}
	
	
	
	
	

	.Actphoto > #contbox {
 		width: 1030px;
   		height: 500px;
   		padding: 0px;
   		box-shadow: rgb(33 37 41 / 30%) 0px 4px 8px 0px;
   	}
   	
	.item, .item img {
   		width: 1030px;
   		height: 500px;
   		object-fit: cover;
   		border-radius: 2px;
   	}
   	
		/*   리뷰 */
		
	.AcReview{
		
/* 		background-color: #999; */
		
		height: 1030px;
	
	}
	
	.homereview {
		/* border: 1px solid black; */
		padding: 20px;
		border-bottom: 1px solid #b7b7b7;
	}
	
	#reviewall {
		display: inline-block;
		margin-top: 5px;
		margin-bottom: 15px;
	}
	
	.reviewnumber {
		position: relative;
		top: 3px;
	}
	
	.reviewcontent {
		border: 1px solid #b7b7b7;
		padding: 15px;
		border-radius: 10px;
		text-align: justify;
	}
	
	.homereview:last-child {
		border-bottom: none;
	}
	
	#mainreview {
		border-bottom: 1px solid gray;
		padding-bottom: 20px;
		padding-top: 20px;
	}
	
	#reviewWrite {
		margin: 10px;
	}
	
	#reviewWrite > button{
		margin-left:-14px;
	}
	
	#reviewWrite > textarea {
		resize: none;
		padding: 10px;
		outline: none;
	}
	
	.write {
		position: relative;
		top: -40px;
		left: 25px;
	}
	
	#radiostar {
		margin-left: 15px;
		
	}
	
	AreviewWrite > div:nth-child(1){
		height:1030px;
	}
	
	#reviewstart {
		margin-top: 30px;
		margin-bottom: 20px;
		border-bottom: 1px solid gray;
	}
	
	.card.mb-3 {
		margin-bottom: 15px;
	}
	
	
	.homereview p {
		font-size: 25px;
		text-align: center;
		margin-top: 10px;
		
	}
	
	.master {
 		background-color: #EEE; 
	
	}
	
	.AreviewWrite{
		margin-left: 18px;
	}
		
	
	
	   
</style>

</head>
<body>
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      
      <div class="ALbar">
      	<%@ include file="/WEB-INF/views/activity/menubar.jsp"%>
      </div>	
      
      <div class="Acontainer">
	      <div class="AthumbnailContainer">
	      		<div class="Athumbnail">
	      			<img src="${dto.path} "  />
	      		</div>
	      		<div class="AvName">
		      		<div>
		      			<p>${dto.name}</p>
		      			<span>${dto.location}</span>				      		
		      		</div> 
		      		<div>
		      			<span class="star${dto.avgstar}"></span> 
	      			</div>
	      			<div>
	      				<p>${dto.content}</p>]      				
	      			</div>
	      			<form method="POST" action="/tripnow/activity/activitypayment.do" >
		      			<div class="Actbook">
		      				<input type="hidden" name="id" value="${id}" />
		      				<input type="hidden" name="seq" value="${seq}" />
<!-- 		      				<input type="hidden" name=""  /> -->
		      				<input type="number" name="count" value="${count}" class="actCount" />
		      				<button class="btn btn-primary actbuy" id="book" onclick="login_check();" >구매하기</button>
		      			</div>
	      			</form>
	      		</div>
	      	</div>  
	      	
	      	
	      <div class="Actphoto">
	      	
	      	  	<div>
	      	  		<p>상세사진</p>
	      	  	</div>
	      	  	
      	  		<div id="contbox" class="container">
			      	<div id="myCarousel" class="carousel slide" data-ride="carousel">
				          <!-- Indicators -->
				          <ol class="carousel-indicators">
				          <c:forEach var="a" begin="0" end="${dto.imagecount - 1}">
				            <li data-target="#myCarousel" data-slide-to="${a}"></li>
				          </c:forEach>
				          </ol>
				      
				          <!-- Wrapper for slides -->
				          <div class="carousel-inner">
				          
  				      		<c:forEach items = "${imagedto}" var="image">  				          	
				          		          
				            <div class="item">
				              <img src="${image.path}" alt="사진1">
				            </div>
 
 				            </c:forEach>  
						 </div>
				          
				          <!-- Left and right controls -->
						    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
						      <span class="glyphicon glyphicon-chevron-left"></span>
						      <span class="sr-only">Previous</span>
						    </a>
						    <a class="right carousel-control" href="#myCarousel" data-slide="next">
						      <span class="glyphicon glyphicon-chevron-right"></span>
						      <span class="sr-only">Next</span>
						    </a>
		      		</div>
		      	</div>
	      </div>
	      
	      
	      <div class="AcReview">
	      
	           
		      	<div class="AreviewWrite">
		      	   <div>
		      		<h3 id="reviewstart">리뷰 </h3>
		      	   </div>
		 			<form action="" id="addActReviewForm"> 
						<div id="radiostar">
							<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star5"></span></label>
							<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star4"></span></label>
							<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star3"></span></label>
							<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star2"></span></label>
							<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star1"></span></label>
						</div>
						<div id="reviewWrite">
							<textarea rows="3" cols="110px" name="content">리뷰를 작성하세요.</textarea>
							<button class="btn btn-primary write" >작성하기</button>
						</div>
					</form>
				</div>
		  
				
			<c:forEach items="${review}" var="dto">
				<div class="homereview">
					<div>
						<span>작성자 : ${dto.id}</span>
						<span>등록일 : ${dto.regdate}</span>
					</div>
					<div id="reviewall">
						<span class="star${dto.star}"></span>
					</div>
					<span class="reviewnumber">${dto.star}</span>
					<div class="reviewcontent">
						${dto.content}
					</div>
					<c:if test="${not empty dto.acontent}">
					<p><i class="fa-solid fa-angle-down"></i></p>
						<div class="reviewcontent master">
							 ${dto.acontent} 
						</div>
					</c:if>
				</div>
	        </c:forEach>

	      </div>
	      
      	  
      </div>
      

		
   </main>
      <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   
   <script>
   // 사진 추가
   $(function() {
       
       $('.carousel-indicators li:first-child').addClass("active");
       $('.carousel-inner div:first-child').addClass("active");
       $('#reviewall > span').add
       
    })
      
   
   function login_check(){ 
        var id = '<%=(String)session.getAttribute("auth")%>';

         if(id=="null"){ 
        	 
        	 if (confirm('로그인을 하시겠습니까?')) {
					location.href='/tripnow/member/login.do';
				}
        	 
        	 event.preventDefault();
         };
        
   };   

    
  	
    
    
 
   
   
   
   </script>

</body>
</html>





























