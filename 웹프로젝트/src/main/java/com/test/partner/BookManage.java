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

@WebServlet("/partner/bookmanage.do")
public class BookManage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String pid = (String)session.getAttribute("auth");
		
		PartnerDAO dao = new PartnerDAO();
		
		ArrayList<HomeBookManageDTO> hbmlist = dao.homebookmanage(pid);
		ArrayList<ActivityBookManageDTO> abmlist = dao.activitybookmanage(pid);
		ArrayList<CarBookManageDTO> cbmlist = dao.carbookmanage(pid);
		
		req.setAttribute("hbmlist", hbmlist);
		req.setAttribute("abmlist", abmlist);
		req.setAttribute("cbmlist", cbmlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/bookmanage.jsp");

		dispatcher.forward(req, resp);

	}

}
