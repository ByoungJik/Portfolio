package com.test.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/qnaview.do")
public class QnAView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String seq = req.getParameter("seq");
		String isNotice = req.getParameter("notice");
		String nowPage = req.getParameter("page");
		
		
		QnADTO dto = new QnADTO();
		MyDAO dao = new MyDAO();
		
		dto = dao.getQnAView(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("isNotice", isNotice);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/qnaview.jsp");
		dispatcher.forward(req, resp);

	}

}