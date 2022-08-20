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

	<main>
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
	</main>
 	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

	<script>
		<c:if test="${resultOne == 1 && resultTwo == 1}">
		location.href = '/tripnow/partner/editcar.do?seq=${seq}';
		</c:if>
		
		<c:if test="${resultOne == 0 || resultTwo == 0}">
		alert('failed');
		history.back();
		</c:if>
	</script>


</body>
</html>






























