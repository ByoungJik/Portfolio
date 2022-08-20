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
	.main {
		width: 1060px;
	}

	/*    제목 */
	h2 {
		text-align: center;
	}

	.fa-solid {
		margin-right: 10px;
	}

	/*    테이블 */
	#acttable {
		width: 995px;
		margin: auto;
		margin-top: 25px;
	}
	
	.acttable1 {
		width: 995px;
		margin: auto;
		margin-top: 25px;
	}
	
	#acttable>tbody>tr>td {
		vertical-align: middle;
	}
	
	#acttable>tbody>tr>th {
		margin-left: 10px;
		width: 220px;
		height: 60px;
		vertical-align: middle;
	}

	/* 테이블 폰트 사이즈 */
	form {
		font-size: 21px;
	}

	#info {
		background-color: #ccc;
		margin-left: 35px;
		font-size: 30px;
		border-bottom: 1px solid;
		width: 123px;
	}

	/* 이미지 컨테이너 */
	#image_container {
		display: flex;
		overflow-x: auto;
		width: 700px;
		height: 205px;
	}

	#image_container>img {
		width: 200px;
		height: 200px;
		margin: 0 15px;
	}
	
	#filelist>div {
		display: flex;
	}
	
	#acttable>tbody>tr:nth-child(4)>td>textarea {
		width: 720px;
		height: 220px;
		resize: none;
	}
	
	.btns {
		float: right;
		margin: 10px 35px 10px;
	}
	
	.ckbox {
		margin-right: 100px;		
	}
	
</style>
</head>
<body>
   <!--  -->
   <main>
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <h2><i class="fa-solid fa-pen-to-square"></i>상품 등록</h2>
    
    
    <form method="POST" action="/tripnow/partner/homeaddplusok.do" class="main" enctype="multipart/form-data">
            
        <div id="info">상품 정보</div>
        
          <table class="table table-bordered acttable1">
          
          	<tr>
          		<th>방 이름</th>
          		<td>
          			<input class="form-control" style="width: 250px;" type="text" name="roomname" placeholder="방이름을 입력하세요." required>
          		</td>
          	</tr>
          
         <!-- 가격등록 -->
           <tr>
              <th>가격</th>
              <td>
                <div style="display:flex; align-items: center;"><input type="text" name="price" class="form-control" style="width: 200px;" required>&nbsp;[원]</div> 
              </td>
           </tr>
           
         <!-- 이미지등록 -->
           <tr>
                <th>상품이미지등록</th>
                <td>
            <div id="image_container"></div>
            <div><input type="file" name="attach1" onchange="setThumbnail(event, 1);"></div>
            <div id="filelist"></div>
            <input type="button" value="이미지 추가하기" class="button gray btnfile">
            </td>        
           </tr>
           
           <tr>
           	<th>배드옵션</th>
           	<td>
           		<label><input type="radio" name="bedoption" value="1"> 일반</label>
           		<label><input type="radio" name="bedoption" value="2"> 트윈</label>
           		<label><input type="radio" name="bedoption" value="3"> 퀸</label>
           		<label><input type="radio" name="bedoption" value="4"> 온돌</label>
           	</td>
           </tr>
           
		<tr>
         	<th>옵션리스트</th>
         	<td>
         		<label class="ckbox"><input type="checkbox" value="y" name="bath"> 욕조 있음</label>
         		<label class="ckbox"><input type="checkbox" value="y" name="pet"> 반려동물 동반 가능</label>
         		<br>
         		<label class="ckbox"><input type="checkbox" value="y" name="smoke"> 흡연 가능</label>
         		<label class="ckbox"><input type="checkbox" value="y" name="cook"> 취사 가능</label>
         		<br>
         		<label class="ckbox"><input type="checkbox" value="y" name="parking"> 주차 가능</label>
         		<label class="ckbox"><input type="checkbox" value="y" name="pool"> 수영장 있음</label>
         		<br>
         		<label class="ckbox"><input type="checkbox" value="y" name="wifi"> 와이파이 이용 가능</label>
         	</td>
       	</tr>
       	
       	<tr>
       		<th>최대수용인원</th>
       		<td>
       			<select name="maxpeople">
					<option value="2">2명</option>       		
					<option value="3">3명</option>       		
					<option value="4">4명</option>       		
					<option value="5">5명</option>       		
					<option value="6">6명</option>       		
       			</select>
       		</td>
       	</tr>
	      		
      	</table>
      	
      	
      	<div id="test"></div>
        
        
        <div class="btns">
         <input type="button" value="돌아가기" class="btn btn-secondary" onClick="history.go(-3)"/>
         <input type="submit" value="등록완료" class="btn btn-primary"/>
        </div>
        
     </form>
      
      
      
    </main>

   <div class="Afooter">
      <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   </div>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c48ad331128302078e60bceb1657db96&libraries=services"></script>
   <script>
   
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
   
    //버튼 추가
   $('.btnfile').click(function() {
      
      let temp = String.format('<div><input type="file" name="attach{0}" onchange="setThumbnail(event, {0});"><span onclick="del({0});">x</span></div>', no, no, no);
      
      $('#filelist').append(temp);
      
     	no++;
      
   });
   
   function del(num) {


      
      $('#img'+num).remove();
      $(event.target).parent().remove();
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
