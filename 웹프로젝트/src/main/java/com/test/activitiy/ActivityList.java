package com.test.activitiy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/activity/activitylist.do")
public class ActivityList extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      
	   
	   
	   
      //ActivityList.java
      req.setCharacterEncoding("UTF-8");
      
      String region = req.getParameter("region");
      String date   = req.getParameter("date");
      String count  = req.getParameter("count");
      String city;
      String county;
      
      ActivityDTO dto = new ActivityDTO();
      ActivityDAO dao = new ActivityDAO();
      
      date = date.substring(0,10);
      
      if(region.contains(" ")) {
         
         String[] regionList = region.split(" ");
          city = regionList[0];
          county = regionList[1];

          dto.setDate(date);
          dto.setCount(count);
          dto.setCity(city);
          dto.setCounty(county);
          dto.setRegion(region);
          
          
      }else {
      
	      //시,도 만 받았을때
	      dto.setCount(count);
	      dto.setDate(date);
	      dto.setRegion(region);
      }
      
      // 메뉴바에 넘겨줄 것
      req.setAttribute("region", region);
      req.setAttribute("date", date);
      req.setAttribute("count", count);
      
      // 리스트 dto 불러오기
      ArrayList<ActivityDTO> list = dao.list(dto);
      
      // 글자수 22넘으면 ... 처리
      for(ActivityDTO listdto : list) {
    	  
    	  if(listdto.getName().length() > 22) {
    		  listdto.setName(listdto.getName().substring(0,22) + "..");
    	  }
  
      }

      
      req.setAttribute("list", list);
      

      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/activitylist.jsp");
     
      dispatcher.forward(req, resp);
   }

}