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
	
	#title p {
		font-size: 36px;
		text-align: center;
	}
	
	#title #icon {
		background-image: url('/tripnow/images/booklist.png');
		width: 52px;
		height: 52px;
		background-repeat: no-repeat;
		background-size: contain;
	}
	
	#title {
		width: 840px;
		display: flex;
		justify-content: center;
		padding: 20px 0px 30px 0px;
		margin: 0 auto;
		border-bottom: 1px solid #CCC;
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
	
	.state input {
		margin-right : 4px;
		margin-top : -6px;
	}
	
	h3 {
		text-align: center;
	}
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      
      <div id="title"><div id="icon"></div><p>&nbsp;카테고리별 내 상품 등록여부</p></div>
      
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
				        <h5 class="card-title">${dto.homename}<small>${dto.roomname}</small></h5>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;체크인: ${dto.rentstart}, 체크아웃: ${dto.rentend}</small></p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;&nbsp;위치 정보: ${dto.location}</small></p>
				        
				        <div class="card-bottom">
					        <div class="price">
					        <p class="card-text context"><small class="text-muted">주문금액</small></p>
					        <p class="card-text won">￦ ${dto.price}</p>
					        </div>
					        
					        <div class="state">
					        	<h3>${dto.rseq}</h3>
					        	<c:if test="${dto.rseq == '진행중'}">
					        	<span><input type="button" value="삭제" class="btn btn-danger del-home" onclick="del(${dto.seq}, 'home')"/></span>
					        	<span><input type="button" value="수정" class="btn btn-primary edit-home" onclick="edit(${dto.seq}, 'home')"/></span>
					        	</c:if>
			        		</div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				
			</c:forEach>
		</c:if>
		
		<c:if test="${empty homeList}">
			<h3 class="none">숙소 등록 내역이 없습니다.</h3>
		</c:if>
      </div>
		
		
      <h2>액티비티</h2>
      <div class="items actlist">
      
      <c:if test="${not empty actList}">  
	      	<c:forEach items="${actList}" var="dto">
	      		<div class="card mb-3 item home">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <img src="${dto.pic}" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">${dto.name}</h5>
				        <p class="card-text"><small class="text-muted"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;만료 기한</span>&nbsp;&nbsp;${dto.period}</small></p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;&nbsp;위치 정보: ${dto.location}</small></p>
				        
				        <div class="card-bottom">
					        <div class="price">
					        <p class="card-text context"><small class="text-muted">주문금액</small></p>
					        <p class="card-text won">￦ ${dto.price}</p>
					        </div>
					        
					        <div class="state">
					        	<h3>${dto.rseq}</h3>
					        	<c:if test="${dto.rseq == '진행중'}">
					        	<span><input type="button" value="삭제" class="btn btn-danger del-act" onclick="del(${dto.seq}, 'act')"/></span>
					        	<span><input type="button" value="수정" class="btn btn-primary edit-act" onclick="edit(${dto.seq}, 'act')"/></span>
					        	</c:if>
			        		</div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				
			</c:forEach>
		</c:if>
     
 		<c:if test="${empty actList}">
			<h3 class="none">액티비티 등록 내역이 없습니다.</h3>
		</c:if>
      </div>
      
      
      <h2>렌터카</h2>
      <div class="items carlist">
      
          	<c:if test="${not empty carList}">  
	      	<c:forEach items="${carList}" var="dto">
	      		<div class="card mb-3 item home">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <img src="${dto.pic}" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">${dto.carname}</h5>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;대여 시각: ${dto.rentstart}, 반납 시각: ${dto.rentend}</small></p>
				        <p class="card-text context"><small class="text-muted"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;&nbsp;위치 정보: ${dto.location}</small></p>
				        
				        <div class="card-bottom">
					        <div class="price">
					        <p class="card-text context"><small class="text-muted">주문금액</small></p>
					        <p class="card-text won">￦ ${dto.price}</p>
					        </div>
					        
					        <div class="state">
					        	<h3>${dto.rseq}</h3>
					        	<c:if test="${dto.rseq == '진행중'}">
					        	<span><input type="button" value="삭제" class="btn btn-danger del-car" onclick="del(${dto.seq}, 'car')"/></span>
					        	<span><input type="button" value="수정" class="btn btn-primary edit-car" onclick="edit(${dto.seq}, 'car')"/></span>
					        	</c:if>
			        		</div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				
			</c:forEach>
		</c:if>
      
      
      	<c:if test="${empty carList}">
      		<h3 class="none">렌터카 등록 내역이 없습니다.</h3>
      	</c:if>
      </div>
 		
		
		
      </div>
      
      
      
    </main>
   	    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   	    
    <script>
   		
    	function del(seq, category) {
    		let tr = $(event.target).parent().parent().parent().parent().parent().parent();
    		
    		if (confirm('정말 삭제하시겠습니까?')) {
    			$.ajax({
    				type: 'POST',
    				url : '/tripnow/partner/del' + category + 'ok.do',
    				data: 'seq=' + seq,
    				dataType: 'json',
    				success : function(result) {
    					if (result.result == "1") {
    						tr.remove();
    						alert('상품 삭제 완료!!')
    					} else {
    						alert('상품 삭제 오류!!');
    					}
    				},
    				error : function(a,b,c) {
    					console.log(a,b,c);
    				}
    			});
    		}
    	}
    	
    	function edit(seq, category) {
    		location.href= '/tripnow/partner/edit' + category + '.do?seq=' + seq;
    	}
		
    </script>

</body>
</html>

















