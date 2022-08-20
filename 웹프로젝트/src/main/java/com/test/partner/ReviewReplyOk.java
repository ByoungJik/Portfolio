package com.test.partner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/partner/reviewreplyok.do")
public class ReviewReplyOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession(); 
		
		req.setCharacterEncoding("UTF-8");
		
		String rseq = req.getParameter("rseq");
		String category = req.getParameter("category");
		String id = (String)session.getAttribute("auth");
		String content = req.getParameter("content");
		
		ReviewReplyDTO dto = new ReviewReplyDTO();
		PartnerDAO dao = new PartnerDAO();
		
		dto.setContent(content);
		dto.setId(id);
		dto.setCategory(category);
		dto.setSeq(rseq);
		
		int result = dao.reviewReply(dto);
		
		req.setAttribute("result", result);
		
		


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/reviewreplyok.jsp");

		dispatcher.forward(req, resp);
	}


}
































