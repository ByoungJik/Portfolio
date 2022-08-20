package com.test.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/qna.do")
public class QnA extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		QnADTO dto = new QnADTO();
		MyDAO dao = new MyDAO();
	
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		ArrayList<QnADTO> nlist = new ArrayList<QnADTO>();
	

		HashMap<String, String> map = new HashMap<String, String>();
		
		
		
		int nowPage = 0; // 현재 페이지 번호
		int begin = 0;
		int end = 0;
		int pageSize = 10; // 한 페이지 당 출력할 게시물 수

		int totalCount = 0; // 총 게시물 수
		int totalPage = 0; // 총 페이지 수
		
		totalCount = dao.getTotalCount(id);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		String page = req.getParameter("page");
		
		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		begin = ((nowPage - 1 ) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("id", id);
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		//글 목록 불러오기
		list = dao.getQnAList(map);
		nlist = dao.getNoticeList();
		req.setAttribute("list", list);
		req.setAttribute("nlist", nlist);
		
		String pagebar = "";

		int blockSize = 10; // 한번에 보여질 페이지 개수
		int n = 0; // 페이지 번호
		int loop = 0; // 루프

		
		
		pagebar = "";

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		
		pagebar += "<ul class=\"pagination\">";

		/*
		 * if (n == 1) {
		 * 
		 * pagebar += String.format("		    <li class=\"page-item\">\r\n" +
		 * "		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\r\n"
		 * + "		        <span aria-hidden=\"true\">&laquo;</span>\r\n" +
		 * "		      </a>\r\n" + "		    </li>");
		 * 
		 * } else {
		 * 
		 * 
		 * pagebar += String.format("		    <li class=\"page-item\">\r\n" +
		 * "		      <a class=\"page-link\" href=\"/tripnow/mypage/qna.do?page=%d\" aria-label=\"Previous\">\r\n"
		 * + "		        <span aria-hidden=\"true\">&laquo;</span>\r\n" +
		 * "		      </a>\r\n" + "		    </li>", n - 1);
		 * 
		 * 
		 * }
		 */
		
		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {

				pagebar += String
						.format(" <li class=\"page-item active\"><a class=\"page-link\" href=\"#!\">%d</a></li> ", n);

			} else {
				
				pagebar += String.format(
						" <li class=\"page-item\"><a class=\"page-link\" href=\"/tripnow/mypage/qna.do?page=%d\">%d</a></li> ",
						n, n);


			}

			loop++;
			n++;
		}
		
		
//		if (n > totalPage) {
//
//			pagebar += String.format("		    <li class=\"page-item\">\r\n"
//					+ "		      <a class=\"page-link\" href=\"#!\" aria-label=\"Next\">\r\n"
//					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n" + "		      </a>\r\n"
//					+ "		    </li>");
//
//		} else {
//
//
//			pagebar += String.format("		    <li class=\"page-item\">\r\n"
//					+ "		      <a class=\"page-link\" href=\"/tripnow/mypage/qna.do?page=%d\" aria-label=\"Next\">\r\n"
//					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n" + "		      </a>\r\n"
//					+ "		    </li>", n);
//
//			
//		}

		pagebar += "</ul>";
		
		
		
		
		
		req.setAttribute("map", map);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pagebar", pagebar);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/qna.jsp");
		dispatcher.forward(req, resp);

	}

}