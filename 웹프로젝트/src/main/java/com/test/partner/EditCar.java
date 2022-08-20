package com.test.partner;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.car.CarDAO;

@WebServlet("/partner/editcar.do")
public class EditCar extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		CarDAO dao = new CarDAO();
		
		CarOptionDTO caroption = new CarOptionDTO();
		
		caroption = dao.getCarOption(seq);
		
		req.setAttribute("caroption", caroption);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/editcar.jsp");

		dispatcher.forward(req, resp);
	}

}

