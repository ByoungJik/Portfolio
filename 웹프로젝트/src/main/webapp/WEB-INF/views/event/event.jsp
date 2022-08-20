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
	
	.NList{
		
		position: relative;
		top: 30px;
		margin-top:3px;
		width: 1060px;
		height:1060px;
/* 		background-color: #999; */
		
	}
	
	
	.Act_card{
		
		
		border-radius: 9px;
		width: 309px;
		height: 311px;
		margin-bottom: 16px;	
		margin-left:20px;
		margin-right:20px;
		word-break:break-all;
		
		
		float:left;	
	}
	
	.card-img-top{
		border-radius: 9px;
	}
	
	
	
	.Act_card > .title { 
		
		margin-left:5px;
		margin-right:5px;
		position : relative;
		top : -250px;
		left : 20px;
		font-size : 23px;
		font-weight: bold;
		color : white;
	 } 
	 
	 .Act_card > .sub { 
		
		margin-left:5px;
		margin-right:5px;
		position : relative;
		top : -240px;
		left : 20px;
		font-size : 16px;
		font-weight: bold;
		color : white;
	 } 
	
	 .Act_card > button {
	 	position : relative;
		top : -110px;
		left : 212px;
	 }
	 
	 .name > p{
	 	
	 	font-size: 1.3em;
	 	font-weight: 600;
	 
	 }
	 
	 
	
	
	
	.card-img-top{
		margin : 7px;
		width: 292px;
		height: 293px;
		filter: brightness(50%); 
		box-shadow: rgb(33 37 41/ 70%) 0px 4px 8px 0px;
	}
	
	.main{
		width: 1100px;
		height:1100px;
		
	}
	
	.ALbar{
		position:relative;
		top:14px;
	}	
	
	.Afootter{
		margin-top:35px;
	}
	
	.region > p{
		font-size: 13px;
	}
	
	

</style>
</head>
<body>
<main>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		
	<div class="NList">
	   <div class="Nact_List">
			 
			 <c:forEach items="${list}" var="dto">
			 <c:if test="${dto.finished == 'y'}">
			 <form>
				 <div class="Act_card" >
				 	<input type="hidden" name="userid" value="${auth}"  />
				 	<input type="hidden" name="seq" value="${dto.seq}" />
			     	<img src="${dto.bennerpicture}" class="card-img-top" alt="...">
					<div class="title">${dto.eventname}</div>
					<div class="sub">${dto.rate}% 할인</div>
					<button class="btn btn-secondary coupon">쿠폰 받기</button>
				 </div>
			</form>
			 </c:if>
			 </c:forEach>
			
			
		</div>
		
	</div>
		
	
	</main>
	<div class="Afootter">
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<script>
	
		$(".coupon").click(function() {
			
			let form = this.form;
			
			
			if (${empty auth}) {
				if (confirm('로그인을 하시겠습니까?')) {
					event.preventDefault();
					location.href='/tripnow/member/login.do';
				}
			} else {
				
				
				$.ajax({
					type:'POST',
					url: '/tripnow/event/couponadd.do',
					data: $(form).serialize(),
					dataType: 'text',
					success: function(result){
						
						alert(result);
						
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
				
				
			}
			
		});
		
		
		
	
	
	</script>

</body>
</html>



























