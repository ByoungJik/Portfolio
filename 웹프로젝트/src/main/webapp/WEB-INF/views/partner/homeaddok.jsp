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
	
	.btn-margin {
		margin-left: 50px;
	}
	
</style>
</head>
<body>
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      
     <table class="table table-bordered">
     	<tr>
     		<td style="text-align: center; padding: 100px;">숙소 등록이 성공적으로 완료되었습니다.</td>
     	</tr>
     	<tr>
     		<td style="text-align: center;">
     			<input type="button" class="btn btn-primary" value="등록완료" onclick="location.href='/tripnow/home/main.do';">
     			<input type="button" class="btn btn-danger btn-margin" value="추가접수" onclick="location.href='/tripnow/partner/homeaddplus.do';">
     		</td>
     	</tr>
     </table>
      
   </main>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   </script>

</body>
</html>