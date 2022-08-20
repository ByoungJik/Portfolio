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

	#commubtns {
		float: right;
		margin-bottom: 20px;
		margin-right: 10px;
	}
	
	.btncolor {
		background-color: #3b4890;
	}
	
	.btn-black {
		color: white;
		background-color: #1c1f22;
	}
	
	.commutable > tbody > tr > td > textarea {
		resize: none;
		height: 500px;
	}
	
	.commutable > tbody > tr > th {
		text-align: center;
		vertical-align: middle;
	}
	
	.commutable {
		margin-top: 40px;
	}
	
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<form method="POST" action="/tripnow/commu/commueditok.do">
		
			<table class="table commutable">
				<tr>
					<th>글제목</th>
					<td><input type="text" name="subject" class="form-control" required value="${dto.subject}"></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea class="form-control" name="content" required>${dto.content}</textarea></td>
				</tr>
			</table>
				<div id="commubtns">
					<input type="button" class="btn btn-black" value="취소하기" onclick="histoy.back()">
					<input type="submit" class="btn btncolor btn-primary" value="수정하기">
				</div>
				<input type="hidden" name="seq" value="${dto.seq}">
			</form>
		</section>
	</main>
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	
	<script>
	
	</script>

</body>
</html>