package com.test.commu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/commu/delcommuok.do")
public class DelCommuOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		dao.delCommentSEQ(seq);
		
		int result = dao.delCommu(seq);
		
		if (result == 1) {
			resp.sendRedirect("/tripnow/commu/commu.do");
		} else {
			resp.sendRedirect("/tripnow/commu/commu.do");
		}
	
	}

}