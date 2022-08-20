package com.test.partner;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/partner/editact.do")
public class EditAct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		ActOptionDTO actoption = new ActOptionDTO();
		
		actoption = dao.getActOption(seq);
		
		ArrayList<ActOptionDTO> pathlist = new ArrayList<ActOptionDTO>();
		
		pathlist = dao.getPathList(seq);
		
		req.setAttribute("actoption", actoption);
		req.setAttribute("pathlist", pathlist);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/editact.jsp");

		dispatcher.forward(req, resp);
	}

}

