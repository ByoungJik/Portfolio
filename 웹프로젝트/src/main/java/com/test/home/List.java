package com.test.home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home/list.do")
public class List extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		//오라클에서 해당 정보를 가진 값들을 가져오기 위한 정보
		String loca = req.getParameter("loca");
		String dates = req.getParameter("dates");
		String count = req.getParameter("count");
		String hiddendate = req.getParameter("hiddendate");
		String catesel = req.getParameter("catesel");
		
		String locasplit = loca.split("/")[0];
		
		if (catesel == null) {
			catesel = "모텔";
		}
		
		//오라클에서 날짜 조회를 위한 부분
		String substart = req.getParameter("dates");
		String subend = req.getParameter("dates");
		
		//오라클에서 날짜 조회를 하기 위해 split
		substart = substart.split(" ~ ")[0];
		subend = subend.split(" ~ ")[1];
		
		
		//조회에 필요한 정보를 담은 부분
		HomeSearchDTO dto = new HomeSearchDTO();
		dto.setLoca(locasplit);
		dto.setSubstart(substart);
		dto.setSubend(subend);
		dto.setCount(count);
		dto.setValue(catesel);
		
		HomeDAO dao = new HomeDAO();
		
		ArrayList<HomeSearchInfoDTO> hif = dao.homelistSearch(dto);
		
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
		
		if (hiddendate.equals("")) {
			req.setAttribute("dates", caldto);
		} else {
			req.setAttribute("dates", caldto);
		}
			
			
		req.setAttribute("loca", loca);
		req.setAttribute("count", count);
		req.setAttribute("hif", hif);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/list.jsp");

		dispatcher.forward(req, resp);

	}

}








