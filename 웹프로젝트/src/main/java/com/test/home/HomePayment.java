package com.test.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home/homepayment.do")
public class HomePayment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String auth = (String)session.getAttribute("auth");
		String dates = req.getParameter("dates");
		
		String startDate = dates.split(",")[0].substring(17) + "/" + dates.split(",")[1].substring(12) + "/" + dates.split(",")[2].substring(10);
		String endDate = dates.split(",")[3].substring(9) + "/" + dates.split(",")[4].substring(10) + "/" + dates.split(",")[5].substring(8, 10);
		
		HomeDAO dao = new HomeDAO();
		
		HomeBookPayDTO dto = dao.homebookpay(seq);
		BookUserDTO udto = dao.getUserInfo(auth);
		
		req.setAttribute("dto", dto);
		req.setAttribute("udto", udto);
		req.setAttribute("auth", auth);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		req.setAttribute("dates", dates);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/homepayment.jsp");

		dispatcher.forward(req, resp);

	}

}
