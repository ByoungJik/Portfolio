package com.test.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home/addcommentok.do")
public class AddCommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String content = req.getParameter("content");
		String hseq = req.getParameter("hseq");
		String star = req.getParameter("star");
		
		HomeReviewListDTO dto = new HomeReviewListDTO();
		
		dto.setId((String)session.getAttribute("auth"));
		dto.setHseq(hseq);
		dto.setStar(star);
		dto.setContent(content);
		
		HomeDAO dao = new HomeDAO();
		
		int result = dao.addComment(dto);
		
		HomeReviewListDTO temp = dao.getComment();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"result\": %d,", 		result);
		writer.printf("\"seq\": %s,", 			temp.getSeq());
		writer.printf("\"id\": \"%s\",", 		temp.getId());
	    writer.printf("\"star\": \"%s\",", 		temp.getStar());
		writer.printf("\"regdate\": \"%s\"", 	temp.getRegdate());
		writer.print("}");
		
		writer.close();

	}

}
