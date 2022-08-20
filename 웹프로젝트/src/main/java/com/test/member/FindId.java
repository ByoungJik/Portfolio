package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/findid.do")
public class FindId extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		System.out.println("1번");
		req.setCharacterEncoding("UTF-8");

		String name = req.getParameter("name");
		String tel = req.getParameter("tel1") + req.getParameter("tel2") + req.getParameter("tel3");
		int result = 0;
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setName(name);
		dto.setTel(tel);
		
		dto = dao.findId(dto);
		if (!dto.getId().equals("null")) {
			result = 1;
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d, \"name\": \"%s\", \"id\": \"%s\" }", result, dto.getName(), dto.getId());
		System.out.println("3번");
		
		writer.close();
	}

}