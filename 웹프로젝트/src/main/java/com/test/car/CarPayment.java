package com.test.car;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.member.MemberDTO;

@WebServlet("/car/carpayment.do")
public class CarPayment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String id = req.getParameter("id");
		String seq 	 = req.getParameter("seq");
		String dates = req.getParameter("dates");
		
		String startDate = dates.split(" ~ ")[0];
		String endDate = dates.split(" ~ ")[1];

		CarDAO dao = new CarDAO();
		
		
		
		CarPaymentDTO dto = new CarPaymentDTO();
		MemberDTO mdto = new MemberDTO();
		ArrayList<CarCouponDTO> ccdto = new ArrayList<CarCouponDTO>();
		
		
		
		mdto = dao.bookuser(id);
		dto = dao.payMentList(seq);
		ccdto = dao.couponlist(id);
		
		
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("mdto", mdto);
		req.setAttribute("startdate", startDate);
		req.setAttribute("enddate", endDate);
		req.setAttribute("ccdto", ccdto);
		
		
		String useremail = mdto.getEmail().split("@")[0];
		String domain = mdto.getEmail().split("@")[1];
		req.setAttribute("useremail", useremail);
		req.setAttribute("domain", domain);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/car/carpayment.jsp");

		dispatcher.forward(req, resp);
	}

}



























