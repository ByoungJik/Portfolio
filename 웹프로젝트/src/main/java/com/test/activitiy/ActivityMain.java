package com.test.activitiy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/activity/activitymain.do")
public class ActivityMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/activitymain.jsp");

		dispatcher.forward(req, resp);
	}

}