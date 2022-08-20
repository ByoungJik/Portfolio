package com.test.partner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/partner/replyviewdetail.do")
public class ReplyViewDetail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(); 
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String category = req.getParameter("category");
		String id = (String)session.getAttribute("auth");
		
		PartnerDAO dao = new PartnerDAO();
		ReviewDTO dto = new ReviewDTO();
		
		dto.setSeq(seq);
		dto.setName(name);


		if(category.equals("1")) {
			
			dto = dao.getActReview(dto);
			
		}else if(category.equals("2")) {
			
			dto = dao.getHomeReview(dto);
			
		}else{
			
			dto = dao.getCarReview(dto);
			
		}
		
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("category", category);
		req.setAttribute("id", id);
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/replyviewdetail.jsp");

		dispatcher.forward(req, resp);
	}

}