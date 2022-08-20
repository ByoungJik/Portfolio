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
	
	#back {
		width: 1060px;
		height: 650px;
		background-image: url('/tripnow/images/balloons.jpg');
		background-repeat: no-repeat;
		background-size: cover;
	}

	#loginbox {
		width: 448px;
		height: 500px;
		border: none;
		float: right;
		text-align: center;
		
		margin: 50px 50px 50px 0px;
		border-radius: 10px;
		box-shadow: rgb(33 37 41 / 10%) 0px 4px 8px 0px;
		padding: 30px;
	}
	
	#loginbox #title {
		color: white;
		font-size: 25px;
		margin-top: 30px;
		margin-bottom: 20px;
		padding-bottom: 25px;
		border-bottom: 1px solid #DDD;
		font-weight: bold;
	}
	
	#inputbox {
		width: 350px;
		margin: 50px auto;
		margin-bottom: 30px;
		text-align: left;
		display: flex;
	}
	#inputbox p {
		width: 100px;
		font-size: 16px;
		color: white;
		margin: 10px;
		font-weight: bold;
	}
	

	#inputbox input {
		width: 130px;
		margin: 7px;
		outline: none;
		padding-left: 5px;
		border: none;
	}
	
	#inputbox #submit {
		width: 100px;
		height: 60px;
		background-color: transparent;
		border: 1px solid #EEE;
		color: white;
		font-weight: bold;
	}
	
	#connect {
		border-top: 1px solid white;
		padding-top: 40px;
		margin-top: 30px;
		width: 388px;
		color: white;
		font-size: 18px;
	}
	
	#connect a, #connect a:hover {
		color: white;
	}
	
	#msg {
		color: red;
		font-size: 15px; 
		visibility: hidden;
	}
	
</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <div id="back">
      <div id="loginbox">
      	
      	<p id="title">TripNow로<br>지금 떠나보세요!</p>

			<div id="inputbox">
				<div id="text">
					<p>아이디(ID)</p>
					<p>비밀번호(PW)</p>
				</div>
				
				<div id="input" >
					<input type="text" id="id" name="id" autocomplete="off">
					<input type="password" id="pw" name="pw">
				</div>
				
				<input type="button" id="submit" value="로그인" onclick="userlogin()">
			</div>
			
			<p id="msg">아이디 혹은 비밀번호가 올바르지 않습니다.</p>
			
      <div id="connect">
     	<p><a href="/tripnow/member/findidpw.do">아이디 | 비밀번호 찾기</a></p>
      
      </div>
	 
	 </div>

      </div>
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   
   		function userlogin() {
   			
   			$.ajax({
				
				type: 'POST',
				url: '/tripnow/member/loginok.do',
				data: 'id=' + $('#id').val() + '&pw=' + $('#pw').val(),
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {												
						location.href= '/tripnow/home/main.do';
						
					} else {						
						
						$('#msg').css('visibility', 'visible');
						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
   			
   		}
   
   		
   </script>

</body>
</html>