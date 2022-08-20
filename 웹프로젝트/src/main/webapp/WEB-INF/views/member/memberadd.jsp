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


	.ktitle {
      float: left; 
      display: block;
	  text-align: center;
	}
	
	.ktitle h1 {
      margin: 30px 0px 20px 20px;
      font-size: 25px;	
      font-weight: bold;
	}
	
	section > h1 {
		font-variant: small-caps;
		padding-bottom: 40px;
		margin: 40px 0px 40px 0px;
		border-bottom: 1px solid #DDD;
		font-size: 40px;
		font-weight: bold;
		text-align: center;
	}
	
	#kterms {
		width: 800px;
		height: 120px;
      background-color: #EEE;
      display: block;
      resize: none;
      outline: none;
      border: 1px solid #CCC;
      padding: 10px;
      text-align: justify;
       clear: both;		      
	}
	

	
	#ktermsbox {
		width: 800px;
        margin: 10px auto;
	}
	
	#ktermsbox input[type='radio'] {
		margin: 10px 5px 0px 20px;
	}
	
	#ktermsbox label {
		float: right;
	}
	
	#register {
		clear: both;
		width: 800px;
		margin: 20px auto;
	}
	
	#register th p:nth-child(1){
		font-size: 17px;
		margin-bottom: 2px;
	}
	
	#register th p:nth-child(2){
		font-size: 12px;
		font-weight: normal;
		margin-bottom: 0px;
	}
	
	#register th { width: 250px; }
	#register th, #register td {
		height: 60px;
	}
	
	td input[type='text'], td input[type='password'] {
		height: 30px;
		padding: 3px;
		outline: none;
	}
	
	td input[type='button'] {
		margin-left: 10px;
	}
	
	.kmini {
		width: 60px;
	}
	
	.kshort {
		width: 120px;
	}
	
	.klong {
		width: 200px;
	}
	
	#register td input[type='radio'] {
		margin-right: 10px;
	}
	
	#register td label {
		margin-right: 35px;
	}
	
	#registerbtns {
		float: right;
		clear: both;
		margin-bottom: 50px;
	}
	
	#registerform {
		width: 800px;
		margin: 0 auto;
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
	
	#email3 {
		height: 30px;
	}
	
	
	.hidden {
		display: none;
	}
	
	#confirmmsg, #checkmsg, #pwmsg, #pwlengthmsg {
		height: 30px;
		border: none;
		margin-left: 10px;
	}
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <section>
      
      	  <h1>Sign-Up</h1>
	      <div class="ktitle">
	      <h1>약관 동의 여부 선택</h1>
	      </div>
	
	      	<div id="ktermsbox">
	      	<textarea id="kterms" readonly>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus dolor neque nihil accusantium cum rem qui omnis alias molestias error fugiat nobis totam aut assumenda commodi eos ratione est illo magni maiores similique tempora dolores ipsa quibusdam corrupti architecto dolorum repudiandae beatae deserunt reprehenderit earum explicabo provident quod tenetur pariatur!</textarea>
	      	<label><input type="radio" name="rbterms" value="agree" class="rbterms"> <span>비동의 </span></label>
	      	<label><input type="radio" name="rbterms" value="disagree" class="rbterms" id="agreebtn"> <span>동의 </span></label>
	      	</div>
	      		
	      	
	      <div class="ktitle"><h1>회원 정보 등록</h1></div>
	      
	      <form id="registerform" autocomplete="off" method="POST" action="/tripnow/member/memberaddok.do">
	      <table id="register">
	      		<tr>
	      			<th><p>아이디</p><p>영문, 숫자 조합 5~15자 이내</p></th>
	      			<td>
	      				<input type="text" id="id" required name="id" maxlength="15">
	      				<input type="button" value="중복 확인" class="btn btn-info" onclick="checkid()">
	      				<input type="text" id="checkmsg" class="msg" readonly>
	      			</td>      			
	      		</tr>
	      		<tr>
	      			<th><p>비밀번호</p><p>영문, 숫자, 특수문자 조합 6~20자</p></th>
	      			<td><input type="password" id="pw" required name="pw" maxlength="20"><input type="text" class="msg red klong" id="pwlengthmsg" readonly value="비밀번호를 6자 이상 입력해 주세요."></td>
	      		</tr>
	      		<tr>
	      			<th><p>비밀번호 확인</p></th>
	      			<td><input type="password" id="pwconfirm" required maxlength="20"><input type="text" class="msg" id="pwmsg" readonly></td>
	      		</tr>
	      		<tr>
	      			<th><p>이름</p><p>한글 2~5자</p></th>
	      			<td><input type="text" id="name" class="kshort" required name="name" maxlength="5"></td>
	      		</tr>
	      		<tr>
	      			<th><p>전화번호</p></th>
	      			<td><input type="text" id="tel1" class="kmini" required name="tel1" maxlength="3"> - <input type="text" id="tel2" class="kmini" required name="tel2" maxlength="4"> - <input type="text" id="tel3" class="kmini" required name="tel3" maxlength="4"></td>
	      		</tr>
	      		<tr>
	      			<th><p>생년월일</p></th>
	      			<td><input type="text" id="birth" class="kshort" placeholder="YYYYMMDD" required name="birth" maxlength="8"></td>
	      		</tr>
	      		<tr>
	      			<th><p>성별</p></th>
	      			<td>
	      				<label><input type="radio" name="gender" value="남" checked>남자</label>
	      				<label><input type="radio" name="gender" value="여">여자</label>
	      			</td>
	      		</tr>
	      		<tr>
	      			<th><p>이메일</p></th>
	      			<td>
		      			<input type="text" id="email1" class="kshort" required name="email1" maxlength="15"><span>&nbsp;@&nbsp;</span>
		      			<input type="text" class="kshort" required name="email2" id="email2" style="display: inline;">
		      			<select id="email3">
		      				<option value="">직접입력</option>
		      				<option value="naver.com">naver.com</option>
		      				<option value="daum.net">daum.net</option>
		      				<option value="nate.com">nate.com</option>
		      				<option value="gmail.com">gmail.com</option>
		      			</select>
		      			<input type="button" id="send" value="인증 메일 발송" class="btn btn-info" onclick="emailcheck(registerform.email1.value, registerform.email2.value)">
	      			</td>
	      		</tr>
	      		<tr id="confirm" class="hidden">
	      			<th><p>인증 코드</p></th>
	      			<td>
	      				<input type="text" id="code" class="klong" required>
	      				<input type="button" value="인증하기" class="btn btn-info">
	      				<input type="text" id="confirmmsg" class="msg" value="인증코드를 확인해 주세요." readonly>
	      			</td>
	      		</tr>
	      		
	      </table>
	      
	      <div id="registerbtns">
	      	<input type="submit" value="가입하기" class="btn btn-primary" id="submit" disabled>
	      	<input type="button" value="취소하기" class="btn btn-secondary">
	      </div>
	      
	      
	      </form>
	   </section>
   </main>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   
   <script>
   	
   
   
   		$('#pwconfirm').on('keyup', pwconfirm);
   		$('#pw').on('keyup', pwconfirm);  			
   				
   		function pwconfirm() { 			
   			
   			
   			if ($('#pw').val() != $('#pwconfirm').val()) {
   				
   				$('#pwmsg').val('비밀번호를 확인해 주세요.');
   				$('#pwmsg').css('display', 'inline-block');
   				$('#pwmsg').removeClass('blue');
   				$('#pwmsg').addClass('red');
   				
   			} else {
   				
   				$('#pwmsg').val('비밀번호가 확인되었습니다.');
   				$('#pwmsg').removeClass('red');
   				$('#pwmsg').addClass('blue');
 
   			}
   			
   			if ($('#pw').val() == '' && $('#pwconfirm').val() == '') {
   				$('#pwconfirm + .msg').css('display', 'none');
   			}
   			
   			
   			if ($('#pw').val().length < 6) {
   			
   				$('#pwlengthmsg').removeClass('hidden');
   				$('#pwlengthmsg').removeClass('blue');
   				$('#pwlengthmsg').addClass('red');
   				
   			} else {
   				
   				$('#pwlengthmsg').addClass('hidden');
   				$('#pwlengthmsg').removeClass('red');
   				$('#pwlengthmsg').addClass('blue');
   				
   			}
   			
   			changebutton();
   		};
   		
   		$('#email3').change(function() {
   		
   			$('#email2').val($('#email3').val());
   			
   		});
   		
   	
   		
   		
   		let code;

   		function emailcheck(email1, email2) {
			   			
   			if (email1 == "" || email2 == "") {
   				alert('이메일을 입력해 주세요.');
   				return;
   				
   			
   			} else {
   				
   				event.target.value = '재발송';
	   			$('#confirm').removeClass('hidden');
   				$('#confirm .msg').removeClass('blue');
   				$('#confirm .msg').addClass('red');
	   			
	   			$.ajax({
					
					type: 'POST',
					url: '/tripnow/member/emailcheck.do',
					data: 'email1=' + email1 + '&email2=' + email2,
					dataType: 'json',
					success: function(result) {
						code = result.code;
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
					
				});
   			}
   
   	
   		}
   		
   		
   		$('#confirm .btn').on('click', codeconfirm);
   				
   		function codeconfirm() { 			
   			
   			
   			if ($('#code').val() != code) {
   				
   				$('#confirmmsg').val('  인증코드를 확인해 주세요.');
   				$('#confirmmsg').removeClass('hidden');
   				$('#confirmmsg').removeClass('blue');
   				$('#confirmmsg').addClass('red');
   				
   			} else {
   				
   				$('#confirmmsg').val('  인증코드가 확인되었습니다.');
   				$('#confirmmsg').removeClass('red');
   				$('#confirmmsg').addClass('blue');
   				$('#code').attr('readonly', true);
   				$('#send').attr('disabled', true);
   				$('#confirm .btn').attr('disabled', true);
 
   			}
   			
   			changebutton();
   		};
   		
   		
   		
   		function checkid() {
   			
   			$.ajax({
				
				type: 'POST',
				url: '/tripnow/member/idcheck.do',
				data: 'id=' + $('#id').val(),
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {
						//아이디 사용 불가 (중복)
 						$('#checkmsg').val('중복된 아이디입니다.');
						$('#checkmsg').addClass('red');
						
					} else if (result.result == -1) {
						//아이디 사용 불가 (유효성 검사 탈락)
						$('#checkmsg').val('ID 형식이 올바르지 않습니다.');
						$('#checkmsg').addClass('red');
						
						
					} else {
						//아이디 사용 가능
 						$('#checkmsg').val('사용 가능한 아이디입니다.');
						$('#checkmsg').addClass('blue');
						$('#id').attr('readonly', true);
						$('#id + .btn').attr('disabled', true);
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
   		
   			
   			changebutton();
   		}
   		
   		
   		$('.rbterms').click(function() {
   			changebutton();	
   		});
   		
   		
   		 function changebutton() {
   			
   			if ($('#agreebtn').is(":checked") && $('#checkmsg').hasClass('blue') && $('#pwmsg').hasClass('blue') && $('#confirmmsg').hasClass('blue') && $('#pwlengthmsg').hasClass('blue')) {
   				$('#submit').attr('disabled', false);

   			} else {
   				
   				$('#submit').attr('disabled', true);
   				
   			}
   		}
   		

   		
   			
   </script>

</body>
</html>