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


	main {
		margin: 30px auto;
		width: 450px;
		height: 300px;
	}
	
	main h1 {
		margin-bottom: 10px;
	}
	
	main h5 {
		margin-bottom: 30px;
	}
	
	#back {
		width: 400px;
		height: 100px;
		display: flex;
		justify-content: space-between;
	}
	
	#text p {
		width: 150px;
		margin-bottom: 20px;
	}
	
	#input input {
		margin-bottom: 15px;
		outline: none;
		border: 1px solid #CCC;
	}
	
	#input input:last-child {
		border: none;
	}
	
	#msg {
		border: none;
	}
	
	#btn {
		margin-top: 20px;
		float: right;
	}
	
	.blue {
		color: cornflowerblue;
	}
	
	.red {
		color: tomato;
	}
	
	
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <h1>비밀번호 변경</h1><h5>영문, 숫자, 특수문자 조합 6~20자</h5>
      
      <div id="back">
      <div id="text">
      	<p>새 비밀번호</p>
      	<p>비밀번호 확인</p>
      </div>
      
      <div id="input">
      	<input type="password" id="newpw">
      	<input type="password" id="confirmnewpw">
      	<input type="text" id="msg" readonly>
      	
      </div>
      
      </div>
      	<input type="button" id="btn" onclick="changepwok()" value="변경하기" class="btn btn-info" disabled>
   </main>
   <script>
   
   		function changepwok() {
   			
   			
   			$.ajax({
				
				type: 'POST',
				url: '/tripnow/member/changepwok.do',
				data: 'pw=' + $('#newpw').val() + '&id=${id}',
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {
			 			alert('비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.');    
			 			opener.location.href = "/tripnow/member/login.do";
			 			window.close();
					} else {
			      		alert('비밀번호 변경에 실패했습니다. 비밀번호 형식을 다시 확인해 주세요.');
						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
   			
   		};
   		
   		
   		$('#newpw').on('keyup', pwconfirm);
   		$('#confirmnewpw').on('keyup', pwconfirm);
   		
   		
   		function pwconfirm() { 			
   			
   			
   			if ($('#newpw').val() != $('#confirmnewpw').val()) {
   				
   				$('#msg').val('비밀번호를 확인해 주세요.');
   				$('#msg').removeClass('blue');
   				$('#msg').addClass('red');
   				$('#btn').attr('disabled', true);
   				
   			} else {
   				
   				$('#msg').val('비밀번호가 확인되었습니다.');
   				$('#msg').removeClass('red');
   				$('#msg').addClass('blue');
   				$('#btn').attr('disabled', false);
 
   			}
   			
   			if ($('#newpw').val() == '' && $('#confirmnewpw').val() == '') {
   				$('#msg').css('visibility', 'hidden');
   			} else {
   				
   				$('#msg').css('visibility', 'visible');
   				
   			}
   		}
   		
   </script>

</body>
</html>