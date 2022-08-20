package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/idemailcheck.do")
public class IdEmailCheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setId(id);
		dto.setEmail(email);
		
		int result = dao.idemailcheck(dto);
		String code = "";
		
		if (result == 1) {
			SendEmail sendemail = new SendEmail();
			code = sendemail.connect(email);
			
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d, \"code\": \"%s\", \"id\": \"%s\" }", result, code, id);
		
		writer.close();

	}

}
