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
<script src="https://kit.fontawesome.com/404d069474.js" crossorigin="anonymous"></script>
<style>

	main {
		width: 840px;
		margin: 0 auto;
	}
	
	main > h1 {
		padding: 50px 0px;
		border-bottom: 1px solid #CCC;
		text-align: center;
	}
	
	#menu {
		margin-top: 10px;
	}
	
	#top {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 30px;
	}
	
	#choice {
		width: 230px;
		margin: 20px 0px;
	}
	
	#date {
		border: none;
		width: 120px;
		height: 35px;
		text-align: center;
		margin-right: 10px;
	}
	
	
	#contents {
		width: 840px;
		height: auto;
		display: flex;
	}
	
	li.list-group-item {
	    display: flex;
	    justify-content: center;
	    align-items: center;
		width: 140px;
		height: 55px;	
		border: none;
		border-top: 1px dashed #DDD;
	}
	
	li.list-group-item:last-child {
		border-bottom: 1px dashed #DDD;
	}
	
	#main {
		width: 840px;
	}
	
	#btns {
		width: 400px;
	}
	
	#btns ul {
		padding: 0px;
		margin: 0px;
	}
	
	#btns li {
		display: inline;
		font-size: 23px;
		border-right: 3.5px solid #444;
		padding-right: 20px;
		margin-right: 15px;
	}
	
	#btns li:hover {
		cursor: pointer;
	}
	
	#btns li:last-child {
		border: none;
	}
	
	table td:nth-child(2) {
		width: 300px;
	}
	
	table td:last-child {
		width: 180px;
		text-align: right;
	}
	
