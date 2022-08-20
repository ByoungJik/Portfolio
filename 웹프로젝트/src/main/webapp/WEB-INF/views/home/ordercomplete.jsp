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

	/* 	메뉴바 */
	
	.paymentContainer{
		
/*  		background-color:#999;  */
		width: 1060px;
		height: 810px;
	}
	
	
 	.paymentBar{
 		width: 1025px;
 		height: 105px;
  		background-color:white; 
 		margin: auto;
 		display: flex;
 		border: 1px solid gray;
 		
 		margin-bottom:25px;
 	}
	
	#pointer {
	  width: 500px;
	  height: 103px;
	  position: relative;
	  background: #eee;
	}
	#triangle-right {
		
	  position: relative;
	  left:-29px;
		
      width: 0;
      height: 103px;
      border-top: 50px solid transparent;
      border-left: 100px solid #eee;
      border-bottom: 50px solid transparent;
    }
 	
 	
 	.paymentBar > div:nth-child(1){
 		width: 500px;
 		height: 105px;
/*  	background-color:cornflowerblue; */
 		
 		
 		
 	}
 	
 	
 	.paymentBar > div:nth-child(2){
 		width: 500px;
 		height: 105px;
 		background-color:white;
 	}
 	
 	#pointer > span{
		
		font-size:27px;
		
		position:relative;
		top:30px;
		left:171px;
	
	}
	
	.paymentBar > span{
		
		font-size:27px;
		
		position:relative;
		top:30px;
		left:94px;
		
	}
 	
 	
	/* 	범위 */	
		
	.orderCompleteContainer{
		
/*   		background-color:beige;    */
		
		width: 1025px;
 		height: 610px;
  		
 		margin: 36px 0 0 18px;

 		display: flex;
 		flex-direction: column;
	
	}
	
	
	.orderCompleteContainer > div:nth-child(1){
	
		padding: 4px 0 0 4px;
	    width: 95px;
	    height: 40px;
	    border-bottom: 1px solid gray;
	    word-break: break-all;
	
	}
	
	.orderCompleteContainer > div:nth-child(1) > p{
	
		font-size: 22px;
	}
	
	/* 	테이블 */
	
	.orderCompleteContainer > div:nth-child(2) {
		
		margin-top:43px;
		margin-bottom:10px;
		
	}
	
	div.orderCompleteContainer > div:nth-child(2) > table > tbody > tr > td:nth-child(1){
		
		background-color:#eee;
		text-align: center;
		vertical-align: middle;
		width:230px;
		height:60px;
		
		font-size: 19px;
		font-weight:500;
	}
	
	div.orderCompleteContainer > div:nth-child(2) > table > tbody > tr > td:nth-child(2){
		
		
		text-align: left;
		vertical-align: middle;
				
		font-size: 19px;
		
	}
	
	/* 	버튼 */
	
	.btns.gohome{
	
		position: relative;
		bottom: -18px;
		left: 302px;
		
		
		background-color: #999;
		width:190px;
		height: 50px;
		color: white;
		
		font-size: 20px;
	}
	
	.btns.orderhistory{
		
		position: relative;
		bottom: 32px;
		left: 521px;
		
		background-color: #60c1f0;
		width:190px;
		height: 50px;
		color: white;
		
		font-size: 20px;
		
	}



</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		
	<div class="paymentBar">
		<div id="pointer">
			<span><i class="fa-solid fa-file-invoice-dollar"></i> 주문/결제</span>
		</div>
		<div id="triangle-right">
		</div>
		<span><i class="fa-solid fa-check-to-slot"></i> 주문완료</span>
	</div>
	<div class="orderCompleteContainer">
		
		<div>
			<p>주문내역</p>
		</div>
		
		<div>
			<table class="table table-bordered ordercomplete">
				<tr>
					<td>주문번호</td>
					<td>
						${seq}
					</td>
				</tr>
				<tr>
					<td>주문자명</td>
					<td>
						${name}
					</td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td>
					<fmt:formatNumber value="${price}" pattern="#,###,###" />
					</td>
				</tr>
				<tr>
					<td>결제방식</td>
					<td>
						무통장 입금
					</td>
				</tr>
				<tr>
					<td>입금주명</td>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<td>입금 계좌번호</td>
					<td>
						[${dto.bank}] ${dto.acnumber}
					</td>
				</tr>
				<tr>
					<td>예약일시</td>
					<td>
						입실 > ${startDate} ${enter}<br>
						퇴실 > ${endDate} ${outer}
					</td>
				</tr>
			</table>
			
		</div>
		
		<div>
			
			<button type="button" class="btns gohome" onclick="location.href='/tripnow/home/main.do' " >메인화면</button>
			
		</div>	
		
		<div>
			
			<button type="button" class="btns orderhistory">주문내역</button>
			
		</div>	
		
	

	</div>

	</main>
	<div class="Afooter">
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<script>
	
	</script>

</body>
</html>
























