package com.test.partner;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/partner/edithome.do")
public class EditHome extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		PartnerDAO dao = new PartnerDAO();
		
		HomeOptionDTO homeoption = new HomeOptionDTO();
		
		homeoption = dao.getHomeOption(seq);
		
		ArrayList<HomeOptionDTO> pathlist = new ArrayList<HomeOptionDTO>();
		
		pathlist = dao.getPathList(seq);
		
		req.setAttribute("homeoption", homeoption);
		req.setAttribute("pathlist", pathlist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/edithome.jsp");

		dispatcher.forward(req, resp);
	}

}

