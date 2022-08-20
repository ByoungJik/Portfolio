<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripNow(트립나우)</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/tripnow/asset/css/tripnowActivity.css" />
<style>

</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		
		<div class="ALbar">
			<%@ include file="/WEB-INF/views/activity/menubar.jsp" %>
		</div>
		<div class="NList">
				   <div class="Nact_List">
					<c:forEach items="${list}" var="dto">	
					 
						<div class="Act_card" style=" cursor: pointer;" onclick="location.href='/tripnow/activity/activityview.do?seq=${dto.seq}&region=${dto.region}&date=${date}&count=${count}';">  
						  <img src="${dto.path}" class="card-img-top" alt="...">
							  <div class="region">
							    <p>${region}</p>
							  </div>
							  <div class="name">
							  	 <p>${dto.name}</p>
							  </div>
							  <div class="star">
							  	 <p><span>★★★★★</span> 5</p>
							  </div>
							  <div class="price">
							  	 <p>￦${String.format("%,d",dto.price)}원<span>/1인</span></p>
							  </div>
						</div>
					</c:forEach>
					<c:if test="${list.size() == 0}">
						게시물이 없습니다<div class=""></div>
					</c:if>
				</div>
		</div>
		
	
	</main>
	<div class="Afootter">
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<script>
	
		
	
	</script>

</body>
</html>
























