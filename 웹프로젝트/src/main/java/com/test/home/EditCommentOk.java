package com.test.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home/editcommentok.do")
public class EditCommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		String content = req.getParameter("content");
		
		HomeReviewListDTO dto = new HomeReviewListDTO();
		
		dto.setSeq(seq);
		dto.setContent(content);
		
		HomeDAO dao = new HomeDAO();
		
		int result = dao.edithComment(dto);
				
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d }", result);
		
		writer.close();

	}

}
