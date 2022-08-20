package com.test.partner;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.activitiy.ActivityDTO;

@WebServlet("/partner/actregisterok.do")
public class ActRegisterOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String path = req.getRealPath("/images");
		
		System.out.println(path);
		
		int size = 1024 * 1024 * 100;
			
		
		ArrayList<String> filename = new ArrayList<String>();	
		ArrayList<String> orgfilename = new ArrayList<String>();
		
		PartnerDAO dao = new PartnerDAO();
		ActivityDTO dto = new ActivityDTO();
		
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
			
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()) {
				String file = (String)e.nextElement();
				//System.out.println(file);
				
				//하드에 저장된 이름
				filename.add(multi.getFilesystemName(file));
				
				//사용자가 올린 이름
				orgfilename.add(multi.getOriginalFileName(file));
			}
			
			
		} catch (Exception e) {
			System.out.println("ActRegisterOk.doPost");
			e.printStackTrace();
		}
		
		String actname	= multi.getParameter("actname");
		String price	= multi.getParameter("price");
		String address  = multi.getParameter("address") + " " + multi.getParameter("addressPlus");	
		String id		= (String)session.getAttribute("auth");
		String period	= multi.getParameter("period");
		String content	= multi.getParameter("content");

		
		String seq		= dao.getActMaxSeq(); 
		String thumbnail= filename.get(filename.size()-1);
		
		System.out.println(thumbnail);
		
		//등록
		dto.setSeq(seq);
		dto.setPid(id);
		dto.setName(actname);
		dto.setLocation(address);
		dto.setPeriod(period);
		dto.setPrice(Integer.parseInt(price));
		dto.setContent(content);
		dto.setPath("/tripnow/images/"+thumbnail);

		
		int result = dao.registAct(dto);
		
		if(result == 1) {
			
			for(String name : filename) {
				
				dao.setActPhoto(name,dto);
				
			}
			
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('등록에 성공하셨습니다.');");
            writer.println("location.href='/tripnow/partner/partnermain.do'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();

		}else {
			
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('등록에 실패하셨습니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
			
		}
		
		

		
	}

}








































