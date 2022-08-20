package com.test.activitiy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/activity/actaddcommentajajaxok.do")
public class ActAddCommentajAjaxok extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//아이디 받기?
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		
		//리뷰글 번호
		String aseq    = req.getParameter("seq");
		//댓글 내용
		String content = req.getParameter("content");
		
		
		//DTO 만들고 안에 아이디, 리뷰글 번호 , 내용 넣기
		ActReviewDTO dto = new ActReviewDTO();
		
		dto.setId((String)session.getAttribute("auth"));
		
		
		dto.setContent(content);
		dto.setAseq(aseq);
		
		ActivityDAO dao = new ActivityDAO();
		
		int result = dao.addReview(dto);
		
		
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/actaddcommentajajaxok.jsp");

		dispatcher.forward(req, resp);
	}

}

























