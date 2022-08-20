package com.test.car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import com.test.member.MemberDTO;
import com.test.partner.CarOptionDTO;
import com.test.tripnow.DBUtil;

public class CarDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CarDAO() {
		conn = DBUtil.open();
	}

	

	public HashSet<CarDTO> list(String sido, String[] gudong, String startDate, String endDate) {
			
			try {
				
				String sql = "select * from vwCarlist where location like ? and not (startbook between ? and ?) and not (endbook between ? and ?) or location like ? and startbook is null order by mainseq asc";
				
				
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, sido);
				pstat.setString(2, startDate);
				pstat.setString(3, endDate);
				pstat.setString(4, startDate);
				pstat.setString(5, endDate);
				pstat.setString(6, sido);
				
				rs = pstat.executeQuery();	
				
				HashSet<CarDTO> list = new HashSet<CarDTO>();
				
				ArrayList<String> count = new ArrayList<String>();
				
				while (rs.next()) {
					
					CarDTO dto = new CarDTO();
					
					count.add(rs.getString("mainseq"));
					dto.setSeq(rs.getString("mainseq"));
					
					dto.setShow(rs.getString("show"));
					
					
					dto.setCnseq(rs.getString("carname"));
					dto.setCtvalue(rs.getString("ctvalue"));
					dto.setLocation(rs.getString("location"));
					dto.setPrice(rs.getString("price"));
					dto.setMileage(rs.getString("mileage"));
					
					dto.setHcvalue(rs.getString("hval"));
					dto.setFvalue(rs.getString("fvalue"));
					dto.setFseq(rs.getString("fseq"));
					dto.setPath(rs.getString("path"));
					
					
					
					dto.setRentstart(rs.getString("rentstart"));
					dto.setRentend(rs.getString("rentend"));
					
					
					if (rs.getString("geartype").equals("y")) {
						dto.setGeartype("자동변속");
					} else if (rs.getString("geartype").equals("n")) {
						dto.setGeartype("수동변속");
					}
					
					list.add(dto);
				}
				
				return list;
				
				
			} catch (Exception e) {
				System.out.println("CarDAO.list");
				e.printStackTrace();
			}
			
			
			return null;
		}
	
	public HashSet<CarDTO> seachcar(String seq) {
		
		
	try {
		String sql = "select * from vwCarlist where mainseq = ?";
		
		
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, seq);
		
		rs = pstat.executeQuery();	
		
		HashSet<CarDTO> list = new HashSet<CarDTO>();
		
		while (rs.next()) {
			
			CarDTO dto = new CarDTO();
			
			
			dto.setSeq(rs.getString("mainseq"));
			
			dto.setShow(rs.getString("show"));
			
			
			dto.setCnseq(rs.getString("carname"));
			dto.setCtvalue(rs.getString("ctvalue"));
			dto.setLocation(rs.getString("location"));
			dto.setPrice(rs.getString("price"));
			dto.setMileage(rs.getString("mileage"));
			
			dto.setHcvalue(rs.getString("hval"));
			dto.setFvalue(rs.getString("fvalue"));
			dto.setFseq(rs.getString("fseq"));
			dto.setPath(rs.getString("path"));
			
			
			dto.setRentstart(rs.getString("rentstart"));
			dto.setRentend(rs.getString("rentend"));
			
			
			if (rs.getString("geartype").equals("y")) {
				dto.setGeartype("자동변속");
			} else if (rs.getString("geartype").equals("n")) {
				dto.setGeartype("수동변속");
			}
			
			list.add(dto);
			
		}
		
		
		
		return list;
		
		
	} catch (Exception e) {
		System.out.println("CarDAO.list");
		e.printStackTrace();
	}
	
	
		return null;
	}



	public ArrayList<ReviewDTO> review(String seq) {

		
		try {
			
			
			String sql = "select rating, regdate,  content, id, cseq, replyseq, pregdate, pcontent, seq, rseq from vwReview where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();	
			
			ArrayList<ReviewDTO> reviewlist = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setRating(rs.getString("rating"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setCseq(rs.getString("cseq"));
				dto.setReplyseq(rs.getString("replyseq"));
				dto.setPregdate(rs.getString("pregdate"));
				dto.setPcontent(rs.getString("pcontent"));
				dto.setSeq(rs.getString("seq"));
				dto.setRseq(rs.getString("rseq"));
				
				
				reviewlist.add(dto);
				
			}
				
			return reviewlist;
			
		} catch (Exception e) {
			System.out.println("CarDAO.review");
			e.printStackTrace();
		}
		
		
		
		return null;
	}



	public int delcomment(String id) {

		
		
		try {
			
			String sql = "delete from tblCarReview where id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("CarDAO.delcomment");
			e.printStackTrace();
		}
		
		
		return 0;
	}



	public ArrayList<CarAvgCountDTO> rclist() {

		try {
			
			String sql = "select seq, count, rating from vwReviewcount";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<CarAvgCountDTO> rclist = new ArrayList<CarAvgCountDTO>();
			
			while (rs.next()) {
				
				CarAvgCountDTO dto = new CarAvgCountDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCount(rs.getString("count"));
				if (rs.getString("rating") == null) {
					dto.setRating("평가 전");
				} else {
					dto.setRating(rs.getString("rating"));
				}
				
				rclist.add(dto);
				
			}
			
			return rclist;
			
		} catch (Exception e) {
			System.out.println("CarDAO.rclist");
			e.printStackTrace();
		}
		
		
		
		return null;
	}



	public CarPaymentDTO payMentList(String seq) {

		try {
			
			String sql = "select c.seq as seq, cn.path as path, c.carname as carname, u.name as pname, c.price as price, u.tel as tel from tbluser u inner join tblcar c on c.pid = u.id inner join tblcarname cn on cn.seq = c.carname where c.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			rs = pstat.executeQuery();	
			CarPaymentDTO cplist = new CarPaymentDTO();
			
			while (rs.next()) {
				
				cplist.setSeq(rs.getString("seq"));
				cplist.setPath(rs.getString("path"));
				cplist.setCarname(rs.getString("carname"));
				cplist.setPname(rs.getString("pname"));
				cplist.setPrice(rs.getString("price"));
				cplist.setTel(rs.getString("tel"));
				
				
			}
				
			return cplist;
			
			
		} catch (Exception e) {
			System.out.println("CarDAO.payMentList");
			e.printStackTrace();
		}
		
		
		
		return null;
	}



	public MemberDTO bookuser(String id) {

		try {
			
			MemberDTO dto = new MemberDTO();
			
			String sql = "select * from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setGseq(rs.getString("gseq"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
			}
			
			return dto;
			
			
		} catch (Exception e) {
			System.out.println("CarDAO.bookuser");
			e.printStackTrace();
		}
		
		return null;
	}



	public ArrayList<CarCouponDTO> couponlist(String id) {

		
		try {
			
			
			String sql = "select * from tblUserCoupon uc inner join tblEvent e on e.seq = uc.eseq where id = ? and used = 'n' and sysdate < enddate and value = '렌터카'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<CarCouponDTO> list = new ArrayList<CarCouponDTO>();

			while (rs.next()) {
				
				CarCouponDTO dto = new CarCouponDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setRate(rs.getString("rate"));
				dto.setValue(rs.getString("value"));
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("CarDAO.bookuser");
			e.printStackTrace();
		}
		
		return null;
	}



	public int delcar(String seq) {

		try {
			
			String sql = "delete from tblcar where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CarDAO.delcar");
			e.printStackTrace();
		}
		
		
		return 0;
	}



	public CarOptionDTO getCarOption(String seq) {

		try {
			
			String sql = "select * from tblcar c inner join tblcarname cn on cn.seq = c.carname where c.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			CarOptionDTO dto = new CarOptionDTO(); 
			
			if (rs.next()) {
				
				dto.setSeq(seq);
				dto.setCarname(rs.getString("carname"));
				dto.setFseq(rs.getString("fseq"));
				dto.setHseq(rs.getString("hseq"));
				dto.setCtseq(rs.getString("ctseq"));
				dto.setLocation(rs.getString("location"));
				dto.setMileage(rs.getString("mileage"));
				dto.setGeartype(rs.getString("geartype"));
				dto.setPrice(rs.getString("price"));
				dto.setRentstart(rs.getString("rentstart"));
				dto.setRentend(rs.getString("rentend"));
				dto.setCarname(rs.getString("carname"));
				dto.setPath(rs.getString("path"));
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("CarDAO.getCarOption");
			e.printStackTrace();
		}
		
		return null;
	}



	public int edit(CarOptionDTO dto) {
		
		try {
			
			String sql = "update tblcar set fseq = ?, hseq = ?, ctseq = ?, location = ?, mileage = ?, geartype = ?, price = ?, rentstart = ?, rentend = ?, carname = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getFseq());
			pstat.setString(2, dto.getHseq());
			pstat.setString(3, dto.getCtseq());
			pstat.setString(4, dto.getLocation());
			pstat.setString(5, dto.getMileage());
			pstat.setString(6, dto.getGeartype());
			pstat.setString(7, dto.getPrice());
			pstat.setString(8, dto.getRentstart());
			pstat.setString(9, dto.getRentend());
			pstat.setString(10, dto.getCarname());
			pstat.setString(11, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CarDAO.edit");
			e.printStackTrace();
		}
		
		
		return 0;
	}



	public int editPath(CarOptionDTO dto) {

		try {
	
			String sql = "select seq from tblcarname";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			boolean check = false;
			
			while (rs.next()) {
				if (rs.getString("seq").equals(dto.getCarname())) {
					check = true;
				}
			}
			
			if (check == true) {
				sql = "update tblcarname set path = ? where seq = ?";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getPath());
				pstat.setString(2, dto.getCarname());
				
				
				return pstat.executeUpdate();
			} else {
				sql = "insert into tblcarname values (?, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getCarname());
				pstat.setString(2, dto.getCtseq());
				pstat.setString(3, dto.getPath());
				
				return pstat.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println("CarDAO.edit");
			e.printStackTrace();
		}
		
		return 0;
	}



	public int add(CarOptionDTO dto, String id) {

		try {
			
			String sql = "insert into tblcar values (seqcar.nextval, ?, ?, ?, ?, 1, ?, ?, ?, ?, ?, ?, 'y', ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getFseq());
			pstat.setString(2, dto.getHseq());
			pstat.setString(3, dto.getCtseq());
			pstat.setString(4, id);
			pstat.setString(5, dto.getLocation());
			pstat.setString(6, dto.getMileage());
			pstat.setString(7, dto.getGeartype());
			pstat.setString(8, dto.getPrice());
			pstat.setString(9, dto.getRentstart());
			pstat.setString(10, dto.getRentend());
			pstat.setString(11, dto.getCarname());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CarDAO.add");
			e.printStackTrace();
		}
		return 0;
	}



	public int addPath(CarOptionDTO dto) {

		try {
			
			String sql = "select seq from tblcarname";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			boolean check = false;
			
			while (rs.next()) {
				if (rs.getString("seq").equals(dto.getCarname())) {
					check = true;
				}
			}
			
			if (check == true) {
				sql = "update tblcarname set path = ? where seq = ?";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getPath());
				pstat.setString(2, dto.getCarname());
				
				
				return pstat.executeUpdate();
			} else {
				sql = "insert into tblcarname values (?, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getCarname());
				pstat.setString(2, dto.getCtseq());
				pstat.setString(3, dto.getPath());
				
				return pstat.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println("CarDAO.edit");
			e.printStackTrace();
		}
		
		return 0;
	}



	public ArrayList<CarAvgCountDTO> vrclist(String seq) {

		try {
			
			String sql = "select seq, count, rating from vwReviewcount where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			ArrayList<CarAvgCountDTO> rclist = new ArrayList<CarAvgCountDTO>();
			
			while (rs.next()) {
				
				CarAvgCountDTO dto = new CarAvgCountDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCount(rs.getString("count"));
				if (rs.getString("rating") == null) {
					dto.setRating("평가 전");
				} else {
					dto.setRating(rs.getString("rating"));
				}
				
				rclist.add(dto);
				
			}
			
			return rclist;
			
		} catch (Exception e) {
			System.out.println("CarDAO.rclist");
			e.printStackTrace();
		}
		
		
		
		return null;
	}



	public int editComment(ReviewDTO dto) {

		try {
			String sql = "update tblcarreview set content = ? where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getId());

			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CarDAO.editComment");
			e.printStackTrace();
		}
		
		return 0;
	}


}


















































