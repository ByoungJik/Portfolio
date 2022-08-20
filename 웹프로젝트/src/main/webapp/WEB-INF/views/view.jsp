<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripNow(트립나우)</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
	#homeinfo {
		padding: 20px 30px;
		border: 1px solid #b7b7b7;
		margin-top: 30px;
		margin-bottom: 30px;
		font-size: 17px;
		color: #808080;
		border-radius: 20px;
		box-shadow: rgb(33 37 41/ 10%) 0px 4px 8px 0px;
	}

	.homelist {
		margin-top: 30px;
		margin-bottom: 150px;
		padding-right: 10px;
		float: left;
		height: 500px;
	}

	.money {
		float: right;
		font-size: 20px;
		font-weight: bold;
	}

	.btn.btn-primary.booking {
		float: right;
		clear: both;
		margin-bottom: 10px;
	}

	.money, .btn.btn-primary.booking {
		margin-right: 30px;
	}
	
	.mb-3 {
		border: 1px solid #fbceb1;
		width: 1060px;
		box-shadow: rgb(33 37 41/ 10%) 0px 4px 8px 0px;
		border-radius: 20px;
	}
	
	.col-md-4>.thumbnail {
		width: 330px;
		height: 200px;
		border: none;
		border-radius: 20px;
	}
	
	.carinfo {
		border: 1px solid black;
		width: 1060px;
		height: 100px;
		margin-top: 30px;
	}
	
	.col-md-4 {
		height: 200px;
	}
	
	.homereview {
		/* border: 1px solid black; */
		padding: 20px;
		border-bottom: 1px solid #b7b7b7;
	}
	
	#reviewall {
		display: inline-block;
		margin-top: 5px;
		margin-bottom: 15px;
	}
	
	.reviewnumber {
		position: relative;
		top: 3px;
	}
	
	.reviewcontent {
		border: 1px solid #b7b7b7;
		padding: 15px;
		border-radius: 10px;
		text-align: justify;
	}
	
	.homereview:last-child {
		border-bottom: none;
	}
	
	#mainreview {
		border-bottom: 1px solid gray;
		padding-bottom: 20px;
		padding-top: 20px;
	}
	
	#reviewWrite {
		margin: 10px;
	}
	
	#reviewWrite > textarea {
		resize: none;
		padding: 10px;
		outline: none;
	}
	
	.write {
		position: relative;
		top: -40px;
		left: 25px;
	}
	
	#radiostar {
		margin-left: 15px;
	}
	
	#reviewstart {
		margin-top: 30px;
		margin-bottom: 20px;
	}
	
	.card.mb-3 {
		margin-bottom: 15px;
	}
	
	
	.homereview p {
		font-size: 25px;
		text-align: center;
		margin-top: 10px;
		
	}
	
	.master {
		background-color: #EEE;
	
	}
	
	.spanright {
		float: right;
	}
	
	.spanright > span:nth-child(1) > a {
		color: red;
	}
	
	.spanright > span:nth-child(2) > a {
		color: blue;
	}
	
	.spanright > span > a:hover {
		color: cornflowerblue;
	}
	
	#editRow {
		margin: 10px;
	}
	
	.tblEditComment textarea {
		resize: none;
		width: 829px;
		margin: 10px;
		height: 70px;
	}
	
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<%@ include file="/WEB-INF/views/home/menubar.jsp"%>
		<section>

			<div id="homeinfo">
				<div>
					<span>${rimdto.name}</span> <span> ★ <fmt:formatNumber value="${rimdto.avgstar}" pattern=".0"/> (${rimdto.count}) </span>
				</div>
				<div id="b_text1">
	        			<c:if test="${rldto.bath eq 'y'}">
	        			<p class="card-text badge badge-light"><span>욕조</span></p>
	        			</c:if>
	        			<c:if test="${rldto.pet eq 'y'}">
	        			<p class="card-text badge badge-light"><span>애견동반 가능</span></p>
	        			</c:if>
	        			<c:if test="${rldto.smoke eq 'y'}">
	        			<p class="card-text badge badge-light"><span>흡연 가능</span></p>
	        			</c:if>
	        			<c:if test="${rldto.pool eq 'y'}">
	        			<p class="card-text badge badge-light"><span>수영장 있음</span></p>
	        			</c:if>
	        			<c:if test="${rldto.parking eq 'y'}">
	        			<p class="card-text badge badge-light"><span>주차 가능</span></p>
	        			</c:if>
	        			<c:if test="${rldto.cook eq 'y'}">
	        			<p class="card-text badge badge-light"><span>취사 가능</span></p>
	        			</c:if>
	        			<c:if test="${rldto.wifi eq 'y'}">
	        			<p class="card-text badge badge-light"><span>와이파이</span></p>
	        			</c:if>
				</div>
				<div>
					<i class="fa-solid fa-location-dot"></i> &nbsp; <span>위치 정보
						(${rimdto.location})</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i
						class="fa-solid fa-check"></i> &nbsp; <span>체크인 : PM ${rimdto.enterhome}
						~ 체크아웃 : AM ${rimdto.outerhome}</span>
				</div>
			</div>



			<c:forEach items="${rolist}" var="rolist">
			<div class="card mb-3">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="/tripnow/${rolist.path}" alt="..." class="thumbnail">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h3 class="card-title">${rolist.name}</h3>
							<ul>
								<li>베드옵션 : (${rolist.value})</li>
								<li>최대수용인원 : (${rolist.maxpeople} 명)</li>
							</ul>
							<p class="card-text money">￦ <fmt:formatNumber value="${rolist.price}" pattern="#,###,###" /> 원</p>
							<a class="btn btn-primary booking" href="/tripnow/home/roomview.do?seq=${rolist.seq}">객실 상세보기</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
			
				<h2 id="mainreview">숙소 리뷰</h2>
				
				<c:if test="${bookid == auth}">
				<h3 id="reviewstart">리뷰 작성</h3>
				
				<form id="addCommentForm">
				<input type="hidden" name="seq" value="${seq}">
				<div id="radiostar">
					<label><input type="radio" name="star" value="5" required>&nbsp;<span class="star5"></span></label>
					<label><input type="radio" name="star" value="4">&nbsp;<span class="star4"></span></label>
					<label><input type="radio" name="star" value="3">&nbsp;<span class="star3"></span></label>
					<label><input type="radio" name="star" value="2">&nbsp;<span class="star2"></span></label>
					<label><input type="radio" name="star" value="1">&nbsp;<span class="star1"></span></label>
				</div>
				
				<div id="reviewWrite">
					<textarea rows="3" cols="110px" name="content" placeholder="댓글 내용을 작성하세요."></textarea>
					<button class="btn btn-primary write" type="button" onclick="addComment();">작성하기</button>
					<input type="hidden" name="hseq" value="${seq}">
				</div>
				</form>
				</c:if>
				
				
				
				
				
				
				
				
				<div id="reviewbox"> 
				
				<c:if test="${not empty hrlist}">
				<c:forEach items="${hrlist}" var="hrlist">
				<div class="homereview">
					<div>
						<span>작성자 : ${hrlist.id}</span>
						<span style="float: right">등록일 : ${hrlist.regdate}</span>
					</div>
					<div id="reviewall">
						<span class="star${hrlist.star}"></span>
					</div>
					<span class="reviewnumber">${hrlist.star}</span>
					<div class="reviewcontent">
						<span id="">${hrlist.content}</span>
						<c:if test="${hrlist.id == auth}">
						<span class="spanright">
							<span class="btnspan"><a href="#!" onclick="delcomment(${hrlist.seq});">[삭제]</a></span>
							<span class="btnspan"><a href="#!" onclick="editcomment(${hrlist.seq});">[수정]</a></span>
						</span>
						</c:if>
					</div>
					
					<c:if test="${not empty hrlist.pcontent}">
					<p><i class="fa-solid fa-angle-down"></i></p>
					
					<div class="reviewcontent master">
						${hrlist.pcontent}
					</div>
					</c:if>
				</div>
				</c:forEach>
				</c:if>
				</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	
	
	
