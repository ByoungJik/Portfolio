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

   #title {
      width: 370px;
      height: 50px;
      margin: 20px auto;
      display: flex;
   }
   
   #icon {
      background-image: url("/tripnow/images/info.png");
      margin-top: 20px;
      width: 40px;
      height: 40px;
      background-size: contain;
      background-repeat: no-repeat;
   }
   

   input[type='radio']:checked {
        accent-color: #777;
   }
   
   
   .red {
      color: tomato;   
   }
   
   .blue {
      color: cornflowerblue;
   }
   
   .hidden {
      display: none;
   }
   

   #editform {
      width: 800px;
      height: 750px;
      margin: 30px auto;
      padding-top: 30px;
      border-top: 1px solid #CCC;
      border-bottom: 1px solid #CCC;
   }
   
   #table.table {
      width: 750px;         
      margin: 30px auto;
   }
   
   #table th, #table td {
      border: none;
      height: 50px;
   }
   
   #table .subtext {
      font-size: 13px;
      font-weight: normal;
   }
   
   #table .maintext {
      margin-bottom: 2px;
   }
   
   #table th {
      width: 220px;
   }
   
   #table tr > td {
      width: 380px;
   }
   
   #table td:last-child {
      width: 150px;
      text-align: right;
   }
   
   .short {
      width: 80px;
   }
   
   .middle {
      width: 120px;
   }
   
   .long {
      width: 210px;
   }
   
   #table tr:first-child {
      margin-top: 20px;
   }
   
   #editform .readonly {
      border: none;
   }

   
   td input[type=text], td input[type=password] {
      height: 30px;
      outline: none;
      padding-left: 5px;
      border: 1px solid #CCC;
   }
   input[type=text] {
      outline: none;
      border: 1px solid #CCC;
   }
   
   .btns {
      float: right;
   }
   
   .btns input {
      margin-left: 10px;
   }
   
   td label {
      margin-right: 15px;
   }
   
   td select {
      height: 30px;
   }
   
   #table .msg {
      border: none;
   }
