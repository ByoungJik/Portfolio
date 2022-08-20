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
   
   .menubarcount, #searchbar > #homecategory {
      display : none;
   }
   
   main > main #searchbar {
      height : 80px;
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

	.money, .btn.btn-primary.booking {
		margin-right: 30px;
	}
	
	.mb-3 {
		border: 1px solid #fbceb1;
		width: 1060px;
		box-shadow: rgb(33 37 41/ 10%) 0px 4px 8px 0px;
		border-radius: 20px;
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
   		margin-top: 20px;
   		padding: 25px;
   		height: 145px;
   	}
   	
   	.sub ul {
   		float: left;
   		margin-right: 120px;
   		font-size: 16px;
   	}
   	
   	.sub ul:last-child {
   		margin-right: 0px;
   	}
   	
   	.carreview:last-child {
		border-bottom: none;
	}
	
	.carreview p {
		font-size: 25px;
		text-align: center;
		margin-top: 10px;
		
	}
	
	#radiostar {
		margin-left: 15px;
	}

		#homeinfo {
		padding: 20px 30px;
		border: 1px solid #b7b7b7;
		margin-top: 30px;
		margin-bottom: 30px;
		font-size: 17px;
		color: #808080;
		border-radius: 20px;
		box-shadow: rgb(33 37 41/ 10%) 0px 4px 8px 0px;
	}

	.homelist {
		margin-top: 30px;
		margin-bottom: 150px;
		padding-right: 10px;
		float: left;
		height: 500px;
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

	.money, .btn.btn-primary.booking {
		margin-right: 30px;
	}
	
	.mb-3 {
		border: 1px solid #fbceb1;
		width: 1060px;
		box-shadow: rgb(33 37 41/ 10%) 0px 4px 8px 0px;
		border-radius: 20px;
	}
	
	.col-md-4>.thumbnail {
		width: 330px;
		height: 200px;
		border: none;
		border-radius: 20px;
	}
	
	.carinfo {
		border: 1px solid black;
		width: 1060px;
		height: 100px;
		margin-top: 30px;
	}
	
	.col-md-4 {
		height: 200px;
	}
	
	.carreview {
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
	
	.carreview:last-child {
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
	
	#reviewstart {
		margin-top: 30px;
		margin-bottom: 20px;
	}
	
	.card.mb-3 {
		margin-bottom: 15px;
	}
	
	
	.carreview p {
		font-size: 25px;
		text-align: center;
		margin-top: 10px;
		
	}
	
	.master {
		background-color: #EEE;
	
	}
	
	.delete {
		color : red;
		display : inline;
	}

	.edit {
		color : blue;
		display : inline;
	}
	
	.contentox {
		margin-left : 915px;
	}
	
	.contentox > div:hover {
		cursor: pointer;
	}
	
	.reviewcontent.real {
		margin : 0;
		padding : 0;
		border : 0;
		border-radius: 0;
		width: 100%;
		height : 100%;
		resize : none;
	}
	
	.reviewcontent.edit {
		margin : 0;
		border-radius: 0;
		width: 100%;
		height : 100%;
		resize : none;
	}
	
	
	.reviewcontent.real:focus {
		outline : none;
	}
	
   
</style>

</head>
<body>
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <%@ include file="/WEB-INF/views/car/menubar.jsp"%>
      <section>
      		<c:forEach items="${list}" var="dto" varStatus="status">
      		<h5></h5>
      		<div class="card mb-3 main">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="${dto.path}" alt="..." class="thumbnail">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h2 class="card-title">${dto.cnseq}</h2>
							<ul>
								<li>별점 평균 : ${rclist[status.index].rating}</li>
							</ul>
							<p class="card-text money">￦ <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</p>
							<a class="btn btn-primary booking" href="/tripnow/car/carpayment.do?seq=${dto.seq}&id=${auth}">예약하기</a>
						</div>
					</div>
				</div>
			</div> 
			
			
		
			<div class="card mb-3 sub">
				
				<h3>전체 옵션 정보</h3>
				<ul>
					<li>${dto.ctvalue}</li>			
				</ul>
				<ul>
					<li>${dto.fvalue}</li>				
				</ul>
				<ul>
					<li>${dto.geartype}</li>
				</ul>
				<ul>
					<li>대여 : ${dto.rentstart}</li>
				</ul>
				<ul>
					<li>반납 : ${dto.rentend}</li>
				</ul>
			</div> 
			</c:forEach>
			<h2 id="mainreview">렌트카 리뷰</h2>
				
				
				<h3 id="reviewstart">리뷰 작성</h3>
				<div id="radiostar">
					<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star5"></span></label>
					<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star4"></span></label>
					<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star3"></span></label>
					<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star2"></span></label>
					<label><input type="radio" name="reviewstarcheck">&nbsp;<span class="star1"></span></label>
				</div>
				<div id="reviewWrite">
					<textarea rows="3" cols="110px"></textarea>
					<a class="btn btn-primary write">작성하기</a>
				</div>
			
			<c:forEach items="${review}" var="dto">
			<form id="editCommentForm">
			<div class="carreview">
				<div>
					<span>작성자 : ${dto.id}</span>
					<span>등록일 : ${dto.regdate}</span>
				</div>
				<div id="reviewall">
					<span class="star${dto.rating}"></span>
				</div>
				<div class="reviewcontent">
					<textarea class="reviewcontent real" readonly>${dto.content}</textarea>
					<c:if test="${not empty auth}">
					<c:if test="${dto.id == auth}">
					<div class="contentox">
						<div class="delete" onclick="delcomment('${auth}')">[삭제]</div>
						<div class="edit first">[수정]</div>
						<div class="delete cancel" style="display:none;">[취소]</div>
						<div class="edit final" style="display:none;" onclick="editcomment()">[완료]</div>
					</div>
					</c:if>
					</c:if>
				</div>
				
				<c:if test="${not empty dto.pcontent}">
				<p><i class="fa-solid fa-angle-down"></i></p>
				
				<div class="reviewcontent master">
					${dto.pcontent}
				</div>
				</c:if>
			</div>
			<input type="hidden" name="id" value="${auth}"/>
			</form>
			</c:forEach>
      </section>
   </main>
      <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   		$(function() {
   			$('.carousel-indicators li:first-child').addClass("active");
   			$('.carousel-inner div:first-child').addClass("active");
   		})

   		$(".write").click(function() {
   			if (${empty auth}) {
   				alert("로그인 전입니다.");
   			} else {
   				alert("${auth}");
   			}
   		});
   		
   		
   
   		
   		$(".booking").click(function(event) {
   			if (${not empty auth}) {
	 			var aaa = event.target + "&dates=" + $(".flatpickr-input").val();;
	 			$(".booking").attr("href", aaa);;
   			} else {
   				var answer = confirm('로그인을 하시겠습니까?');
   					event.preventDefault();
   				
   				if (answer == true) {
					location.href='/tripnow/member/login.do';
				} else {
					location.href='#!';					
				}
   			}
	 	}); 
   		
   		
   		
   		
   		
   		function delcomment(id) {
   			
   			let div = $(event.target).parents('.carreview')
   			
   			if (confirm('댓글을 삭제하시겠습니까?')) {
				$.ajax({
					
					type : 'POST',
					url : '/tripnow/car/delcommentok.do',
					data : 'id=' + id,
					dataType : 'json',
					success : function(result) {
						
						if (result.result == "1") {
							
							div.remove();
							
						} else {
							alert('댓글 삭제 오류!!');
						}
						
					},
					error : function(a,b,c) {
						console.log(a,b,c);
					}
					
				});
   			}
   		}
   		
   		
   		
   		
   		
		function editcomment() {
			
			let edit = ($('.reviewcontent.edit').val());
			
			$.ajax({
				
				type : 'POST',
				url : '/tripnow/car/editcommentok.do',
				data : $('#editCommentForm').serialize(),
				dataType : 'json',
				success : function(result) {
					
					if (result.result == "1") {
						
						$('.reviewcontent.edit').parent().parent().children().first().text(edit);
						
						$('.contentox > .delete').show();
						$('.contentox > .first').show();
						$('.contentox > .cancel').hide();
						$('.contentox > .final').hide();
						
						$('.ediv').remove();
					} else {
						alert('failed');
					}
					
				},
				error : function(a,b,c) {
					console.log(a,b,c);
				}
				
			}); 
			
   		}
   		
		
		$(".first").click(function(event) {
			
			let temp =  '<div class="ediv"><textarea class="reviewcontent edit" name="editComment" style="border:1px,solid,black">' + $('.real').val() + '</textarea></div>';
		      
			
			
			$('.contentox > .delete').hide();
			$('.contentox > .first').hide();
			$('.contentox > .cancel').show();
			$('.contentox > .final').show();
			$(event.target).parent().parent().append(temp);
		});
			
		
		$(".cancel").click(function(event) {
			$('.contentox > .delete').show();
			$('.contentox > .first').show();
			$('.contentox > .cancel').hide();
			$('.contentox > .final').hide();
			$('.ediv').remove();
		});
	
   		
   </script>

</body>
</html>












































