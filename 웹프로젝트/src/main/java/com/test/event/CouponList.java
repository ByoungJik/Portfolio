package com.test.event;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.activitiy.ActivityDTO;

@WebServlet("/event/couponlist.do")
public class CouponList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		
		CouponDTO dto = new CouponDTO();
		EventDAO  dao = new EventDAO();
		
		dto.setId(id);
		
		ArrayList<CouponDTO> list = dao.couponlist(dto);
		
		for(CouponDTO listdto : list) {
	    	  
	    	  if(listdto.getEnddate().length() > 11) {
	    		  listdto.setEnddate(listdto.getEnddate().substring(0,11));
	    	  }
	  
	      }
		
		
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/event/couponlist.jsp");

		dispatcher.forward(req, resp);
	}

}