<!-- weather widget start --><div id="m-booked-bl-simple-week-vertical-2136"> <div class="booked-wzs-160-275 weather-customize" style="background-color:#137AE9; width:160px;" id="width1 " > <div class="booked-wzs-160-275_in"> <div class="booked-wzs-160-275-data"> <div class="booked-wzs-160-275-left-img wrz-18"></div> <div class="booked-wzs-160-275-right"> <div class="booked-wzs-day-deck"> <div class="booked-wzs-day-val"> <div class="booked-wzs-day-number"><span class="plus">+</span>28</div> <div class="booked-wzs-day-dergee"> <div class="booked-wzs-day-dergee-val">&deg;</div> <div class="booked-wzs-day-dergee-name">C</div> </div> </div> <div class="booked-wzs-day"> <div class="booked-wzs-day-d"><span class="plus">+</span>29&deg;</div> <div class="booked-wzs-day-n"><span class="plus">+</span>23&deg;</div> </div> </div> <div class="booked-wzs-160-275-info"> <div class="booked-wzs-160-275-city">서울특별시</div> <div class="booked-wzs-160-275-date">일요일, 17</div> </div> </div> </div> <table cellpadding="0" cellspacing="0" class="booked-wzs-table-160"> <tr> <td class="week-day"> <span class="week-day-txt">월요일</span></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-val"><span class="plus">+</span>32&deg;</td> <td class="week-day-val"><span class="plus">+</span>23&deg;</td> </tr> <tr> <td class="week-day"> <span class="week-day-txt">화요일</span></td> <td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td> <td class="week-day-val"><span class="plus">+</span>31&deg;</td> <td class="week-day-val"><span class="plus">+</span>24&deg;</td> </tr> <tr> <td class="week-day"> <span class="week-day-txt">수요일</span></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-val"><span class="plus">+</span>30&deg;</td> <td class="week-day-val"><span class="plus">+</span>24&deg;</td> </tr> <tr> <td class="week-day"> <span class="week-day-txt">목요일</span></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-val"><span class="plus">+</span>30&deg;</td> <td class="week-day-val"><span class="plus">+</span>23&deg;</td> </tr> <tr> <td class="week-day"> <span class="week-day-txt">금요일</span></td> <td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td> <td class="week-day-val"><span class="plus">+</span>30&deg;</td> <td class="week-day-val"><span class="plus">+</span>22&deg;</td> </tr> <tr> <td class="week-day"> <span class="week-day-txt">토요일</span></td> <td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td> <td class="week-day-val"><span class="plus">+</span>31&deg;</td> <td class="week-day-val"><span class="plus">+</span>23&deg;</td> </tr> </table> <div class="booked-wzs-center"> <span class="booked-wzs-bottom-l">7일 예보 보기</span> </div> </div> </div> </div><script type="text/javascript"> var css_file=document.createElement("link"); var widgetUrl = location.href; css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href",'https://s.bookcdn.com/css/w/booked-wzs-widget-160x275.css?v=0.0.1'); document.getElementsByTagName("head")[0].appendChild(css_file); function setWidgetData_2136(data) { if(typeof(data) != 'undefined' && data.results.length > 0) { for(var i = 0; i < data.results.length; ++i) { var objMainBlock = document.getElementById('m-booked-bl-simple-week-vertical-2136'); if(objMainBlock !== null) { var copyBlock = document.getElementById('m-bookew-weather-copy-'+data.results[i].widget_type); objMainBlock.innerHTML = data.results[i].html_code; if(copyBlock !== null) objMainBlock.appendChild(copyBlock); } } } else { alert('data=undefined||data.results is empty'); } } var widgetSrc = "https://widgets.booked.net/weather/info?action=get_weather_info;ver=7;cityID=18406;type=4;scode=2;ltid=3458;domid=593;anc_id=22985;countday=undefined;cmetric=1;wlangID=24;color=137AE9;wwidth=160;header_color=ffffff;text_color=333333;link_color=08488D;border_form=1;footer_color=ffffff;footer_text_color=333333;transparent=0;v=0.0.1";widgetSrc += ';ref=' + widgetUrl;widgetSrc += ';rand_id=2136';var weatherBookedScript = document.createElement("script"); weatherBookedScript.setAttribute("type", "text/javascript"); weatherBookedScript.src = widgetSrc; document.body.appendChild(weatherBookedScript) </script><!-- weather widget end -->



	<script>
	
		function addComment() {
			
			$.ajax({
				type: 'POST',
				url: '/tripnow/home/addcommentok.do',
				data: $('#addCommentForm').serialize(),
				dataType: 'json',
				success: function(result) {
					if (result.result == "1") {
						
						let temp= `<div class="homereview">
							<div>
								<span>작성자 : \${result.id}</span>
								<span style="float: right">등록일 : \${result.regdate}</span>
							</div>
							<div id="reviewall">
								<span class="star\${result.star}"></span>
							</div>
							<span class="reviewnumber">\${result.star}</span>
							<div class="reviewcontent">
								\${$('[name=content]').val()}
								<span class="spanright">
									<span class="btnspan"><a href="#!" onclick="delcomment(\${result.seq});">[삭제]</a></span>
									<span class="btnspan"><a href="#!" onclick="editcomment(\${result.seq});">[수정]</a></span>
								</span>
							</div>
						</div>`;
						
						if($('.homereview').length == 0) {
							append('<div class="homereview"></div>');
						}
						
						$('#reviewbox').prepend(temp);
						
						$('[name=content]').val('');
						
						$('#addCommentForm').remove();
					}
				}, error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
			}
			function delcomment(seq) {
				
				let tr = $(event.target).parent().parent().parent().parent();
				
				if (confirm('정말 삭제하시겠습니까?')) {
					
					$.ajax({
						type: 'POST',
						url: '/tripnow/home/delcommentok.do',
						data: 'seq=' + seq,
						dataType: 'json',
						success: function(result) {
							
							if (result.result == "1") {
								tr.remove();
							} else {
								alert('댓글 삭제 오류!!');
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
					
					const tempStr = $(event.target).parent().parent().parent().children(":first").text();
					
					console.log($(event.target).parent().parent().parent().children(":first").text());
					
					$(event.target).parent().parent().parent().after(temp);
					
					isEdit = true;
					
					$(event.target).parent().parent().parent().next().find('textarea').val(tempStr);
					$(event.target).parent().parent().parent().next().find('input[name=seq]').val(seq);
				}
				
			}
			
			const temp = `<tr id='editRow' style="background-color: #CDCDCD;">
				<td>
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
		};
			
			
			function editComment() {
				
				$.ajax({
					
					type: 'POST',
					url: '/tripnow/home/editcommentok.do',
					data: $('#editCommentForm').serialize(),
					dataType: 'json',
					success: function(result) {
						
						if (result.result == "1") {
							
							$('#editRow').prev().children().eq(0).text($('#txtcontent').val());
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
		
			
			$(".booking").click(function(event) {
		 		var aaa = event.target + "&loca=" + $("#loca").val() + "&dates=" + $(".flatpickr-input").val() + "&count=" + $(".count").val();
		 		$(".booking").attr("href", aaa);;
		 	});
	
	</script>

</body>
</html>














