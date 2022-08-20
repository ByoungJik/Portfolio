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
   
      <c:if test="${result == 1}">
 			alert('회원 가입에 성공했습니다. 로그인 페이지로 이동합니다.');    
 			location.href='/tripnow/member/login.do';
      </c:if>
      
      <c:if test="${result == -1}">
      		alert('회원 정보 형식을 다시 확인해 주세요.');
      		history.back();
      </c:if>
      
      <c:if test="${result == 0}">
      		alert('회원 가입에 실패했습니다. 관리자에게 문의 바랍니다.');
      		history.back();
      </c:if>

      </script>

</body>
</html>