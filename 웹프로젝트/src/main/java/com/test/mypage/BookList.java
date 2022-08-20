package com.test.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/booklist.do")
public class BookList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		MyDAO dao = new MyDAO();
		
		ArrayList<BookDTO> homeList = new ArrayList<BookDTO>();
		ArrayList<BookDTO> carList = new ArrayList<BookDTO>();
		ArrayList<BookDTO> actList = new ArrayList<BookDTO>();

		homeList = dao.getHomeBookingList(id, "");
		carList = dao.getCarBookingList(id, "");
		actList = dao.getActBookingList(id, "");

		req.setAttribute("homeList", homeList);
		req.setAttribute("carList", carList);
		req.setAttribute("actList", actList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/booklist.jsp");
		dispatcher.forward(req, resp);

	}

}
