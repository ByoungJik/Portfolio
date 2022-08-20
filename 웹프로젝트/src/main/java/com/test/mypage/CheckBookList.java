package com.test.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/checkbooklist.do")
public class CheckBookList extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String id = req.getParameter("id");
		int result;
		
		MyDAO dao = new MyDAO();
		
		int homeResult = dao.checkList(id, "home");
		int carResult = dao.checkList(id, "car");
		int actResult = dao.checkList(id, "activity");
		
	    if (homeResult != 0 || carResult != 0 || actResult != 0) {
	        result = 1;
	     } else {
	        result = 0;
	     }
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();

		writer.printf("{ \"result\": %d }", result);
		
		writer.close();
		

	}

}