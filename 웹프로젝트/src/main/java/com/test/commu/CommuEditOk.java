package com.test.commu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/commu/commueditok.do")
public class CommuEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		CommuDTO dto = new CommuDTO();
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setContent(content);
		
		CommuDAO dao = new CommuDAO();
		
		int result = dao.editCommu(dto);
		
		if (result == 1) {
			resp.sendRedirect("/tripnow/commu/commu.do");
		} else {
			resp.sendRedirect("/tripnow/commu/commu.do");
		}
		
		
		req.setCharacterEncoding("UTF-8");


	}

}
