package com.test.commu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/commu/addcommucomment.do")
public class AddCommuComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String content = req.getParameter("comment");
		String bseq = req.getParameter("bseq");
		
		CommuCommentDTO dto = new CommuCommentDTO();
		
		dto.setContent(content);
		dto.setBseq(bseq);
		dto.setId((String)session.getAttribute("auth"));
		
		CommuDAO dao = new CommuDAO();
		
		int result = dao.addCommuComment(dto);
		
		CommuCommentDTO temp = dao.getComment();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"result\": %d,", result);
		writer.printf("\"seq\": %s,", temp.getSeq());
		writer.printf("\"id\": \"%s\",", temp.getId());
		writer.printf("\"content\": \"%s\",", temp.getContent());
		writer.printf("\"bseq\": %s,", temp.getBseq());
		writer.printf("\"regdate\": \"%s\"", temp.getRegdate());
		writer.print("}");
		
		writer.close();
		
	}

}
