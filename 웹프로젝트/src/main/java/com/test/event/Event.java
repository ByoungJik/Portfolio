package com.test.event;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/event/event.do")
public class Event extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		
		String auth	   = (String)session.getAttribute("auth");
		
		req.setAttribute("auth", auth);
		
		req.setCharacterEncoding("UTF-8");
		
		EventDAO dao = new EventDAO();
		
		ArrayList<EventMainDTO> list = dao.eventlist();
		
		
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/event/event.jsp");

		dispatcher.forward(req, resp);
	}

}
