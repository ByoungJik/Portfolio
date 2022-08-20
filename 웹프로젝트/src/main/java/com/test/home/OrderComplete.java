package com.test.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home/ordercomplete.do")
public class OrderComplete extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String dates = req.getParameter("dates");
		String auth = (String)session.getAttribute("auth");
		
		String sellerid = req.getParameter("sellerid");

		String price = req.getParameter("price");
		String name = req.getParameter("name");
		String enter = req.getParameter("enter");
		String outer = req.getParameter("outer");

			
		String startDate = dates.split(",")[0].substring(17) + "/" + dates.split(",")[1].substring(12) + "/" + dates.split(",")[2].substring(10);
		String endDate = dates.split(",")[3].substring(9) + "/" + dates.split(",")[4].substring(10) + "/" + dates.split(",")[5].substring(8, 10);
		
		HomeDAO dao = new HomeDAO();
		
		
		
		int result = dao.addBookList(auth);
		int result2 = 0;
		if (result == 1) {
			result2 = dao.addHomeBook(seq, auth, startDate, endDate);
		}
		
		PartnerInfoDTO dto = new PartnerInfoDTO();
		
		if (result2 == 1) {
			dto = dao.getPartner(sellerid);
		}
		
		req.setAttribute("seq", seq);
		req.setAttribute("name", name);
		req.setAttribute("price", price);
		req.setAttribute("dto", dto);
		req.setAttribute("startDate", startDate);
		req.setAttribute("enter", enter);
		req.setAttribute("endDate", endDate);
		req.setAttribute("outer", outer);
		
		
//		String startDay = dates. + dates.startMonth; 
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/ordercomplete.jsp");

		dispatcher.forward(req, resp);

	}

}