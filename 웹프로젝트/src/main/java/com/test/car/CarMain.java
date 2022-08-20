package com.test.car;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/car/carmain.do")
public class CarMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/car/carmain.jsp");

		dispatcher.forward(req, resp);
	}

}

