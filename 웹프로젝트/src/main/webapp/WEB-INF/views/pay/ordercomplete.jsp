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

   /*    메뉴바 */
   
   .paymentContainer{
      
/*       background-color:#999;   */
      width: 1060px;
      height: 986px;
   }
   
   
    .paymentBar{
       width: 1025px;
       height: 105px;
        background-color:#eee; 
       margin: auto;
       display: flex;
       border: 1px solid gray;
       
       margin-bottom:25px;
    }
   
   #pointer {
     width: 500px;
     height: 103px;
     position: relative;
     background: white;
   }
   #triangle-right {
      
     position: relative;
     left:-29px;
      
      width: 0;
      height: 103px;
      border-top: 50px solid transparent;
      border-left: 100px solid white;
      border-bottom: 50px solid transparent;
    }
    
    
    .paymentBar > div:nth-child(1){
       width: 500px;
       height: 105px;
/*     background-color:cornflowerblue; */
       
       
       
    }
    
    
    .paymentBar > div:nth-child(2){
       width: 500px;
       height: 105px;
       background-color:#eee;
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
    
    
   /*    범위 */   
      
   .paymentTableContainer{
      
/*        background-color:beige;   */
      
      width: 1025px;
       height: 855px;
        
       margin: 0 0 0 18px;

       display: flex;
       flex-direction: column;
   
   }
   .paymentTableContainer > div {
   
      margin-left: 10px;
   }
   
   .paymentTableContainer > div:nth-child(1) {
      padding: 4px 0 0 4px; 
      width: 95px;
      height:40px;
      border-bottom: 1px solid gray;
      word-break:break-all;
   }
   
   .paymentTableContainer > div:nth-child(1) > p {
      
      font-size: 22px;
      
   }
   
   .paymentTableContainer > div:nth-child(3) {
      padding: 4px 0 0 4px; 
      width: 100px;
      height:40px;
      border-bottom: 1px solid gray;
      word-break:break-all;
   }
   
   .paymentTableContainer > div:nth-child(3) > p {
      
      font-size: 21px;
      
   }
   /*             주문상품  */

   
   .paymentTable{
      
      width: 1000px;
       height: 230px;
       
/*        background-color: white; */
       
   }
   .table.payment {
      
      margin-top:20px;
      width: 1000px;
       height: 180px;
       
       border-top: 2px solid gray;
   } 
    

    
    div.paymentTable > table > tbody > tr:nth-child(1) > th{
       text-align: center;
       height: 40px;
    }
    

   
   div.paymentTable > table > tbody > tr:nth-child(1) > th:nth-child(1){
      width:100px;
   }
   
   div.paymentTable > table > tbody > tr:nth-child(2) > td:nth-child(1){
      width:100px;
   }
   
   div.paymentTable > table > tbody > tr:nth-child(1){
      
      background-color: #EEE;
   
   }

/*       주문자 정보 */
   
   
   .userInfoTableContainer{
      width: 680px;
       height: 178px;
       
       margin-top:22px;
       
/*        background-color: cornflowerblue; */
      
      
   }
   
   .table.userInfo {
      border-top: 2px solid gray;
   }
   
   .table.userInfo > tbody > tr:nth-child(1){
      height: 65px;
   }
   
   .table.userInfo > tbody > tr:nth-child(2){
      height: 60px;
   }
   .table.userInfo > tbody > tr:nth-child(3){
      height: 60px;
   }

   
   .table.userInfo > tbody > tr > td:nth-child(1){
      width:150px;
      
      text-align: center;
      vertical-align: middle;
      font-size: 15px;
      font-weight: 500;
      
      background-color: #EEE;
      
   }
   
   .table.userInfo > tbody > tr > td:nth-child(2){
   
      
      vertical-align: middle;
      
   
   }
   
   /*    택스트 */
   
   .paymentName{
      
      margin-left:7px;
      
      width:  215px;
      height: 34px;
      
      
      }
      
   
   .paymentNum1, .paymentNum2, .paymentNum3 {
      
      margin: 0  9px 0 8px;
      
      width:  70px;
      height: 30px;
      
   }
   
   .paymentEmail1, .paymentEmail2 {
      margin: 0  6px 0 7px;
      
      width:  90px;
      height: 30px;
   }
   
   .selectEmail{
      margin: 0  6px 0 6px;
      width:  100px;
      height: 30px;
   }
   
   
   /*    결제 */
   
   .paymentConfirmContainer{
      
      position: relative;
      bottom:201px;
      left: 698px;
      
      width: 285px;
       height: 230px;
       
       margin-top:22px;
       
/*        background-color: skyblue; */
       
       border: 4px solid black;
       
       display:flex;
       flex-direction: column;
   
   }
   
   
   .paymentConfirmContainer >div {
      
      word-break:break-all;
   
   }
   
   .paymentConfirmContainer > div:nth-child(1){
      
      width:230px;
      height:42px;
      margin: auto;
      padding-top: 3px;
      
      
      
      border-bottom: 3px solid black;

   }
   
   .paymentConfirmContainer > div:nth-child(1) > p {
      font-size: 21px;
      font-weight: 600;
      text-align: center;
      
      
      
      
   }
   
   .paymentConfirmContainer > div:nth-child(2){
      
      width:230px;
      height:70px;
      margin: auto;
      
      
/*       background-color: yellowgreen; */

   }
   
   .paymentConfirmContainer > div:nth-child(2) {
   
      font-size: 17px;
      font-weight: 400;
      

   }
   
   .paymentConfirmContainer > div:nth-child(2) > div{
      width:230px;
      margin-top:6px;
   }
   
   .paymentConfirmContainer > div:nth-child(2) > #price {
      
      float: right;
   }
   
   .paymentConfirmContainer > div:nth-child(2) > div > #price {
      
      float: right;
   }
   
   
   .paymentConfirmContainer > div:nth-child(3){
   
      height:87px;
      background-color: #eee;

   }
   
   .paymentConfirmContainer > div:nth-child(3) > #info{
      
      margin-top: 13px;
      margin-left: 22px;
      font-size: 17px;
      font-weight: 500;
      
   }
   
   .paymentConfirmContainer > div:nth-child(3) > #price{
      
      float: right;
      margin-right: 25px;
      
      font-size: 29px;
      font-weight: 600;
      color:rgb(195,38,38);
      
      
   }
   
   .paymentConfirmContainer > div:nth-child(3) > #price > span{
   
      font-size: 20px;
   }
   
   
   /*    결제 버튼 */
   
   
   
   .paymentButton{
      
      position: relative;
         bottom: 187px;
       left: 698px;
   }
   
   .btns.payment{
      
      
      background-color: black;
      width:285px;
      height: 70px;
      color: white;
      
      font-size: 20px;
      
   }
   
   /*    결제정보/할인 */
   
   div.paymentTableContainer > div:nth-child(7){
      
      position: relative;
       top: -223px;
       padding: 4px 0 0 4px;
       width: 138px;
       height: 40px;
       border-bottom: 1px solid gray;
       word-break: break-all;
      
   }
   
   div.paymentTableContainer > div:nth-child(7) > p {
   
      font-size: 21px;
   }
   
   
   .table.checkPayment{
      
      position: relative;
         bottom: 186px;
         margin:auto;
         width:1000px;
         
   
   }
   