</style>
</head>
<body>
   <!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <section>
      
           <div id="title"><div id="icon"></div><h1>&nbsp;회원 정보 확인 및 수정</h1></div>

        <form id="editform" autocomplete="off">

         <table id="table" class="table">
            <tr>
               <th>아이디</th>
               <td><input type=text class="readonly" name="id" id="id" value="${dto.id}"></td>
               <td></td>
            </tr>
            
            <tr>
               <th>비밀번호</th>
               <td></td>
               <td><input type="button" value="수정" class="btn btn-warning" id="editpw" onclick="enablepw()"></td>
            </tr>
               <tr>
                  <th><p class="maintext">새 비밀번호</p><p class="subtext">영문, 숫자, 특수문자 조합 6~20자</p></th>
                  <td>
                     <input type="password" name="newpw" class="middle" id="newpw" disabled maxlength="20">
                     <input type="text" class="msg blue long hidden" id="pwmsg" value="비밀번호를 6자 이상 입력해 주세요." readonly>
                  </td>
                  <td></td>
               </tr>
               <tr>
                  <th>비밀번호 확인</th>
                  <td>
                     <input type="password" class="middle" id="newpwconfirm" disabled maxlength="20">
                     <input type="text" class="msg blue long hidden" id="confirmmsg" value="비밀번호를 확인해 주세요." readonly>
                  </td>
                  <td><input type="button" value="확인" class="btn btn-secondary" id="btnpw" disabled></td>
               </tr>
            <tr>
               <th><p class="maintext">이름</p><p class="subtext">한글 2~5자</p></th>
               <td><input type="text" name="name" class="textbox short" value="${dto.name}" id="name" maxlength="5" disabled></td>
               <td><input type="button" value="수정" class="btn btn-warning" id="editname" onclick="fneditname()"></td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td><input type="text" class="short" name="tel1" id="tel1" value="${dto.tel1}" maxlength="3" disabled> - 
               <input type="text" class="short" name="tel2" id="tel2" value="${dto.tel2}" maxlength="4" disabled> - 
               <input type="text" class="short" name="tel3" id="tel3" value="${dto.tel3}" maxlength="4" disabled></td>
               <td><input type="button" value="수정" class="btn btn-warning" id="edittel" onclick="fnedittel()"></td>
            </tr>
         
            <tr>
               <th>생년월일</th>
               <td><input type="text" value="${dto.birth}" class="readonly" readonly></td>
               <td></td>
            </tr>
            
            <tr>
               <th>성별</th>
               <td>
                  <c:if test="${dto.gender == '남'}">
                  <label><input type="radio" name="gender" value="남" checked onclick="return(false);">  남자</label>
                  <label><input type="radio" name="gender" value="여" onclick="return(false);">  여자</label>
                  </c:if>
                  <c:if test="${dto.gender == '여'}">
                  <label><input type="radio" name="gender" value="남" onclick="return(false);">  남자</label>
                  <label><input type="radio" name="gender" value="여" checked onclick="return(false);">  여자</label>
                  </c:if>
               </td>
               <td></td>
            </tr>
            
            <tr>
               <th>이메일</th>
               <td><input type="text" value="${dto.email}" id="oldemail" name="email" disabled></td>
               <td><input type="button" value="수정" class="btn btn-warning" id="editemail" onclick="fneditemail()"></td>
            </tr>
            
            <tr>
               <th>변경할 이메일</th>
               <td>
                  <input type="text" id="email1" class="middle" disabled>&nbsp;@&nbsp; 
                  <input type="text" id="email2" class="middle" disabled>
                     <select id="email3" disabled>
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="gmail.com">gmail.com</option>
                     </select>
               </td>
               <td><input type="button" value="인증 메일 발송" class="btn btn-secondary" id="sendemail" onclick="fnsendemail()" disabled></td>
            </tr>
            
            <tr>
               <th>인증코드</th>
               <td>
               <input type="text" id="code" disabled maxlength="5">
                  <input type="text" class="hidden blue msg" id="codemsg" value="인증 번호를 확인해 주세요." readonly>
               </td>
               <td><input type="button" value="확인" class="btn btn-secondary" id="btncode" disabled onclick="fnconfirmcode()"></td>
            </tr>
            
         </table>
           
           <div class="btns">
           <input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='/tripnow/mypage/mypagemain.do'">
           <input type="button" value="저장하기" class="btn btn-primary" id="submit">
           </div>
        </form>
         
         
      </section>
   </main>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
         function enablepw() {
            
            if ($('#editpw').val() == '수정') {
               $('#editpw').val('취소');
               $('#editpw').removeClass('btn-warning');
               $('#editpw').addClass('btn-danger');
               $('#newpw').attr('disabled', false);
               $('#newpwconfirm').attr('disabled', false);
               $('#btnpw').attr('disabled', false);
               
            } else {
               $('#editpw').val('수정');
               $('#editpw').removeClass('btn-danger');
               $('#editpw').addClass('btn-warning');
               $('#newpw').val('');
               $('#newpwconfirm').val('');
               $('#newpw').attr('disabled', true);
               $('#newpwconfirm').attr('disabled', true);
               $('#btnpw').attr('disabled', true);
               $('#confirmmsg').addClass('hidden');
               $('#pwmsg').addClass('blue');
               $('#pwmsg').removeClass('red');
               $('#confirmmsg').addClass('blue');
               $('#confirmmsg').removeClass('red');
               $('#pwmsg').addClass('hidden');
            }
         }
   
         
      $('#newpwconfirm').on('keyup', pwconfirm);
      $('#newpw').on('keyup', pwconfirm); 
      
      function pwconfirm() {          
            
         if ($('#newpw').val() != $('#newpwconfirm').val()) {
               
            $('#confirmmsg').removeClass('hidden');
               $('#confirmmsg').val('비밀번호를 확인해 주세요.');
               $('#confirmmsg').removeClass('blue');
               $('#confirmmsg').addClass('red');
               
            } else {
               
               $('#confirmmsg').val('비밀번호가 확인되었습니다.');
               $('#confirmmsg').removeClass('red');
               $('#confirmmsg').addClass('blue');
 
            }
            
            if ($('#newpw').val() == '' && $('#newpwconfirm').val() == '') {
               $('#confirmmsg').addClass('hidden');
            }
            
            
            if ($('#newpw').val().length < 6) {
            
               $('#pwmsg').removeClass('hidden');
               $('#pwmsg').removeClass('blue');
               $('#pwmsg').addClass('red');
               
            } else {
               
               $('#pwmsg').addClass('hidden');
               $('#pwmsg').removeClass('red');
               $('#pwmsg').addClass('blue');
               
            }
            
            
         };
         
         
         
         $('#btnpw').click(function() {
            
            if ($('#confirmmsg').hasClass('blue') && $('#pwmsg').hasClass('blue')) {
               $('#editpw').removeClass('btn-danger');
               $('#editpw').addClass('btn-warning');
               $('#editpw').val('수정');
               $('#btnpw').attr('disabled', true);
               $('#newpw').attr('disabled', true);
               $('#newpwconfirm').attr('disabled', true);
               $('#confirmmsg').addClass('hidden');
               $('#pwmsg').addClass('hidden');
                  
            } else {
               
               alert('비밀번호 형식 및 확인란을 다시 확인해 주세요.');
               
            }
            
         });
         
         
         function fneditname() {
            
            
            if ($('#editname').val() == '수정') {
               $('#editname').val('확인');
               $('#editname').removeClass('btn-warning');
               $('#editname').addClass('btn-info');
               $('#name').attr('disabled', false);               
            } else {
               
               if ($('#name').val().length >= 2) {
                  $('#editname').val('수정');
                  $('#editname').removeClass('btn-info');
                  $('#editname').addClass('btn-warning');
                  $('#name').attr('disabled', true);                                 
               
               } else {
                  alert('이름 형식을 다시 확인해 주세요.');
                  
               }
               
            }
            
         };
         
         
         function fnedittel() {
            
            if ($('#edittel').val() == '수정') {
               $('#edittel').val('확인');
               $('#edittel').removeClass('btn-warning');
               $('#edittel').addClass('btn-info');
               $('#tel1').attr('disabled', false);               
               $('#tel2').attr('disabled', false);               
               $('#tel3').attr('disabled', false);               
            } else {

               $('#edittel').val('수정');
               $('#edittel').removeClass('btn-info');
               $('#edittel').addClass('btn-warning');
               $('#tel1').attr('disabled', true);                                 
               $('#tel2').attr('disabled', true);                                 
               $('#tel3').attr('disabled', true);
               
            }
         };
         
         
         function fneditemail() {
            
            if ($('#editemail').val() == '수정') {
               
               $('#editemail').val('취소');
               $('#editemail').removeClass('btn-warning');
               $('#editemail').addClass('btn-danger');
               $('#code').val('');
               $('#codemsg').val('인증 번호를 확인해 주세요.');
               $('#codemsg').addClass('red');
               $('#codemsg').removeClass('blue');
               $('#codemsg').addClass('hidden');
               $('#email1').val('');
               $('#email2').val('');
               $('#email3').val('');
               $('#email1').attr('disabled', false);
               $('#email2').attr('disabled', false);
               $('#email3').attr('disabled', false);
               $('#sendemail').attr('disabled', false);
               
            } else {

               $('#oldemail').val('${dto.email}');
               $('#editemail').val('수정');
               $('#editemail').removeClass('btn-danger');
               $('#editemail').addClass('btn-warning');
               $('#sendemail').attr('disabled', true);
               $('#email1').val('');
               $('#email2').val('');
               $('#email3').val('');
               $('#email1').attr('disabled', true);
               $('#email2').attr('disabled', true);
               $('#email3').attr('disabled', true);
               $('#code').val('');
               $('#code').attr('disabled', true);
               $('#btncode').attr('disabled', true);
               $('#codemsg').val('인증 번호를 확인해 주세요.');
               $('#codemsg').removeClass('red');
               $('#codemsg').addClass('blue');
               $('#codemsg').addClass('hidden');
            
            }
            
         };
         
         $('#email3').change(function() {
               
            $('#email2').val($('#email3').val());
            
         });
         
         
         
       let code;
         let email;
         function fnsendemail() {
            
            if ($('#email1').val() == '' || $('#email2').val() == '') {
               
               alert('변경할 이메일을 입력해 주세요.');
               
            } else {
               
               $.ajax({
               
               type: 'POST',
               url: '/tripnow/member/emailcheck.do',
               data: 'email1=' + $('#email1').val() + '&email2=' + $('#email2').val(),
               dataType: 'json',
               success: function(result) {

                  code = result.code;
                  email = result.email;
                     $('#sendmail').val('재발송');
                     $('#code').attr('disabled', false);
                     $('#btncode').attr('disabled', false);
                     $('#codemsg').removeClass('hidden');
                     

               },
               error: function(a,b,c) {
                  console.log(a,b,c);
               }
               
            });
 
            }
            
            
         };
         
         
         function fnconfirmcode() {
            
            if ($('#code').val() == code) {
               

               $('#codemsg').val('인증 번호가 확인되었습니다.');
               $('#codemsg').removeClass('red');
               $('#codemsg').addClass('blue');
               
               $('#editemail').val('수정');
               $('#editemail').removeClass('btn-danger');
               $('#editemail').addClass('btn-warning');
               
               $('#sendemail').attr('disabled', true);
               $('#oldemail').val(email);
               $('#email1').attr('disabled', true);
               $('#email2').attr('disabled', true);
               $('#email3').attr('disabled', true);
               $('#code').attr('disabled', true);
               $('#btncode').attr('disabled', true);
               
               
            } else {
               
               $('#codemsg').val('인증 번호가 올바르지 않습니다.');
               $('#codemsg').addClass('red');
               $('#codemsg').removeClass('blue');
            }
            
            
         };
         

         
         
         $('#submit').on('click', function() {
            
            if ($('#pwmsg').hasClass('blue') && $('#confirmmsg').hasClass('blue') && $('#codemsg').hasClass('blue')) {
               
               $.ajax({
               
               type: 'POST',
               url: '/tripnow/mypage/editinfook.do',
               data: 'id=' + $('#id').val() + '&newpw=' + $('#newpw').val() + '&name=' + $('#name').val() + '&tel1=' + $('#tel1').val() + '&tel2=' + $('#tel2').val() + '&tel3=' + $('#tel3').val() + '&email=' + $('#oldemail').val(), 
               dataType: 'json',
               success: function(result) {
                  if (result.result == 1) {
                     
                     alert('회원 정보가 수정되었습니다.');
                     location.reload();
                     
                  } else {                  
                     
                     alert('회원 정보 수정에 실패했습니다. 관리자에게 문의 바랍니다.');
                     history.back();
   
                  }
               },
               error: function(a,b,c) {
                  console.log(a,b,c);
               }
               
            });
               
            } else {
               
               alert('수정하실 정보를 확인해 주세요.');
            }
            
         });
   </script>

</body>
</html>