package com.test.partner;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/partner/sales.do")
public class Sales extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		//파트너 ID 가져오기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("auth");
		
		//sales.do를 처음 방문한 경우 -> 기본값 s(elected)month 설정, 
		//조회 월은 이번달, 조회 카테고리는 전체
		
		//이미 sales.do를 방문해 조회월과 카테고리를 선택한 경우 -> req.getParameter로 받아오기
		//selected -> 검색 상태 유지를 위한 선택값 정보 저장
		String syear;
		String smonth;
		String selected;
	
		Calendar now = Calendar.getInstance();
		
		if (req.getParameter("smonth") == null || req.getParameter("smonth") == "" || req.getParameter("smonth").equals("0")) {
			selected = "0";
			syear = (now.get(Calendar.YEAR) + "").substring(2);
			
			if (now.get(Calendar.MONTH) + 1 < 10) {
				smonth = "0" + (now.get(Calendar.MONTH) + 1); 
			} else {
				smonth = (now.get(Calendar.MONTH) + 1) + ""; 				
			}
		} else {
			selected = req.getParameter("smonth");
			Calendar temp = Calendar.getInstance();
			
			temp.add(Calendar.MONTH, Integer.parseInt(req.getParameter("smonth")));
			syear = (temp.get(Calendar.YEAR) + "").substring(2);

			if (temp.get(Calendar.MONTH) + 1 < 10) {
				smonth = "0" + (temp.get(Calendar.MONTH) + 1); 
			} else {
				smonth = (temp.get(Calendar.MONTH) + 1) + ""; 				
			}			
		}
		
		/*
		 * if (req.getParameter("cate") == null || req.getParameter("cate") == "") {
		 * scate = "all"; } else { scate = req.getParameter("cate"); }
		 */
		
	
		//select box의 option에 들어갈 이번달 ~ 이번달 - 11개월을 String[] dates 배열에 넣기 
		String[] dates = new String[12];
		String year = "";
		String month = "";
		
		for (int i=0 ; i<12 ; i++) {

			year = now.get(Calendar.YEAR) + "년";
			month = (now.get(Calendar.MONTH) + 1) + "월";
			dates[i] = year + " " + month;
			now.add(Calendar.MONTH, -1);
		}
		
		
		System.out.println("syear = " + syear);
		System.out.println("smonth = " + smonth);
		//파트너 id, syear, smonth 가지고 DB(dao) 다녀오기
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("syear", syear);
		map.put("smonth", smonth);
		
		PartnerDAO dao = new PartnerDAO();
		ArrayList<PartnerDTO> roomlist = new ArrayList<PartnerDTO>();
		ArrayList<PartnerDTO> carlist = new ArrayList<PartnerDTO>();
		ArrayList<PartnerDTO> actlist = new ArrayList<PartnerDTO>();
		
		roomlist = dao.getRoomList(map);
		carlist = dao.getCarList(map);
		actlist = dao.getActList(map);
		
		System.out.println(roomlist);
		System.out.println(carlist);
		System.out.println(actlist);
		
		int roomsum = 0;
		int carsum = 0;
		int actsum = 0;
		
		if (roomlist != null) {
			for (PartnerDTO dto : roomlist) {
				roomsum += Integer.parseInt(dto.getPrice());
			}			
		}
		if (carlist != null) {
			for (PartnerDTO dto : carlist) {
				carsum += Integer.parseInt(dto.getPrice());
			}			
		}
		if (actlist != null) {
			for (PartnerDTO dto : actlist) {
				actsum += Integer.parseInt(dto.getPrice());
			}			
		}
		
		req.setAttribute("roomlist", roomlist);
		req.setAttribute("carlist", carlist);
		req.setAttribute("actlist", actlist);
		req.setAttribute("roomsum", roomsum);
		req.setAttribute("carsum", carsum);
		req.setAttribute("actsum", actsum);
		req.setAttribute("dates", dates);
		req.setAttribute("selected", selected);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/sales.jsp");
		dispatcher.forward(req, resp);

	}


}
