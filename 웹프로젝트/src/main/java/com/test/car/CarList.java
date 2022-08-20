package com.test.car;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.test.CalDTO;

@WebServlet("/car/carlist.do")
public class CarList extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		
		req.setCharacterEncoding("UTF-8");
	      
	    String loca = req.getParameter("loca");
		String dates = req.getParameter("dates");
		String count = req.getParameter("count");
		String hiddendate = req.getParameter("hiddendate");
		 
		req.setAttribute("loca", loca);
		
		String[] localist = loca.split(" ");
		
		String sido = localist[0];
		
		sido = sido.replace("특별", "");
		sido = sido.replace("광역", "");
		String[] gudong = localist[1].split("/");
		
		  
		String startYear = dates.split(" ~ ")[0].split("-")[0];
		String startMonth = dates.split(" ~ ")[0].split("-")[1];
		String startDay = dates.split(" ~ ")[0].split("-")[2];
		
		String endYear = dates.split(" ~ ")[1].split("-")[0];
		String endMonth = dates.split(" ~ ")[1].split("-")[1];
		String endDay = dates.split(" ~ ")[1].split("-")[2];
		  
		CalDTO caldto = new CalDTO();
		
		caldto.setStartYear(startYear);
		caldto.setStartMonth(startMonth);
		caldto.setStartDay(startDay);
		  
		caldto.setEndYear(endYear);
		caldto.setEndMonth(endMonth);
		caldto.setEndDay(endDay);
		  
		String startDate = caldto.getStartYear() + caldto.getStartMonth() + caldto.getStartDay();
		String endDate = caldto.getEndYear() + caldto.getEndMonth() + caldto.getEndDay();
		
		CarDAO dao = new CarDAO();
		
		
		
		HashSet<CarDTO> clist = dao.list(sido, gudong, startDate, endDate);
		
		ArrayList<CarAvgCountDTO> rclist = dao.rclist();
		
		ArrayList<CarDTO> list = new ArrayList<CarDTO>(clist);
		
		Collections.sort(list, new Comparator());
		
		
		req.setAttribute("list", list);
		req.setAttribute("rclist", rclist);
		
		if (hiddendate.equals("")) {
			req.setAttribute("dates", caldto);
		} else {
			req.setAttribute("dates", caldto);
		}
		     	
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/car/carlist.jsp");

		dispatcher.forward(req, resp);
	}

}























































