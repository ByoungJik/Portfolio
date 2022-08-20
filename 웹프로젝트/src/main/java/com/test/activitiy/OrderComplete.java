package com.test.activitiy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.MemberDTO;

@WebServlet("/activity/ordercomplete.do")
public class OrderComplete extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String actSeq 		= req.getParameter("actSeq");
		String totalPrice 	= req.getParameter("totalPrice");
		String partnerId	= req.getParameter("partnerId");
		String Id 			= req.getParameter("Id");
		String count 		= req.getParameter("count");
		
		ActBookDTO dto = new ActBookDTO();
		ActivityDAO dao = new ActivityDAO();	
		
		//tblbooklist추가 + tblactivitybook에 필요한 데이터
		dto.setAseq(actSeq);
		dto.setId(Id);
		dto.setCount(count);
		dto.setTotalprice(totalPrice);
		
		//tblbooklist + tblactivitybook 추가
		dto = dao.actBook(dto);
		
		//유저정보 받아오기
		MemberDTO Mdto = new MemberDTO();
				
		Mdto = dao.getInfo(Id);
		
		
		//파트너 정보 받아오기
		ActivityDTO Sdto = new ActivityDTO();
		
		Sdto = dao.getAccountNum(partnerId);
		
		
		//주문정보
		req.setAttribute("dto", dto);
		//유저 정보
		req.setAttribute("Mdto", Mdto);
		//판매자 정보(계좌)		
		req.setAttribute("Sdto",Sdto);

		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/ordercomplete.jsp");

		dispatcher.forward(req, resp);
	}

}