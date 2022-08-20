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
		width: 190px;
		height: 50px;
		margin: 20px auto;
		display: flex;
	}
	
	#icon {
		background-image: url("/tripnow/images/unregister.png");
		margin-top: 20px;
		width: 40px;
		height: 40px;
		background-size: contain;
		background-repeat: no-repeat;
	}
	
	#top, #bottom {
	
		width: 700px;
		height: 100px;
		margin: 0 auto;
		border-bottom: 1px solid #DDD;
	}
	
	#bottom {
		height: 200px;
	}
	
	#inputbox {
		width: 400px;
		margin-top: 20px;
		display: flex;
		justify-content: space-between;
	}
	
	#inputbox #text {
		text-align: left;
		width: 100px;
		font-weight: bold;
	}
	
	#input {
		width: 150px;
		margin-right: 20px;
	}

	
	#content {
		width: 400px;
		margin: 0 auto;
		text-align: center;
	}
	
	#content > p {
		font-size: 16px;
		margin-top: 30px;
	}
	
	#input input:first-child {
		border: none;
		outline: none;
		margin-bottom: 15px;
		width: 120px;
	}
	
	#input input:last-child {
		outline: none;
		border: 1px solid #CCC;
		padding-left: 5px;
		width: 120px;
	}
	
	#text p:first-child {
		margin-bottom: 20px;
	}
	
	#submit input[type=submit] {
		width: 100px;
		height: 62px;
	}
	
	#msg {
		width: 180px;
		margin-top: 20px;
		border: none;
		outline: none;
		visibility: hidden;
	}
	
	.red {
		color: tomato;
	}
	
</style>

</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <div id="top">
      
 	     <div id="title"><div id="icon"></div><h1>&nbsp;회원 탈퇴</h1></div>
     
      </div>
      <div id="bottom">
      	 <div id="content">
      	 	<p>회원 탈퇴를 위해 비밀번호를 확인해 주세요.</p>
      	 	<form method="POST" onsubmit="checkpw()" action="#!">
      	 	<div id="inputbox">
	      	 	<div id="text"><p>아이디(ID)</p><p>비밀번호(PW)</p></div>
	      	 	<div id="input"><input type="text" value="${auth}" readonly><input type="password" id="pw"></div>
	      	 	<div id="submit"><input type="submit" value="확인" class="btn btn-info"></div>
      	 	</div>
	      	</form>
      	 	<input type="text" value="비밀번호를 다시 확인해 주세요." id="msg" class="red" readonly>
      	 </div>	
      </div>
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   
   		function checkpw() {
   			
	   		event.preventDefault();
   			 	   		 
   			$.ajax({
				
				type: 'POST',
				url: '/tripnow/mypage/checkpw.do',
				data: 'pw=' + $('#pw').val(),
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {
						checkbooklist();
					} else {
						$('#msg').css('visibility', 'visible');
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
   		
   			return false;
   		}
   		
   		
   		function checkbooklist() {
   			
   			$.ajax({
				
				type: 'POST',
				url: '/tripnow/mypage/checkbooklist.do',
				data: 'id=' + "${auth}",
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {
						location.href="/tripnow/mypage/unregistercheck.do?id=${auth}";
					} else {
						if (confirm('정말 탈퇴하시겠습니까?') == true) {
							location.href="/tripnow/mypage/unregisterok.do?id=${auth}";
						} else {
							return;
						};
						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
   			
   			
   		};
   </script>

</body>
</html>