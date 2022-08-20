package com.test.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/unregistercheck.do")
public class UnregisterCheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String id = req.getParameter("id");
		
		BookDTO dto = new BookDTO();
		MyDAO dao = new MyDAO();
		
		ArrayList<BookDTO> homeList = new ArrayList<BookDTO>();
		ArrayList<BookDTO> carList = new ArrayList<BookDTO>();
		ArrayList<BookDTO> actList = new ArrayList<BookDTO>();

		homeList = dao.getHomeBookingList(id, "hb");
		carList = dao.getCarBookingList(id, "cb");
		actList = dao.getActBookingList(id, "ab");
		
		System.out.println(homeList);
		System.out.println(carList);
		System.out.println(actList);
		
		
		req.setAttribute("homeList", homeList);
		req.setAttribute("carList", carList);
		req.setAttribute("actList", actList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/unregistercheck.jsp");
		dispatcher.forward(req, resp);

	}

}