package com.test.activitiy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.event.CouponDTO;
import com.test.event.EventDAO;

@WebServlet("/activity/act.do")
public class Act extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		
		String Cseq  = req.getParameter("Cseq");
		
		
		CouponDTO Cdto = new CouponDTO(); 
		EventDAO Edao = new EventDAO();
		
		Cdto.setEseq(Cseq);
		
		Cdto = Edao.getEvent(Cdto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/activitypayment.jsp");

		dispatcher.forward(req, resp);
	}

}