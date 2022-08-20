package com.test.car;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.home.HomeDAO;
import com.test.home.HomeReviewListDTO;

@WebServlet("/car/editcommentok.do")
public class EditCommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String content = req.getParameter("editComment");
		String id = req.getParameter("id");
		
		ReviewDTO dto = new ReviewDTO();

		dto.setId(id);
		dto.setContent(content);
		
		CarDAO dao = new CarDAO();
		
		int result = dao.editComment(dto);
				
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d }", result);
		
		writer.close();

	}

}
