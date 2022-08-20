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

@WebServlet("/home/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//오라클에서 해당 정보를 가진 값들을 가져오기 위한 정보
		String seq = req.getParameter("seq");
		String loca = req.getParameter("loca");
		String dates = req.getParameter("dates");
		String count = req.getParameter("count");
		String hiddendate = req.getParameter("hiddendate");
		
		HomeDAO dao = new HomeDAO();
		
		RoomInfoMainDTO rimdto = dao.homeroominfoone(seq);
		HomeOptionDTO rldto = dao.homeoption(seq);
		
		String id = ((String)session.getAttribute("auth"));
		String bookid = dao.getCommentAvail(seq, id);
		
		
		ArrayList<RoomListDTO> rolist = dao.roomlist(seq);
		ArrayList<HomeReviewListDTO> hrlist = dao.homeReviewList(seq);
		
		
		  req.setAttribute("loca", loca);
		  
		  CalDTO caldto = new CalDTO();
		  
		  
		  String startYear = dates.split(" ~ ")[0].split("-")[0]; String startMonth =
		  dates.split(" ~ ")[0].split("-")[1]; String startDay =
		  dates.split(" ~ ")[0].split("-")[2];
		  
		  String endYear = dates.split(" ~ ")[1].split("-")[0]; String endMonth =
		  dates.split(" ~ ")[1].split("-")[1]; String endDay =
		  dates.split(" ~ ")[1].split("-")[2];
		  
		  
		  caldto.setStartYear(startYear); caldto.setStartMonth(startMonth);
		  caldto.setStartDay(startDay);
		  
		  caldto.setEndYear(endYear); caldto.setEndMonth(endMonth);
		  caldto.setEndDay(endDay);
		  
		  req.setAttribute("dates", caldto); req.setAttribute("count", count);
		  
		req.setAttribute("rimdto", rimdto);
		req.setAttribute("rldto", rldto);
		req.setAttribute("rolist", rolist);
		req.setAttribute("hrlist", hrlist);
		req.setAttribute("seq", seq);
		req.setAttribute("bookid", bookid);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/view.jsp");

		dispatcher.forward(req, resp);

	}

}
