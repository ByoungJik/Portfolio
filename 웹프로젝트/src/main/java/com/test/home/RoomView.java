package com.test.home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home/roomview.do")
public class RoomView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String loca = req.getParameter("loca");
		String dates = req.getParameter("dates");
		String count = req.getParameter("count");
		
		HomeDAO dao = new HomeDAO();
		
		RoomViewInfoDTO dto = dao.getRoomViewInfo(seq);
		
		ArrayList<RoomPicDTO> plist = dao.getRoomPic(seq);
		
		req.setAttribute("dto", dto);
		
		if (plist != null) { 
			req.setAttribute("plist", plist);
		}
		
		
		req.setAttribute("loca", loca);
		  
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
		
		req.setAttribute("dates", caldto);
		req.setAttribute("count", count);
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/roomview.jsp");

		dispatcher.forward(req, resp);

	}

}
