package com.test.commu;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/commu/commuview.do")
public class CommuView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		req.setCharacterEncoding("UTF-8");
		
		CommuDAO dao = new CommuDAO();
		
		if (session.getAttribute("read") == null || session.getAttribute("read").toString().equals("n")) {
			dao.updateReadcount(seq);
			session.setAttribute("read", "y");
		}
		
		CommuDTO boxdto = new CommuDTO();
		boxdto.setSeq(seq);
		boxdto.setId((String)session.getAttribute("auth"));
		
		CommuDTO dto = dao.getview(boxdto);
		
		ArrayList<CommuDTO> cclist = dao.listComment(seq);

		for (CommuDTO cdto : cclist) {
			cdto.setContent(cdto.getContent().replace("\r\n", "<br>"));
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("cclist", cclist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/commu/commuview.jsp");

		dispatcher.forward(req, resp);

	}

}