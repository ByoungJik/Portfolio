<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripNow(트립나우)</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c48ad331128302078e60bceb1657db96&libraries=services"></script>
<style>

	.main{
		height : 600px;
		width : 1060px;
	}
	
	h2 {
		text-align: center;
		
	}
	
	.fa-solid {
		margin-right : 10px;
	}

	.carname > input {
		height : 30px;
		width : 120px;
		border : none;
	}
	
	.mileage input{
		border : none;
		width : 50px;
		
	}
	
	.price input {
		border : none;
		width : 100px;
	}
	
	.rentstart input, .rentend input {
		border : none;
	}
	
	form {
		font-size: 18px;
	}
	
	.btns {
		float: right;
	}
	
	
	label {
		margin-right : 20px;
	}
	
	label > input[type=radio] {
		margin-right : 5px;
	}
	
	#path {
		border : none;
		width : 92%;
	}
	
</style>
</head>
<body>
	<!--  -->
   <main>
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <form method="POST" action="/tripnow/partner/editcarok.do" class="main" enctype="multipart/form-data">
    	<h2><i class="fa-solid fa-pen-to-square"></i>상품 수정</h2>
     	
     	<table id="table" class="table table-bordered">
	     	<tr>
	     		<th>차량명</th>
	     		<td><div class="carname"><input type="text" name="carname" value="${caroption.carname}"></div></td>
	     	</tr>
	     	
	     	<tr class="feul">
	     		<th>연료</th>
	     		<td>
			     	<label><input type="radio" name="fseq" value="1" 
			     		<c:if test="${caroption.fseq == 1}">checked</c:if>/>가솔린</label>
			     	<label><input type="radio" name="fseq" value="2" 
			     		<c:if test="${caroption.fseq == 2}">checked</c:if>/>디젤</label>
			     	<label><input type="radio" name="fseq" value="3" 
			     		<c:if test="${caroption.fseq == 3}">checked</c:if>/>LPG</label>
			     	<label><input type="radio" name="fseq" value="4" 
			     		<c:if test="${caroption.fseq == 4}">checked</c:if>/>전기</label>
	     		</td>
	     	</tr>
	     	
	     	<tr class="humancount">
	     		<th>탑승 인원</th>
	     		<td>
			     	<label><input type="radio" name="hseq" value="1" 
			     		<c:if test="${caroption.hseq == 1}">checked</c:if>/>2인승</label>
			     	<label><input type="radio" name="hseq" value="2" 
			     		<c:if test="${caroption.hseq == 2}">checked</c:if>/>4인승</label>
			     	<label><input type="radio" name="hseq" value="3" 
			     		<c:if test="${caroption.hseq == 3}">checked</c:if>/>6인승</label>
			     	<label><input type="radio" name="hseq" value="4" 
			     		<c:if test="${caroption.hseq == 4}">checked</c:if>/>8인승</label>
		     		<label><input type="radio" name="hseq" value="5" 
			     		<c:if test="${caroption.hseq == 5}">checked</c:if>/>10인승</label>
		     		<label><input type="radio" name="hseq" value="6" 
			     		<c:if test="${caroption.hseq == 6}">checked</c:if>/>12인승</label>
	     		</td>
	     	</tr>
	     	
	     	<tr class="cartype">
	     		<th>차종</th>
	     		<td>
			     	<label><input type="radio" name="ctseq" value="1" 
			     		<c:if test="${caroption.ctseq == 1}">checked</c:if>/>경차</label>
			     	<label><input type="radio" name="ctseq" value="2" 
			     		<c:if test="${caroption.ctseq == 2}">checked</c:if>/>소형</label>
			     	<label><input type="radio" name="ctseq" value="3" 
			     		<c:if test="${caroption.ctseq == 3}">checked</c:if>/>준중형</label>
			     	<label><input type="radio" name="ctseq" value="4" 
			     		<c:if test="${caroption.ctseq == 4}">checked</c:if>/>중형</label>
		     		<label><input type="radio" name="ctseq" value="5" 
			     		<c:if test="${caroption.ctseq == 5}">checked</c:if>/>고급</label>
		     		<label><input type="radio" name="ctseq" value="6" 
			     		<c:if test="${caroption.ctseq == 6}">checked</c:if>/>승합</label>
	     		</td>
	     	</tr>
	     	
	     	
	     	<tr class="mileage">
	     		<th>연비</th>
	     		<td>
	     			<input type="number" name="mileage" value="${caroption.mileage}">Km/L
	     		</td>
	     	</tr>
	     	<tr class="cartype">
	     		<th>변속 종류</th>
	     		<td>
			     	<label><input type="radio" name="geartype" value="y" 
			     		<c:if test="${caroption.geartype == 'y'}">checked</c:if>/>자동</label>
	   	  			<label><input type="radio" name="geartype" value="n" 
		     			<c:if test="${caroption.geartype == 'n'}">checked</c:if>/>수동</label>
	     		</td>
	   		</tr>
	   		<tr>
	   			<th>주소</th>
	   			<td>
                	<div style="display: flex;">
                		<input class="form-control" value="${caroption.location}"style="width: 300px;" type="text" name="location" id="sample5_address" placeholder="주소" readonly required="required">&nbsp;
               			<input class="btn btn-primary" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
            		</div>
            		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>             
                </td>
	   		</tr>
	     	<tr class="price">
	     		<th>가격</th>
	     		<td>
		     		₩<input type="text" id="price" name="price" value="${caroption.price}">
	     		</td>
     		</tr>
	     	<tr class="rentstart">
	     		<th>대여 시간</th>
	     		<td>
		     		<input type="time" id="rentstart" name="rentstart" value="${caroption.rentstart}">
	     		</td>
	     	</tr>
	     	<tr class="rentend">
	     		<th>반납 시간</th>
	     		<td>
		     		<input type="time" id="rentend" name="rentend" value="${caroption.rentend}">
	     		</td>
	     	</tr>
	     	<tr class="path">
	     		<th>사진</th>
	     		<td>
	     			<input type="file" name="newpath" class="form-control">
						
					<div style="margin: 7px 12px 3px 12px;">
						<c:if test="${not empty caroption.path}">
						파일명: <input id="path" name="path" value="${caroption.path}" readonly/><span onclick="delfile();" style="cursor:pointer;">&times;</span>
						</c:if>
						
						<c:if test="${empty caroption.path}">
						파일명: 파일 없음
						</c:if>
					</div>
				</td>
	     	</tr>
	     	
     	
     	</table>
     	
     	<div class="btns">
			<input type="button" value="돌아가기" id="back" class="btn btn-secondary"/>
	     	<input type="submit" value="수정하기" class="btn btn-primary"/>
     	</div>
     	
     	<input type="hidden" name="seq" value="${caroption.seq}">
     	
     </form>
      
      
      
    </main>
   	    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   	    
   	    
    <script>
    	
    	$('#back').click(function() {
		   location.href = '/tripnow/partner/mylist.do';
	   });
    
	    function delfile() {
			if ($('#filename').css('text-decoration').indexOf('line-through') == -1) {
				$('#filename').css('text-decoration', 'line-through');
				$('input[name=delfile]').val('y');
			} else {
				$('#filename').css('text-decoration', 'none');
				$('input[name=delfile]').val('n');
			}
		}
	    
	  	//지도 
		    
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	     mapOption = {
	         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	         level: 5 // 지도의 확대 레벨
	     };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	    
	    
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	    
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	    
	                        var result = results[0]; //첫번째 결과의 값을 활용
	    
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
    
    </script>


</body>
</html>

















