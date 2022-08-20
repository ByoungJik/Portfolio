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
		margin-top: 70px;
		font-size: 30px;
	}
	
	#findbox {
		width: 1060px;
		margin: 20px auto;
		display: flex;
		justify-content: space-evenly;
/* 		border-top: 1px solid #DDD; */
	}
	
	#findid .text, #findid .text p {
		margin-right: 15px;
		width: 50px;
	}
	
	#findid, #findid .content, #findid .inputbox {
		width: 280px;	
	}
	
	#findbox h1 {
		font-size: 25px;
		margin-bottom: 20px;
	}
	
	#findbox h3 {
		font-size: 13px;
	}

	#findbox h3, .inputbox input {
		margin-bottom: 25px;
	}
	
	#findid h3 {
		margin-bottom: 40px;
	}
	
	#findid .content {
		margin-bottom: 35px;
	}
	
	#findbox p {
		margin-right: 20px;
		margin-bottom: 30px;
		font-weight: bold;
	}
	
	.btn.btn-info {
		float: right;
	}
	
	
	#findid, #findpw {
		margin-top: 60px;
		margin-bottom: 80px;
	
	}
	
	#findpw, #findpw .content{
		width: 400px;
	}

	
	.content {
		display: flex;
		
	}
	
	.inputbox {
		width: 150px;
		height: 50px;
	}
	
	#findpw .inputbox {
		width: 330px;
	}
	
	.inputbox input {
		border: 1px solid #CCC;
		outline: none;
	}
	
	#line {
		width: 1px;
		height: 330px;
		background-color: #DDD;
		margin-top: 40px;
	}
	
	input:disabled {
		background-color: #EEE;
	}
	
	#sendmail {
		display: inline;
		margin-right: 10px;
	}
	
	.short {
		width: 48px;
	}
	
	.middle {
		width: 100px;
	}
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      
      <h1 id="title"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;&nbsp;아이디 | 비밀번호 찾기</h1>
      <div id="findbox">
	     <div id="findid">
	     	<h1>아이디 찾기</h1>
	     	<h3>회원가입 시 등록한 이름, 전화번호를 입력해 주세요.</h3>
	     	<form id="leftform" method="GET" onsubmit="return findid()" autocomplete="off">
	     	<div class="content">
	     	
		     	<div class="text">
		     		<p>이름</p>
		     		<p>전화번호</p>
		     	</div>
		     	<div class="inputbox">
		     		<input type="text" id="fname" required>
		     		<input type="text" id="ftel1" class="short" required maxlength="3"> - 
		     		<input type="text" id="ftel2" class="short" required maxlength="4"> - 
		     		<input type="text" id="ftel3" class="short" required maxlength="4">
		     	</div>
	     	
	     	</div>
		     	<input type="submit" id="fbtn" value="확인" class="btn btn-info">
		     	</form>
	     </div>
	     
	     <div id="line"></div>
	     
     	 <div id="findpw">
     	 	<h1>비밀번호 찾기</h1>
     	 	<h3>회원가입 시 등록한 아이디, 이메일 입력 후 이메일 인증을 진행해 주세요.</h3>
     	 	<form id="rightform" method="GET" onsubmit="return changepw()" autocomplete="off">
     	 	<div class="content">
     	 		
     	 		<div class="text">
     	 			<p>아이디</p>
     	 			<p>이메일</p>
     	 			<p>인증코드</p>
     	 		</div>
     	 		
     	 		<div class="inputbox">
     	 			<input type="text" id="sid" required style="display: block;">
     	 			<input type="text" id="semail1" name="email1" required class="middle">&nbsp;@&nbsp; 
     	 			<input type="text" id="semail2" name="email2" required class="middle" style="display: inline;">
     	 			<select id="domain">
	      				<option value="">직접입력</option>
	      				<option value="naver.com">naver.com</option>
	      				<option value="daum.net">daum.net</option>
	      				<option value="nate.com">nate.com</option>
	      				<option value="gmail.com">gmail.com</option>
     	 			</select>
     	 			<div class="auth">
     	 				<input type="text" id="scode" disabled required>
     	 			</div>
     	 		</div>
     	 	</div>
     	 		<input type="submit" id="sbtn" value="확인" class="btn btn-info" disabled>
     	 		<input type="button" id="sendmail" value="인증 메일 발송" class="btn btn-info" onclick="emailcheck(rightform.email1.value, rightform.email2.value)">
     	 	</form>
     	 </div>

     	 	
      </div>
      
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   		function findid() {
   			event.preventDefault(); 
   			
   			$.ajax({
				
				type: 'GET',
				url: '/tripnow/member/findid.do',
				data: 'name=' + $('#fname').val() + '&tel1=' + $('#ftel1').val() + '&tel2=' + $('#ftel2').val() + '&tel3=' + $('#ftel3').val(),
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {												
						alert(result.name + '님의 ID는 [' + result.id + ']입니다. [확인]을 누르면 로그인 페이지로 이동합니다.');
						location.href='/tripnow/member/login.do';

						
					} else {						
					
						alert('ID를 찾을 수 없습니다. 입력하신 정보를 다시 확인해 주세요.');
						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
   			
   		return false;
   		}
   			
   		$('#domain').change(function() {
   	   		
   			$('#semail2').val($('#domain').val());
   			
   		});
   		
   		
   		let code;
   		let id;

   		function emailcheck(email1, email2) {
			   			
   			if ($('#sid').val() == "" || email1 == "" || email2 == "") {
   				alert('ID, 이메일을 입력해 주세요.');
   				return;
   				
   			
   			} else {
   				
	   			
	   			$.ajax({
					
					type: 'GET',
					url: '/tripnow/member/idemailcheck.do',
					data: 'id=' + $('#sid').val()  + '&email=' + email1 + '@' + email2,
					dataType: 'json',
					success: function(result) {
						
						if (result.result == 1) {
							code = result.code;
							id = result.id;
			   				$('#sendmail').val('재발송');
				   			$('#scode').attr('disabled', false);
				   			$('#sbtn').attr('disabled', false);
							$('#scode').attr('disabled', false);
							$('#sid').attr('readonly', true);
							$('#semail1').attr('readonly', true);
							$('#semail2').attr('readonly', true);
							$('#domain').attr('disabled', true);
						} else {
							alert('해당 ID, 이메일 정보를 찾을 수 없습니다. 다시 한 번 확인해 주세요.')
						}
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
					
				});
   			}
   
   	
   		}
   		
   		
   		function changepw() {
   			
   			event.preventDefault(); 
   			if ($('#scode').val() == code) {
   				openWindowPop(id);
   				return false;
   			} else {
   				alert('인증 코드를 다시 확인해 주세요.');
   				return false;
   			}
   			
   			return false;
   		}

   		
   	   function openWindowPop(id){
           var options = 'top=100, left=650, width=580, height=380, status=no, menubar=no, toolbar=no, resizable=no';
           window.open("/tripnow/member/changepw.do?id="+ id, "child", options);
       }
   
   </script>

</body>
</html>