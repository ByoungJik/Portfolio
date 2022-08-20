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
	
	.table.textcenter th {
		text-align: center;
		background-color: #b7b7b7;
	}
	
	.table.textcenter td {
		text-align: center;
	}
	
	.table.textcenter > tbody > tr:hover {
		background-color: #f3f3f3;
	}
	
	.table.textcenter th:nth-child(1) { width: 80px; }
	.table.textcenter th:nth-child(2) { width: 70px; }
	.table.textcenter th:nth-child(3) { width: auto; }
	.table.textcenter th:nth-child(4) { width: 110px; }
	.table.textcenter th:nth-child(5) { width: 120px; }
	.table.textcenter th:nth-child(6) { width: 110px; }
	
	.btncolor {
		float: right;
		margin-bottom: 20px;
		margin-right: 10px;
		background-color: #3b4890;
	}
	
	.purple {
		background-color: #f7e8ed;
		font-weight: bold;
	}
	
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<h2>게시판</h2>
			
			<table class="table table-bordered textcenter">
				<tr>
					<th>번호</th>
					<th>유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${clist}" var="clist">
				<c:if test="${clist.commutype == '공지'}">
				<tr class="purple">
				</c:if>
				
				<c:if test="${clist.commutype == '일반'}">
				<tr>
				</c:if>
					<td>${clist.seq}</td>
					<td>${clist.commutype}</td>
					<td>
						<a href="/tripnow/commu/commuview.do?seq=${clist.seq}">
						${clist.subject} <c:if test="${clist.commentcount != '0'}">(${clist.commentcount})</c:if>
						</a>
						</td>
					<td>${clist.id}</td>
					<td>${clist.regdate}</td>
					<td>${clist.readcount}</td>
				</tr>
				</c:forEach>
				<c:if test="${clist.size() == 0}">
				<tr>
					<td colspan="5">게시물이 없습니다.</td>
				</tr>
				</c:if>
			</table>
			<div>
				<input type="button" value="글 작성" class="btn btn-primary btncolor" onclick="location.href='/tripnow/commu/commuadd.do';">
			</div>
			<div style="text-align: center;">
				${pagebar}
			</div>
		</section>
	</main>
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	
	<script>
		$("#pagebar").change(function() {
			
			location.href = '/tripnow/commu/commu.do?page=' + $(this).val();
			
		});
		
		$('#pagebar').val(${nowPage});
	</script>

</body>
</html>