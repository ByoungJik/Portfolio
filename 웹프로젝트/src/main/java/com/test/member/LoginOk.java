package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/loginok.do")
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
				
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		int result = 0;
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		dto = dao.logincheck(dto);
		
		if (dto != null) {
			//인증 티켓 발급
			result = 1;
			session.setAttribute("auth", dto.getId());
			session.setAttribute("name", dto.getName());
			session.setAttribute("grade", dto.getGseq());
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d }", result);
		
		writer.close();
	}

}