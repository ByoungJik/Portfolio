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

</style>
</head>
<body>
	<!--  -->
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <div id="back"></div>
      
   </main>
   	  <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   		if (${result} == 1) {
   			alert('탈퇴 완료되었습니다. 확인을 누르면 메인 페이지로 돌아갑니다.');
   			location.href="/tripnow/home/main.do";
   		} else {
   			alert('회원 탈퇴에 실패했습니다. 관리자에게 문의 바랍니다.');
   			location.href="/tripnow/mypage/mypagemain.do";
   		}
   </script>

</body>
</html>