/* 	table tr:last-child {
		border-bottom: 1px solid #ddd;
	} */
	
	i {
		margin-right: 10px;
	}
	
	.table > tbody > tr > td {
		height: 50px;
		vertical-align: middle;
	}
	
	.selected {
		font-weight: bold;
		color: cornflowerblue;
	}
	
	.hidden {
		display: none;
	}
	
	.table tr:last-child td:last-child {
		font-weight: bold;
		color: #666;
	}
	
	
	

	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>

		
		<h1>매출 현황</h1>
		

      
      
		<div id="contents">
			
			
			<div id="main">
				
				<div id="top">
					<div id="btns">
						<ul>
							<li id="all" class="selected">전체</li>
							<li id="room">숙소</li>
							<li id="car">렌터카</li>
							<li id="act">액티비티</li>
						</ul>
					</div>
					
					<div id="choice">
						<select id="date">
							<c:forEach var="i" begin="0" end="11">
								<c:if test="${i == 11}">
								<option value="0" selected>${dates[11-i]}</option>
								</c:if>
								
								<c:if test="${i != 11}">
								<option value="${-(11-i)}">${dates[11-i]}</option>
								</c:if>
							</c:forEach>
						</select>
				
						<input type="button" class="btn btn-info" value="조회하기" onclick="setmonth()">
					</div>		
				
				</div>
				
				<div id="roombox">
					<h4><i class="fa-solid fa-angle-right"></i>숙소</h4>
					<table class="table" id="roomlist">
						<c:forEach items="${roomlist}" var="dto">
							<c:set var="roomsum" value="${dto.price}" />
							<tr>
								<td>숙소 정보: ${dto.info}</td>
								<td>예약일자: ${dto.date}</td>
								<td>가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" />원</td>
							</tr>
						</c:forEach>
						
						<c:if test="${empty roomlist}">
							<tr>
								<td colspan="3" style="text-align: center; border-bottom: 1px solid #ddd;">판매 내역이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:if test="${not empty roomlist}">
							<tr>
								<td></td>
								<td></td>
								<td>합계: <fmt:formatNumber type="number" maxFractionDigits="3" value="${roomsum}" />원</td>
							</tr>
						</c:if>
					</table>
				</div>
				
				
				<div id="carbox">
					<h4><i class="fa-solid fa-angle-right"></i>렌터카</h4>
					<table class="table" id="carlist">
						<c:forEach items="${carlist}" var="dto">
						<tr>
							<td>차량 정보: ${dto.info}</td>
							<td>예약일자: ${dto.date}</td>
							<td>가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" />원</td>
						</tr>
						</c:forEach>
						<c:if test="${empty carlist}">
						<tr>
							<td colspan="3" style="text-align: center; border-bottom: 1px solid #ddd;">판매 내역이 없습니다.</td>
						</tr>
						</c:if>
						
						<c:if test="${not empty carlist}">
						<tr>
							<td></td>
							<td></td>
							<td>합계: <fmt:formatNumber type="number" maxFractionDigits="3" value="${carsum}" />원</td>
						</tr>
						</c:if>
						
					</table>
				</div>
				
				<div id="actbox">
					<h4><i class="fa-solid fa-angle-right"></i>액티비티</h4>
					<table class="table" id="actlist">
						<c:forEach items="${actlist}" var="dto">
							<tr>
								<td>액티비티 정보: ${dto.info}</td>
								<td>예약일자: ${dto.date}</td>
								<td>가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" />원</td>
							</tr>
						</c:forEach>
							
						<c:if test="${empty actlist}">
						<tr>
							<td colspan="3" style="text-align: center; border-bottom: 1px solid #ddd;">판매 내역이 없습니다.</td>
						</tr>
						</c:if>
						
						<c:if test="${not empty actlist}">
						<tr>
							<td></td>
							<td></td>
							<td>합계: <fmt:formatNumber type="number" maxFractionDigits="3" value="${actsum}" />원</td>
						</tr>
						</c:if>
					</table>
				</div>
			
			
			<h3 style="text-align: right; font-weight: bold; margin: 40px 5px 20px 0px;">총 합계: <fmt:formatNumber type="number" maxFractionDigits="3" value="${roomsum + carsum + actsum}" />원</h3>
			</div>
				
      	</div>
      	
      	
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   		function setmonth() {
   			
			location.href = '/tripnow/partner/sales.do?smonth=' + $('#date').val();
   			
   		}
   		
   		
   		for (i=0 ; i<$('#date option').length ; i++) {
   			if ($('#date option')[i].value == ${selected}) {
   				
   				$('#date option')[i].setAttribute('selected', 'selected');
   				
   			}
   		}
   
   		/* #all #room #car #act */
   		
   		$('#all').on('click', function() {
   			
   			$('#all').addClass('selected');
   			$('#room').removeClass('selected');
   			$('#car').removeClass('selected');
   			$('#act').removeClass('selected');
   			$('#roombox').removeClass('hidden');
   			$('#carbox').removeClass('hidden');
   			$('#actbox').removeClass('hidden');
   			$('#contents h3').removeClass('hidden');
   			
   		});

   		$('#room').on('click', function() {
   			
   			$('#room').addClass('selected');
   			$('#all').removeClass('selected');
   			$('#car').removeClass('selected');
   			$('#act').removeClass('selected');
   			$('#roombox').removeClass('hidden');
   			$('#carbox').addClass('hidden');
   			$('#actbox').addClass('hidden');   			
   			$('#contents h3').addClass('hidden');
   			
   		});
   		
   		$('#car').on('click', function() {
   			
   			$('#car').addClass('selected');
   			$('#all').removeClass('selected');
   			$('#room').removeClass('selected');
   			$('#act').removeClass('selected');
   			$('#roombox').addClass('hidden');
   			$('#carbox').removeClass('hidden');
   			$('#actbox').addClass('hidden');   			
   			$('#contents h3').addClass('hidden');
   			
   		});
   		
   		$('#act').on('click', function() {
   			
   			$('#act').addClass('selected');
   			$('#all').removeClass('selected');
   			$('#room').removeClass('selected');
   			$('#car').removeClass('selected');
   			$('#roombox').addClass('hidden');
   			$('#carbox').addClass('hidden');
   			$('#actbox').removeClass('hidden');   			
   			$('#contents h3').addClass('hidden');
   			
   		});
   		
   		
   
   </script>

</body>
</html>