<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<span id="logo"><a href="/tripnow/home/main.do">TripNow</a></span>
	<ul id="membermenu">
	
	
		<c:if test="${empty auth}">
			<li><a href="/tripnow/member/login.do">로그인</a></li>
			<li><a href="/tripnow/member/memberadd.do">회원가입</a></li>
		</c:if>

		<c:if test="${not empty auth}">
			<li><a href="/tripnow/member/logout.do">로그아웃</a></li>
		</c:if>
		<c:if test="${not empty auth}">
		<li>
			<a href="/tripnow/mypage/mypagemain.do">마이페이지</a>
		</li>
		</c:if>
		<c:if test="${not empty auth}">
		<li ><a id="couponList">쿠폰함</a></li>
		</c:if>
		<c:if test="${not empty auth == admin}">
			<li>[Admin Mode]</li>
		</c:if>
		<li>
			<a href="/tripnow/partner/mylist.do">내 상품 보기</a>
		</li>
	</ul>
	<ul id="mainmenu">
		<li><a href="/tripnow/home/main.do">국내숙소</a></li>
		<li><a href="/tripnow/activity/activitymain.do">액티비티</a></li>
		<li><a href="/tripnow/car/carmain.do">렌터카</a></li>
		<li><a href="/tripnow/commu/commu.do">커뮤니티</a></li>
		<li><a href="/tripnow/event/event.do">이벤트</a></li>
	</ul>
</header>

<script>
$('#couponList').on("click",function(){
    var id = '<%=(String)session.getAttribute("auth")%>';
    window.open("/tripnow/event/couponlist.do?id="+id,"CouponList","width=750,height=640").focus();
    
});
</script>