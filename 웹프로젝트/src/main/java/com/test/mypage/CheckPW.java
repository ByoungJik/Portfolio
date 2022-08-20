package com.test.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.member.MemberDAO;
import com.test.member.MemberDTO;

@WebServlet("/mypage/checkpw.do")
public class CheckPW extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		String pw = req.getParameter("pw");
		
		MemberDTO dto = new MemberDTO();
		MyDAO dao = new MyDAO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		int result = dao.pwCheck(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();

		writer.printf("{ \"result\": %d }", result);
		
		writer.close();
		
	}

}