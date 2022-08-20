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
	
	.table.table-bordered > tbody > tr:nth-child(1) > th {
		background-color: #B2C8DF;
		width: 100px; 
		text-align:center;
	}
	
	.commu7 > th {
		background-color: #B2C8DF;
		text-align:center;
	}
	
	.commu6 > td > textarea {
		width: 850px;
		resize: none;
		padding: 10px;
		outline: none;
	}
	
	.commu6 > td, #commu6sub {
		text-align: center;
		 vertical-align: middle;
	}
	
	.commu5 > th {
		background-color: #6E85B7;
		padding-left: 20px;
		color: white;
	}
	
	
	.floatright {
		float: right;
	}
	
	.btnspan {
		float: right;
	}
	
	.btnspan.red:hover > a {
		color: red;
	}
	
	.tblEditComment textarea {
		width: 870px;
		height: 100px;
		resize: none;
	}
	
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
				
			<table class="table table-bordered">
				<tr>
					<th>게시판</th>
					<td colspan="3">${dto.seq}</td>
				</tr>
				<tr>
					<th style="background-color: #B2C8DF; text-align:center;">${dto.commutype}</th>
					<td style="width: 600px;">${dto.subject}</td>
					<td style="width: 200px; float: right;">작성자 : ${dto.id}</td>
					<td style="width: 180px; text-align: center">조회수 : ${dto.readcount}회</td>
				</tr>
				<tr>
					<td colspan="4" style="padding: 30px; text-align: justify;">${dto.content}</td>
				</tr>
				<c:if test="${dto.id == auth || auth == 'admin'}">
				<tr>
					<td colspan="4"><button class="btn btn-primary floatright"
						onclick="location.href='/tripnow/commu/commuedit.do?seq=${dto.seq}';">
						<i class="fas fa-pen"></i>
						수정하기
					</button>
					<button class="btn btn-primary floatright"
						onclick="delcommuok(${dto.seq});">
						<i class="fas fa-pen"></i>
						삭제하기
					</button>
					</td>
				</tr>
				</c:if>
				<tr class="commu5">
					<th colspan="4">댓글작성</th>
				</tr>
				
				
				
				</table>
				<form id = "addCommuCommentForm">
				<table class="table table-bordered">
				<tr class="commu6">
					<td colspan="3"><textarea rows="5" name="comment" placeholder="댓글을 작성하세요."></textarea></td>
					<td id="commu6sub"><input type="button" class="btn btn-primary" value="댓글 작성" onclick="addCommuComment();"></td>
				</tr>
				</table>
					<input type="hidden" name="bseq" value="${dto.seq}">
				</form>
				
				
				
				
				
				<table class="table table-bordered comment">
				<tr class="commu7">
					<th>아이디</th>
					<th colspan="2">댓글 내용</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${cclist}" var="cclist">
				<tr>
					<td style="text-align:center; vertical-align: middle;">${cclist.id}</td>
					<td colspan="2" style="padding: 15px;">
					<span>${cclist.content}</span>
						<c:if test="${cclist.id == auth}">
							<span class="btnspan red"><a href="#!" onclick="delcomment(${cclist.seq});">[삭제]</a></span>
							<span id="test" class="btnspan"><a href="#!" onclick="editcomment(${cclist.seq});">[수정]</a></span>
						</c:if>
					</td>
					<td style="text-align:center; vertical-align: middle;">${cclist.regdate}</td>
				</tr>
				</c:forEach>
				</table>
			
					
				
				
		
		</section>
	</main>
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	
	<script>
	
	function delcommuok(seq) {
		
		if (confirm('정말 삭제하시겠습니까?')) {
			
			location.href='/tripnow/commu/delcommuok.do?seq=' + seq;
			
		}
		
	}
	
	function addCommuComment() {
		
		$.ajax({
			
			type: 'POST',
			url: '/tripnow/commu/addcommucomment.do',
			data: $('#addCommuCommentForm').serialize(),
			dataType: 'json',
			success: function(result) {
				
				if (result.result == "1") {
					
					let temp = `<tr>
						<td style="text-align:center; vertical-align: middle;">\${result.id}</td>
						<td colspan="2" style="padding: 15px;">\${$('[name=comment]').val()}</td>
						<td style="text-align:center; vertical-align: middle;">\${result.regdate}</td>
						</tr>`;
					
					$('.commu7').after(temp);
					
					$('[name=comment]').val('');
					
				} else {
					alert('에러 발생');					
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
		
	}
	
	function delcomment(seq) {
		
		let tr = $(event.target).parents('tr');
		
		if (confirm('댓글을 삭제하시겠습니까?')) {
			
			$.ajax({
				
				type: 'POST',
				url: '/tripnow/commu/delcommucomment.do',
				data: 'seq=' + seq,
				dataType: 'json',
				success: function(result) {
					
					if (result.result == "1") {
						
						//$(event.target).parents('tr').remove();
						tr.remove();
						
					} else {
						alert('failed');
					}
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});				
			
		}
		
	}
	
	
	
	let isEdit = false; 
	
	function editcomment(seq) {
		
		if (!isEdit) {
			
			const tempStr = $('#test').parent().children(':first').text();
			
			$(event.target).parents('tr').after(temp);
			
			isEdit = true;
			
			$(event.target).parents('tr').next().find('textarea').val(tempStr);
			$(event.target).parents('tr').next().find('input[name=seq]').val(seq);
		}
		
	}
	
	const temp = `<tr id='editRow' style="background-color: #CDCDCD;">
		<td colspan="4">
			<form id="editCommentForm">
			<table class="tblEditComment">
				<tr>
					<td>
						<textarea class="form-control" name="content" required id="txtcontent"></textarea>
					</td>
					<td>
						<button class="btn btn-secondary" type="button"
							onclick="cancelForm();">
							취소하기
						</button>
						<button class="btn btn-primary" type="button"
								onclick="editComment();">
							<i class="fas fa-pen"></i>
							수정하기
						</button>
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="seq">
			</form>
		</td>
	</tr>`;
	
	function cancelForm() {
		$('#editRow').remove();
		isEdit = false;
	}
	
	
	function editComment() {
		
		$.ajax({
			
			type: 'POST',
			url: '/tripnow/commu/editcommucomment.do',
			data: $('#editCommentForm').serialize(),
			dataType: 'json',
			success: function(result) {
				
				if (result.result == "1") {
					
					//수정된 댓글을 화면에 반영하기
					//$('textarea[name=content]').val()
					$('#editRow').prev().children().eq(1).children().eq(0).text($('#txtcontent').val());
					
					$('#editRow').remove();
					
				} else {
					alert('failed');
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















