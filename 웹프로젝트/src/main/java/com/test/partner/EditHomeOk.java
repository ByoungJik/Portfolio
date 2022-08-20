package com.test.partner;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.io.Files;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/partner/edithomeok.do")
public class EditHomeOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		//1.5 새로운 파일을 선택했을 때..
		String path = req.getRealPath("/images");
		int size = 1024 * 1024 * 100;
		
		ArrayList<String> afilename = new ArrayList<String>();   
        ArrayList<String> aorgfilename = new ArrayList<String>();

		
		MultipartRequest multi = null;
		
		try {
			
			multi = new MultipartRequest(
											req,
											path,
											size,
											"UTF-8",
											new DefaultFileRenamePolicy()
										);
			Enumeration e = multi.getFileNames();
	         
	        while(e.hasMoreElements()) {
	            String file = (String)e.nextElement();
	            //System.out.println(file);
	            
	            //하드에 저장된 이름
	            afilename.add(multi.getFilesystemName(file));
	            
	            //사용자가 올린 이름
	            aorgfilename.add(multi.getOriginalFileName(file));
	        }

		} catch (Exception e) {
			System.out.println("EditOk.doPost");
			e.printStackTrace();
		}
		
		
		HomeOptionDTO dto = new HomeOptionDTO();
		
		dto.setSeq(multi.getParameter("seq"));
		
		dto.setHname(multi.getParameter("homename"));
		dto.setRname(multi.getParameter("roomname"));
		dto.setLocation(multi.getParameter("location"));
		dto.setEnterhome(multi.getParameter("enterhome"));
		dto.setOuterhome(multi.getParameter("outerhome"));
		dto.setPrice(multi.getParameter("price"));
		dto.setBath(multi.getParameter("bath"));
		dto.setPet(multi.getParameter("pet"));
		dto.setMaxpeople(multi.getParameter("maxpeople"));
		dto.setSmoke(multi.getParameter("smoke"));
		dto.setPool(multi.getParameter("pool"));
		dto.setParking(multi.getParameter("parking"));
		dto.setCook(multi.getParameter("cook"));
		dto.setWifi(multi.getParameter("wifi"));
		dto.setBval(multi.getParameter("bval"));
		dto.setPath(multi.getParameter("path"));
		
		
		String filename = multi.getFilesystemName("newpath");
		String orgfilename = multi.getOriginalFileName("newpath");
		
		String imagespath = "C:\\Users\\user\\class\\java\\WebProject\\src\\main\\webapp\\images\\";
		
		if (filename == null) {
			// 기존 파일 그대로 진행
			dto.setPath(multi.getParameter("path"));
		} else {
			// 새로운 파일 전달
			dto.setPath("/tripnow/images/" + orgfilename);
			try {
				File oldfile = new File(path + "\\" + orgfilename);
				File newfile = new File(imagespath + orgfilename);
				Files.move(oldfile, newfile);
				
				oldfile.delete();
				
			} catch (Exception e) {
				System.out.println("EditCarOk.doPost");
				e.printStackTrace();
			}
		}
		
		
		PartnerDAO dao = new PartnerDAO();
		
		int resultOne = 0;
		int resultTwo = 0;
		
		// resultOne == 2
		resultOne = dao.editHome(dto);
		
		
		if (multi.getParameter("temp").equals("1")) {
			resultTwo = dao.editHomePath(dto, aorgfilename);
		}
		
		req.setAttribute("resultOne", resultOne);
		req.setAttribute("seq", dto.getSeq());
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/partner/edithomeok.jsp");

		dispatcher.forward(req, resp);
	}

}
