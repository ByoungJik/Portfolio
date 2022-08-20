package com.test.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.MemberDTO;

@WebServlet("/mypage/editinfook.do")
public class EditInfoOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String newpw = req.getParameter("newpw");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel1") + req.getParameter("tel2") + req.getParameter("tel3");
		String email = req.getParameter("email");
		
		MemberDTO dto = new MemberDTO();
		MyDAO dao = new MyDAO();

		dto.setId(id);
		dto.setPw(newpw);
		dto.setName(name);
		dto.setTel(tel);
		dto.setEmail(email);
		
		int result = dao.editinfo(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\": %d }", result);
		
		writer.close();
		
	}

}