</style>
</head>
<body>
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <div class="paymentContainer">
   
   <div class="paymentBar">
      
      <div id="pointer">
         <span><i class="fa-solid fa-file-invoice-dollar"></i> 주문/결제</span>
      </div>
      
      <div id="triangle-right">
      </div>
      
      <span><i class="fa-solid fa-check-to-slot"></i> 주문완료</span>
      

   </div>
   
   <div class="paymentTableContainer">
   
      <div>
         <p>주문상품</p>
      </div>
      
      <div class="paymentTable">
         <table class="table table-bordered payment">
         
         <tr>
            <th>상품번호</th>
            <th colspan = '2' style="width:350px;">상품</th>
            <th>판매자</th>
            <th>수량</th>
            <th>상품금액</th>   
         </tr>
         
         <tr>
            <td style="text-align: center; vertical-align: middle;">상품번호</td>
            <td style="width:139px;">사진</td>
            <td style="vertical-align: middle;">상품 정보</td>
            <td style="text-align: center; vertical-align: middle;">판매자</td>
            <td style="text-align: center; vertical-align: middle;">수량</td>   
            <td style="text-align: center; vertical-align: middle;">상품 금액</td>   
         </tr>

         </table>         
      </div>
      
      
      <div>
         <p>주문자정보</p>
      </div>
      
      <div class="userInfoTableContainer">
         <table class="table table-bordered userInfo">
            <tr>
               <td>주문하시는분</td>
               <td>
                  <input type="text" class="paymentName" />
               </td>
            </tr>
            <tr>
               <td>휴대폰</td>
               <td>
                  <input type="text" class="paymentNum1" /> - 
                  <input type="text" class="paymentNum2" /> -
                  <input type="text" class="paymentNum3" />
               </td>
            </tr>
            <tr>
               <td>이메일</td>
               <td>
                  <input type="text" class="paymentEmail1" /> @
                  <input type="text" class="paymentEmail2" />
                  <select class="selectEmail" >
                     <option value="" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;직접 입력</option>
                      <option value="naver.com">naver.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="gmail.com">apple.com</option>
                      <option value="gmail.com">hanmail.com</option>
                  </select>
               </td>
            </tr>
         
         </table>
      </div>
      
      
      <div class="paymentConfirmContainer">
         <div>
            <p>최종 결제금액</p>
         </div>
         <div>
            
            <span>총 상품금액</span>  <span id="price" >6,000원</span><br>
            <div><span>할인</span> <span id="price">-1,000원</span></div>
         </div>
         <div>
            <div id="info">총 결제 금액</div>
            <div id="price">5,000 <span>원</span></div>                        
         </div>
      </div>
         
      
      <div class="paymentButton">
         <form action="">
            <button type="submit" class="btns payment">결제하기</button>
            <!-- 히든에 정보넣어서 submit -->
         </form>
      </div>
      
      
      <div>
         <p>결제정보/할인</p>      
      </div>
      
      <table class="table table-bordered userInfo checkPayment ">
            <tr>
               <td>결제 방법 선택</td>
               <td>
                  <input type="checkbox" name = "paytype" value="무통장 입금"/>무통장 입금&nbsp;
                  <input type="checkbox" name = "paytype" value="카카오페이" />카카오페이
               </td>
            </tr>
            <tr>
               <td>쿠폰 선택</td>
               <td>
                  <input type="button" class="btn couponButton" value="쿠폰" />
               </td>
            </tr>
                           
      </table>
      
      
      
   </div>

   </div>
   

   </main>
   <div class="Afooter">
      <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   </div>
   <script>
      $('.selectEmail').change(function() {
            
            $('.paymentEmail2').val($('.selectEmail').val());
            
         });
   </script>

</body>
</html>
