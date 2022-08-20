<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>



.couponListContainer{

/* 	background-color: #999; */
	
	
	word-break:break-all;
	display: flex;
	flex-direction: column;


}

.couponListContainer > div:nth-child(1){
/* 	background-color: #eee; */
	
	width:160px;
	height: 50px;
		
	font-size: 29px;
	margin-top: -7px;
	
	border-bottom: 2px solid gray;
}	

	.couponListContainer > div:nth-child(2){
	
		margin-top : 30px;
		
	}
	

	
	.table.coupon > thead,tbody{
		text-align: center;
		vertical-align: middle;
		font-size: 19px;
		border-top: 2px solid black;
	}

	.table.coupon > thead > tr > th:nth-child(1){
		text-align: center;
		width:330px;
	
	}
	
	.table.coupon > thead > tr > th:nth-child(2){
		text-align: center;
		width:100px;
	
	}
	
	.table.coupon > thead > tr > th:nth-child(3){
		text-align: center;
		width:100px;
	
	}
	
	.table.coupon > thead > tr > th:nth-child(4){
		text-align: center;
		width:130px;
	
	}
	
	body > div > div:nth-child(2) > table > tbody > tr > td.left{
		text-align: left;	
	}
	
	
	.btnGroup{
		
		min-height: 32px;
	    text-align: center;
	    padding-top: 20px;
	    clear: both;
	    position: relative;
		
	}
	
	.selectCoupon{
		display: inline-block;
	    min-width: 100px;
	    height: 40px;
	    line-height: 36px;
	    color: #ffffff;
	    box-sizing: border-box;
	    padding: 2px 8px 0 8px;
	    font-size: 14px;
	    text-align: center;
	    cursor: pointer;
	    vertical-align: middle;
	    
	    border: 1px solid #000000;
   		background-color: #000000;
	}
	
	.couponback{
	
		display: inline-block;
	    min-width: 100px;
	    height: 40px;
	    line-height: 36px;
	    color: #ffffff;
	    box-sizing: border-box;
	    padding: 2px 8px 0 8px;
	    font-size: 14px;
	    text-align: center;
	    cursor: pointer;
	    vertical-align: middle;
	    
	    border: 1px solid #999;
   		background-color: #999;
	}
	
	
	.coupon-info{
		
		margin-top: 45px;
	    padding-top: 10px;
	    position: relative;
	}


</style>
</head>
<body>
	
	<div class="couponListContainer">
		<div>
			COUPON
		</div>
		
		<div>
			<table class="table table-bordered coupon">
				
				<thead>
					<tr>
						<th>쿠폰명</th>
						<th>카테고리</th>
						<th>할인율</th>
						<th>사용기간</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="dto">
				
					<tr>
						<td class="left">
							<input type="radio" name="coupon" class="coupon" value="${dto.eseq}"/>
							<label for="1234">${dto.name}</label>
						</td>
						<td>${dto.value}</td>
						<td>${dto.rate}</td>
						<td>${dto.enddate}</td>
					</tr>
			   </c:forEach>
				</tbody>
			</table>
		</div>
	
			         <div class="btnGroup">
            
            <a class="couponback" onclick="window.close()">취소</a>
            
            <a class="selectCoupon" onClick="checkCoupon()">쿠폰선택</a>
         
         </div>
      
      <ul class="coupon-info">
         <li>쿠폰 적용 시 한 주문, 한 상품에 한해서만 적용됩니다.</li>
         <li>각 쿠폰은 사용기한이 정해져 있습니다.</li>
         <li>쿠폰 적용품목이 한정된 쿠폰은 해당 품목에서만 사용가능 합니다.</li>
         <li>할인/적립(%) 쿠폰은 적립금할인 등을 제외한 실제 결제금액에 적용됩니다.</li>
         <li>해당 상품에 대한 쿠폰은 해당 상품만 구매시 적용이 가능합니다.</li>
      </ul>
   

   </div>
   
   <script>
   



      function checkCoupon() {  
          
         $.ajax({
            
            type: 'POST',
            url: '/tripnow/activity/activitypayment.do',
            data: 'eseq=' + $('.coupon:checked').val(),
            dataType: 'JSON',
            success: function(result) {
                           
            },
            error: function(a,b,c) {
               console.log(a,b,c);
            }
            
         });
            
      };
      
      
      
   </script>

</body>
</html>
















