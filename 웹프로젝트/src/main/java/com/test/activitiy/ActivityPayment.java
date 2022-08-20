package com.test.activitiy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.event.CouponDTO;
import com.test.event.EventDAO;
import com.test.member.MemberDTO;

@WebServlet("/activity/activitypayment.do")
public class ActivityPayment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
//		req.setCharacterEncoding("UTF-8");
//		
//		String Cseq  = req.getParameter("Cseq");
//		
//		CouponDTO Cdto = new CouponDTO(); 
//		EventDAO Edao = new EventDAO();
//		
//		Cdto.setEseq(Cseq);
//		
//		Cdto = Edao.getEvent(Cdto);
		
		
		
	
		String id    = req.getParameter("id");
		String seq 	 = req.getParameter("seq");
		
		String count = req.getParameter("count");
		
		ActivityDAO dao = new ActivityDAO();
		ActivityDTO dto = new ActivityDTO();
		
		//상품 정보 받아오기 dto
		dto.setSeq(seq);
		dto = dao.view(dto);
		
		
		//유저정보 받아오기
		MemberDTO Mdto = new MemberDTO();
		
		Mdto = dao.getInfo(id);
		
		//판매자 정보 가져오기
		
		MemberDTO Sdto = new MemberDTO();
		
		Sdto = dao.getInfo(dto.getPid());
		
		
		
		//이메일 나누기
		String [] email = Mdto.getEmail().split("@");
		

		
		//이메일1,2
		req.setAttribute("email1",email[0]);
		req.setAttribute("email2",email[1]);
		
		//상품 dto
		req.setAttribute("dto", dto);
		//유저 dto
	    req.setAttribute("Mdto", Mdto);
	    //파트너 dto
	    req.setAttribute("Sdto", Sdto);
	    
	    
		//수량
	    req.setAttribute("count", count);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/activitypayment.jsp");

		dispatcher.forward(req, resp);
	}

}