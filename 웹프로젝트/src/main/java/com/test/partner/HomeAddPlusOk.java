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

@WebServlet("/partner/homeaddplusok.do")
public class HomeAddPlusOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		
		String path = req.getRealPath("/images");
	      
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
		int result = dao.insertRoom(dto);
		
		if (result == 1) {
			int result2 = dao.insertOptionList(dto);
			if(result2 == 1) {
				int result3 = dao.insertRoompic(dto);
				if(result3 == 1) {
					RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/homeaddplusok.jsp");

					dispatcher.forward(req, resp);
				}
			}
		}

	}

}
