package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/idcheck.do")
public class IdCheck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String id = req.getParameter("id").toLowerCase();
		int result;
		
		if (!checkletter(id)) {
			result = -1;
		
		} else {
			
			MemberDAO dao = new MemberDAO();
			
			result = dao.idcheck(id);
		
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d }", result);
		
		writer.close();
		
		
	}

	private boolean checkletter(String id) {
		
		String idPattern = "^[0-9a-z]{5,15}$";
		
		return Pattern.matches(idPattern, id);
	}

}