package com.test.member;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/memberaddok.do")
public class MemberAddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel1") + req.getParameter("tel2") + req.getParameter("tel3");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		int result;
		
		if (name.length() >= 2 && dateCheck(birth)) {
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setTel(tel);
			dto.setBirth(birth);
			dto.setGender(gender);
			dto.setEmail(email);
			
			MemberDAO dao = new MemberDAO();
			result = dao.memberadd(dto);
			
		} else {
			result = -1;
		}
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memberaddok.jsp");
		dispatcher.forward(req, resp);

	}

	
	
	
	public static boolean dateCheck(String checkDate) {
		SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		
		dateFormatParser.setLenient(false);
		try {
			dateFormatParser.parse(checkDate);
			return true;
		} catch (ParseException e) {
			return false;
		}
	}
}
