package com.test.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/qnaaddok.do")
public class QnaAddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String category = req.getParameter("category");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		QnADTO dto = new QnADTO();
		MyDAO dao = new MyDAO();
		
		dto.setId((String)session.getAttribute("auth"));
		dto.setCategory(category);
		dto.setQsubject(subject);
		dto.setQcontent(content);
		
		int result = dao.addQuestion(dto); 
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/qnaaddok.jsp");
		dispatcher.forward(req, resp);

	}

}
