package com.test.event;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/event/couponadd.do")
public class CouponAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		req.setCharacterEncoding("UTF-8");
		
		
		String userid = req.getParameter("userid");
		String seq	  = req.getParameter("seq");
		
		
		EventMainDTO dto = new EventMainDTO();
		EventDAO	 dao = new EventDAO();
		
		dto.setSeq(seq);
		dto.setUserid(userid);
		
		String result = dao.getCoupon(dto);
		
		
		
		resp.setCharacterEncoding("UTF-8"); //브라우저에게 전달
		resp.setContentType("text/plain");
		
		PrintWriter writer = resp.getWriter();

		writer.printf("%s", result);
		
		writer.close();
	}

}

















