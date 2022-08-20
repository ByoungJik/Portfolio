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

	.homename > input, .roomname > input {
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
	
	.period input {
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
	
	#path, #fpath {
		border : none;
		width : 100%;
	}
	
	th {
		width : 125px;
	}
	
	#content {
		width : 100%;
		height : 300px;
		resize: none;
	}
	
      /*       이미지 컨테이너 */
      
      #image_container {
          display: flex;
          overflow-x: auto;
      }
      
      #image_container > img {
         width: 200px;
         height: 200px;
          margin: 0 15px;
      }
      #filelist > div{
         display : flex;
      }
      
      .options input[type=number] {
		width : 50px;
      	margin-left : 15px;
      	
      }
      
      .options input[type=checkbox]:first-child{
      	margin-left : 0px;
      }
      
      .options input[type=checkbox], .options select {
      	margin-left : 15px;
      }
	
	
</style>
</head>
<body>
	<!--  -->
   <main>
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <form method="POST" action="/tripnow/partner/edithomeok.do" class="main" enctype="multipart/form-data">
    	<h2><i class="fa-solid fa-pen-to-square"></i>상품 수정</h2>
     	
		<table id="table" class="table table-bordered">
	     	<tr>
	     		<th>숙소명</th>
	     		<td><div class="homename"><input type="text" name="homename" value="${homeoption.hname}" readonly></div></td>
	     	</tr>
	     	<tr>
	     		<th>방 이름</th>
	     		<td><div class="roomname"><input type="text" name="roomname" value="${homeoption.rname}"></div></td>
	     	</tr>
	     	<tr>
	   			<th>주소</th>
	   			<td>
                	<div style="display: flex;">
                		<input class="form-control" value="${homeoption.location}"style="width: 300px;" type="text" name="location" id="sample5_address" placeholder="주소" readonly required="required">&nbsp;
               			<input class="btn btn-primary" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
            		</div>
            		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>             
                </td>
	   		</tr>
	   		<tr class="price">
	     		<th>가격</th>
	     		<td>
		     		₩<input type="text" id="price" name="price" value="${homeoption.price}">
	     		</td>
     		</tr>
     		<tr class="enterhome">
	     		<th>체크인 시간</th>
	     		<td>
		     		<input type="time" id="enterhome" name="enterhome" value="${homeoption.enterhome}">
	     		</td>
	     	</tr>
	     	<tr class="outerhome">
	     		<th>체크아웃 시간</th>
	     		<td>
		     		<input type="time" id="outerhome" name="outerhome" value="${homeoption.outerhome}">
	     		</td>
	     	</tr>
	     	<tr class="options">
	     		<th>옵션</th>
	     		<td>
					<input type="checkbox" name="bath" id="bath"
						<c:choose>
							<c:when test="${homeoption.bath == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>욕조
					<input type="checkbox" name="pet" id="pet" 
						<c:choose>
							<c:when test="${homeoption.pet == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>반려동물
					<input type="number" min="2" name="maxpeople" id="maxpeople" value="${homeoption.maxpeople}"/>최대인원
					<input type="checkbox" name="smoke" id="smoke"
						<c:choose>
							<c:when test="${homeoption.smoke == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>흡연
					<input type="checkbox" name="pool" id="pool"
						<c:choose>
							<c:when test="${homeoption.pool == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>수영장
					<input type="checkbox" name="parking" id="parking"
						<c:choose>
							<c:when test="${homeoption.parking == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>주차
					<input type="checkbox" name="cook" id="cook" 
						<c:choose>
							<c:when test="${homeoption.cook == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>취사
					<input type="checkbox" name="wifi" id="wifi"
						<c:choose>
							<c:when test="${homeoption.wifi == 'y'}">value="y" checked</c:when>
							<c:otherwise>value="n"</c:otherwise>
						</c:choose>/>와이파이 
					<select name="bval">
					  <option value="일반" <c:if test="${homeoption.bval == '일반'}">selected="selected"</c:if>>일반</option>
					  <option value="트윈" <c:if test="${homeoption.bval == '트윈'}">selected="selected"</c:if>>트윈</option>
					  <option value="퀸" <c:if test="${homeoption.bval == '퀸'}">selected="selected"</c:if>>퀸</option>
					  <option value="온돌" <c:if test="${homeoption.bval == '온돌'}">selected="selected"</c:if>>온돌</option>
					</select>
					베드옵션
	     		</td>
	     	</tr>
	     	<tr class="mainpath">
	     		<th>썸네일 사진</th>
	     		<td>
	     			<input type="file" name="newpath" class="form-control">
						
					<div style="margin: 7px 12px 3px 12px;">
						<c:if test="${not empty homeoption.path}">
						파일명: <input id="path" name="path" value="${homeoption.path}" readonly/><span onclick="delfile();" style="cursor:pointer;">&times;</span>
						</c:if>
						
						<c:if test="${empty homeoption.path}">
						파일명: 파일 없음
						</c:if>
					</div>
				</td>
	     	</tr> 
	     	<tr class="mainpath">
	     		<th>세부 사진</th>
				<td>
					<div style="margin: 7px 12px 3px 12px;">
						기존 파일명: (이미지 추가 시 해당 파일들은 삭제됩니다.)
						<div>
						<c:forEach items="${pathlist}" var="dto">
						<c:if test="${not empty dto.fpath}">
						<input id="fpath" name="fpath" value="${dto.fpath}" readonly/>
						</c:if>
						
						<c:if test="${empty dto.fpath}">
						기존 파일명: 파일 없음
						</c:if>
						</c:forEach>
						</div>
					</div>
		            <div id="image_container"></div>
		            <div><input type="file" id="fileselect" name="attach1" onchange="setThumbnail(event, 1);"></div>
		            <div id="filelist"></div>
		            <input type="button" value="이미지 추가하기" class="button gray" id="btnfile">    
	            </td>     
	     	</tr> 
     	</table> 
     	
     	<div class="btns">
			<input type="button" value="돌아가기" id="back" class="btn btn-secondary"/>
	     	<input type="submit" value="수정하기" class="btn btn-primary"/>
     	</div>
     	
     	<input type="hidden" name="seq" value="${homeoption.seq}">
     	<input type="hidden" name="temp" id="temp" >
     	
     </form>
      
      
      
    </main>
   	    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   	    
   	    
    <script>
	   
    	$('.options input[type=checkbox]').change(function() {
   			if ($(event.target).is(":checked")) {
   				$(event.target).val('y');
   			} else {
   				$(event.target).val('n');
   			}
    	});
    
	   //이미지 미리보기, 파일 업로드 삭제하면 사진 미리보기도 같이 삭제시키기
	    function setThumbnail(event, num) {
	        var reader = new FileReader();
	      if (document.getElementById("img"+num)){
	         document.getElementById("img"+num).remove();
	      }
	        reader.onload = function(event) {
	          var img = document.createElement("img");
	          img.setAttribute("src", event.target.result);
	          img.setAttribute("id", "img" + num);
	          document.querySelector("div#image_container").appendChild(img);
	        };
	
	        reader.readAsDataURL(event.target.files[0]);
	      }
	
	    String.format = function() {
	        var theString = arguments[0];
	        for (var i = 1; i < arguments.length; i++) {
	            var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
	            theString = theString.replace(regEx, arguments[i]);
	        }
	        
	        return theString;
	    }
	
	    let no = 2;
	   
	    $('#fileselect').click(function() {
	    	$('#fpath').parent().remove();
	    	$('#temp').val('1');
	    });
	    
	    //버튼 추가
	   $('#btnfile').click(function() {
	      
	      let temp = String.format('<div><input type="file" name="attach{0}" onchange="setThumbnail(event, {0});"><span onclick="del({0});">x</span></div>', no, no, no);
	      
	      $('#filelist').append(temp);
	      
	      no++;
	      
	   });
	   
	   function del(num) {
	
	
	      
	      $('#img'+num).remove();
	      $(event.target).parent().remove();
	   }
	   
	   $('#back').click(function() {
		   location.href = '/tripnow/partner/mylist.do';
	   });
	   
	
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

















