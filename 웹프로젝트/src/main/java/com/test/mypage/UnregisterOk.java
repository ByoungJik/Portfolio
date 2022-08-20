package com.test.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/unregisterok.do")
public class UnregisterOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		int result = 0;
		
		MyDAO dao = new MyDAO();
		
		int result1 = dao.cancelHome(id);
		int result2 = dao.cancelAct(id);
		int result3 = dao.cancelCar(id);
		
		if (result1 != -1 && result2 != -1 && result3 != -1) {
			if (dao.unregister(id) == 1) {
				result = 1;
			}
		}
		
		req.setAttribute("result", result);
		session.invalidate();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/unregisterok.jsp");
		dispatcher.forward(req, resp);

	}

}