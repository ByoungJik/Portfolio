package com.test.car;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.test.CalDTO;

@WebServlet("/car/carview.do")
public class CarView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("auth");
		
		
		req.setCharacterEncoding("UTF-8");
		  
		String loca = req.getParameter("loca");
		String dates = req.getParameter("dates");
		 
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
		
		String seq = req.getParameter("seq");
		
		CarDAO dao = new CarDAO();
	
		HashSet<CarDTO> option = dao.seachcar(seq);
		ArrayList<CarAvgCountDTO> rclist = dao.vrclist(seq);
		
		
		req.setAttribute("rclist", rclist);
		req.setAttribute("list", option);
		
		req.setAttribute("dates", caldto);
		
		ArrayList<ReviewDTO> review = dao.review(seq);
		
		req.setAttribute("review", review);
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/car/carview.jsp");

		dispatcher.forward(req, resp);
	}

}

