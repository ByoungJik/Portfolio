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
	.managebtn {
		float: right;
	}
	
	.fontred {
		color: red;
	}
	
	.thumbnail {
		width: 400px;
		height: 240px;
	}
	
	.card-body {
		margin-left: 150px;
	}
	
	.row.no-gutters {
		border: 1px solid #ffc565;
		margin-top: 20px;
		padding-top: 15px;
	}
	
	hr {
		margin-top: 40px;
		margin-bottom: 40px;
	}
	
</style>
</head>
<body>
   	<main>
    	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
      	<h1 style="margin-left: 40px;">예약 관리</h1>
      	<hr>
      	<h3>숙소</h3>
      
      	<div class="card mb-3">
      
      		<c:forEach items="${hbmlist}" var="hbmlist">
	  		<div class="row no-gutters">
	    		<div class="col-md-4">
	      			<img src="/tripnow/${hbmlist.path}" alt="..." class="thumbnail">
	    		</div>
	    		<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">숙소명: ${hbmlist.homename}</h3>
	        			<p class="card-text">방이름: ${hbmlist.roomname}</p>
	        			<p class="card-text">금액: <fmt:formatNumber value="${hbmlist.price}" pattern="#,###" /> 원</p>
	        			<p class="card-text">예약 일자: ${hbmlist.startdate.substring(0,10)} ~ ${hbmlist.enddate.substring(0,10)}</p>
	        			<p class="card-text">주문자명: ${hbmlist.name}(${hbmlist.id})</p>
	        			<p class="card-text">전화번호: ${hbmlist.tel.substring(0,3)} - ${hbmlist.tel.substring(3,7)} - ${hbmlist.tel.substring(7,11)}</p>
	        			<div class="managebtn">
	        				<c:if test="${hbmlist.bsseq == 1}">
	        				<input type="button" class="btn fontred" value="예약취소" onclick="cancel(${hbmlist.seq});">
	        				<input type="button" class="btn btn-danger" value="예약확정" onclick="confirm(${hbmlist.seq});">
	        				</c:if>
	        				<c:if test="${hbmlist.bsseq == 2}">
	        				<input type="button" class="btn btn-secondary" value="사용예정" style="font-weight: bold;">
	        				</c:if>
	        				<c:if test="${hbmlist.bsseq == 3}">
	        				<input type="button" class="btn btn-primary" value="사용완료" style="font-weight: bold;">
	        				</c:if>
	        				<c:if test="${hbmlist.bsseq == 4}">
	        				<input type="button" class="btn btn-danger" value="취소완료">
	        				</c:if>
	        			</div>
	      			</div>
	    		</div>
	  		 </div>
	  		 </c:forEach>
		</div>
		
		<hr>
		
		<h3>액티비티</h3>
		
		<div class="card mb-3">
      
      		<c:forEach items="${abmlist}" var="abmlist">
	  		<div class="row no-gutters">
	    		<div class="col-md-4">
	      			<img src="${abmlist.path}" alt="..." class="thumbnail">
	    		</div>
	    		<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">액티비티명: ${abmlist.name}</h3>
	        			<p class="card-text">금액: <fmt:formatNumber value="${abmlist.finalprice}" pattern="#,###" /> 원</p>
	        			<p class="card-text">구입 매수: ${abmlist.count} 장</p>
	        			<p class="card-text">주문자명: ${abmlist.username}(${abmlist.id})</p>
	        			<p class="card-text">전화번호: ${abmlist.tel.substring(0,3)} - ${abmlist.tel.substring(3,7)} - ${abmlist.tel.substring(7,11)}</p>
	        			<div class="managebtn">
	        				<c:if test="${abmlist.bsseq == 1}">
	        				<input type="button" class="btn fontred" value="예약취소" onclick="actcancel(${abmlist.seq});">
	        				<input type="button" class="btn btn-danger" value="예약확정" onclick="actconfirm(${abmlist.seq});">
	        				</c:if>
	        				<c:if test="${abmlist.bsseq == 2}">
	        				<input type="button" class="btn btn-primary" value="구매완료" style="font-weight: bold;">
	        				</c:if>
	        				<c:if test="${abmlist.bsseq == 4}">
	        				<input type="button" class="btn btn-danger" value="취소완료">
	        				</c:if>
	        			</div>
	      			</div>
	    		</div>
	  		 </div>
	  		 </c:forEach>
		</div>
		
		<hr>
		
		<h3>렌터카</h3>
		
		<div class="card mb-3">
      
      		<c:forEach items="${cbmlist}" var="cbmlist">
	  		<div class="row no-gutters">
	    		<div class="col-md-4">
	      			<img src="/tripnow/${cbmlist.path}" alt="..." class="thumbnail">
	    		</div>
	    		<div class="col-md-8">
	      			<div class="card-body">
	        			<h3 class="card-title">차량명: ${cbmlist.carname}</h3>
	        			<p class="card-text">금액: <fmt:formatNumber value="${cbmlist.finalprice}" pattern="#,###" /> 원</p>
	        			<p class="card-text">예약 일자: ${cbmlist.startdate.substring(0,10)} ~ ${cbmlist.enddate.substring(0,10)}</p>
	        			<p class="card-text">주문자명: ${cbmlist.name}(${cbmlist.id})</p>
	        			<p class="card-text">전화번호: ${cbmlist.tel.substring(0,3)} - ${cbmlist.tel.substring(3,7)} - ${cbmlist.tel.substring(7,11)}</p>
	        			<div class="managebtn">
	        				<c:if test="${cbmlist.bsseq == 1}">
	        				<input type="button" class="btn fontred" value="예약취소" onclick="carcancel(${cbmlist.seq});">
	        				<input type="button" class="btn btn-danger" value="예약확정" onclick="carconfirm(${cbmlist.seq});">
	        				</c:if>
	        				<c:if test="${cbmlist.bsseq == 2}">
	        				<input type="button" class="btn btn-secondary" value="사용예정" style="font-weight: bold;">
	        				</c:if>
	        				<c:if test="${cbmlist.bsseq == 3}">
	        				<input type="button" class="btn btn-primary" value="사용완료" style="font-weight: bold;">
	        				</c:if>
	        				<c:if test="${cbmlist.bsseq == 4}">
	        				<input type="button" class="btn btn-danger" value="취소완료">
	        				</c:if>
	        			</div>
	      			</div>
	    		</div>
	  		 </div>
	  		 </c:forEach>
		</div>
      
   	</main>
   	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   	<script>
   		function cancel(seq) {
   			location.href="/tripnow/partner/cancelhomebook.do?seq=" + seq;
   		};
   		
   		function confirm(seq) {
   			location.href="/tripnow/partner/confirmhomebook.do?seq=" + seq;
   		};
   		
   		function actcancel(seq) {
   			location.href="/tripnow/partner/cancelactivitybook.do?seq=" + seq;
   		};
   		
   		function actconfirm(seq) {
   			location.href="/tripnow/partner/confirmactivitybook.do?seq=" + seq;
   		};
   		
   		function carcancel(seq) {
   			location.href="/tripnow/partner/cancelcarbook.do?seq=" + seq;
   		};
   		
   		function carconfirm(seq) {
   			location.href="/tripnow/partner/confirmcarbook.do?seq=" + seq;
   		};
   			
   	</script>

</body>
</html>