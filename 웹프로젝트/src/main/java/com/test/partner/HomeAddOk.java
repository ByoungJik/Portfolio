package com.test.partner;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/partner/homeaddok.do")
public class HomeAddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String pid = (String)session.getAttribute("auth");
		
		String path = req.getRealPath("/images");
	      
		System.out.println(path);
		
		int size = 1024 * 1024 * 100;
      
		ArrayList<String> filename = new ArrayList<String>();

		MultipartRequest multi = null;
		
		 try {
	         
	         multi = new MultipartRequest(
	                 req, 
	                 path,    
	                 size,     
	                 "UTF-8", 
	                 new DefaultFileRenamePolicy() 
	             );
	         

	         //첨부파일들
	         //<input type="file" name="attach1">
	         //<input type="file" name="attach2">
	         //<input type="file" name="attach3">
	         
	         Enumeration<String> e = multi.getFileNames();
	         
	         while(e.hasMoreElements()) {
	            String file = (String)e.nextElement();
	            //System.out.println(file);
	            
	            //하드에 저장된 이름
	            filename.add(multi.getFilesystemName(file));
	         }
	         
	         
	      } catch (Exception e) {
	         System.out.println("homeaddok.do");
	         e.printStackTrace();
	      }

		
		String homename = multi.getParameter("homename");
		String tseq	= multi.getParameter("home");
		
		String location = multi.getParameter("address");
		
		String enter = multi.getParameter("enter");
		String outer = multi.getParameter("outer");
		
		String roomname = multi.getParameter("roomname");
		String price = multi.getParameter("price");
		
		String bedoption = multi.getParameter("bedoption");
		
		String bath = multi.getParameter("bath");
		if (bath == null) {
			bath = "n";
		}
		String pet = multi.getParameter("pet");
		if (pet == null) {
			pet = "n";
		}
		String smoke = multi.getParameter("smoke");
		if (smoke == null) {
			smoke = "n";
		}
		String cook = multi.getParameter("cook");
		if (cook == null) {
			cook = "n";
		}
		String parking = multi.getParameter("parking");
		if (parking == null) {
			parking = "n";
		}
		String pool = multi.getParameter("pool");
		if (pool == null) {
			pool = "n";
		}
		String wifi = multi.getParameter("wifi");
		if (wifi == null) {
			wifi = "n";
		}
		
		String maxpeople = multi.getParameter("maxpeople");
		
		String thumbnail= filename.get(filename.size()-1);
		
		HomeAddInfoDTO dto = new HomeAddInfoDTO();
		
		dto.setPid(pid);
		dto.setTseq(tseq);
		dto.setHomename(homename);
		dto.setLocation(location);
		dto.setEnter(enter);
		dto.setOuter(outer);
		dto.setRoomname(roomname);
		dto.setPrice(price);
		dto.setThumbnail(thumbnail);
		dto.setBedoption(bedoption);
		dto.setBath(bath);
		dto.setPet(pet);
		dto.setMaxpeople(maxpeople);
		dto.setSmoke(smoke);
		dto.setPool(pool);
		dto.setParking(parking);
		dto.setCook(cook);
		dto.setWifi(wifi);
		dto.setFilename(filename);
		
		System.out.println(dto.getFilename());
		
		PartnerDAO dao = new PartnerDAO();
		int result = dao.insertHome(dto);
		
		if (result == 1) {
			int result2 = dao.insertRoom(dto);
			if(result2 == 1) {
				int result3 = dao.insertOptionList(dto);
				if(result3 == 1) {
					int result4 = dao.insertRoompic(dto);
					if (result4 == 1) {
						RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/homeaddok.jsp");

						dispatcher.forward(req, resp);
					}
				}
			}
		}
		

	}

}



















