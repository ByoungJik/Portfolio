package com.test.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.member.MemberDTO;

@WebServlet("/mypage/editinfo.do")
public class EditInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		
		String id = (String)session.getAttribute("auth");
		
		MemberDTO dto = new MemberDTO();
		MyDAO dao = new MyDAO();
		
		dto = dao.getInfo(id);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/editinfo.jsp");
		dispatcher.forward(req, resp);

	}

}