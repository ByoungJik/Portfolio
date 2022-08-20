package com.test.partner;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.test.mypage.BookDTO;
import com.test.mypage.MyDAO;

@WebServlet("/partner/mylist.do")
public class MyList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		PartnerDAO dao = new PartnerDAO();
		
		ArrayList<MyHomeDTO> homeList = new ArrayList<MyHomeDTO>();
		ArrayList<MyActivityDTO> activityList = new ArrayList<MyActivityDTO>();
		ArrayList<MyCarDTO> carList = new ArrayList<MyCarDTO>();
		
		
		homeList = dao.getHomeBookingList(id);
		activityList = dao.getActivityBookingList(id);
		carList = dao.getCarBookingList(id);

		req.setAttribute("homeList", homeList);
		req.setAttribute("actList", activityList);
		req.setAttribute("carList", carList);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/mylist.jsp");

		dispatcher.forward(req, resp);
	}

}
