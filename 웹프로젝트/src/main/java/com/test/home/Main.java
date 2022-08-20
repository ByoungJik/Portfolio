package com.test.home;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.tripnow.DBUtil;

@WebServlet("/home/main.do")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/main.jsp");

		dispatcher.forward(req, resp);
		
		DBUtil.open();

	}

}
