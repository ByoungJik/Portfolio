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

 body > main {
   height:700px;

   
   }
   

body > main >#Nback {
   position:  relative;

   border-radius: 8px;
   
   background-image: url("/tripnow/images/jeju.jpg"); 
   background-repeat: no-repeat;
   background-size: 1060px;
   background-position: center center;
   height: 620px;
   width: 1060px;
   
   
   top:-25px;
   
   
   }
 
   

</style>
</head>
<body>
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <div id="Nback">
      
          <div class="Asubtext">
                <p>당장 떠나세요</p>
          </div>
          
          <div class="Amaintext">
                <p>Trip Now!!</p>
          </div>

         <div class="Abar">
            <%@ include file="/WEB-INF/views/activity/mainmenubar.jsp" %>
         </div>   
      
      
      </div>      
   </main>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
   <script>
   
   $('#example .dropdown-menu li > a').bind('click', function (e) {    
      var html = $(this).html();    
      $('#example button.dropdown-toggle').html('<input type="hidden" name="region" value="'+html+'" />'+html + ' <span class="caret"></span>');
      });
   
   
   </script>

</body>
</html>












