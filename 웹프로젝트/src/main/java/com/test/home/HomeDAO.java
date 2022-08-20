package com.test.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.tripnow.DBUtil;

public class HomeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public HomeDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<HomeSearchInfoDTO> homelistSearch(HomeSearchDTO dto) {
		
		try {
			
			String where = String.format("where location like '%%%s%%' and (maxpeople >= %s and maxpeople <= 5) and value='%s' and seq in (select seq from tblhome where seq in (select distinct hseq from tblRoom where not seq in (select rseq from tblHomeBook where enddate > '%s' and startdate < '%s')))", dto.getLoca(), dto.getCount(), dto.getValue(), dto.getSubstart(), dto.getSubstart());
			
			String sql = "select * from vwhomeinfo " + where;

			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<HomeSearchInfoDTO> ilist = new ArrayList<HomeSearchInfoDTO>();
			
			while (rs.next()) {
				
				HomeSearchInfoDTO hdto = new HomeSearchInfoDTO();
				
				hdto.setSeq(rs.getString("seq"));
				hdto.setName(rs.getString("name"));
				hdto.setLocation(rs.getString("location"));
				hdto.setValue(rs.getString("value"));
				hdto.setMaxpeople(rs.getString("maxpeople"));
				hdto.setStar(rs.getDouble("star"));
				hdto.setPrice(rs.getString("price"));
				hdto.setPath(rs.getString("path"));
				//hdto.setShow(rs.getString("show"));
//				hdto.setBath(rs.getString("bath"));
//				hdto.setPet(rs.getString("pet"));
//				hdto.setSmoke(rs.getString("smoke"));
//				hdto.setPool(rs.getString("pool"));
//				hdto.setParking(rs.getString("parking"));
//				hdto.setCook(rs.getString("cook"));
//				hdto.setWifi(rs.getString("wifi"));
				//hdto.setBedvalue(rs.getString("bedvalue"));
				hdto.setReviewcount(rs.getString("reviewcount"));
				
				ilist.add(hdto);
				
			}
			
			return ilist;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.homelistSearch");
			e.printStackTrace();
		}
		
		return null;
	}

	public RoomInfoMainDTO homeroominfoone(String seq) {
		
		try {
			
			String sql = "select name, (select avg(star) from tblHomeReview where hseq = tblHome.seq) as avgstar, (select count(seq) from tblHomeReview where hseq = tblHome.seq) as count, location, enterhome, outerhome from tblHome where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			RoomInfoMainDTO dto = new RoomInfoMainDTO();
			
			if (rs.next()) {
				
				dto.setName(rs.getString("name"));
				dto.setAvgstar(rs.getDouble("avgstar"));
				dto.setCount(rs.getString("count"));
				dto.setLocation(rs.getString("location"));
				dto.setEnterhome(rs.getString("enterhome"));
				dto.setOuterhome(rs.getString("outerhome"));
				
			}
				
			return dto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.homeroominfo");
			e.printStackTrace();
		}
		
		return null;
	}

	public HomeOptionDTO homeoption(String seq) {
		
		try {
			
			String sql = "select ol.bath, ol.pet, ol.maxpeople, ol.smoke, ol.pool, ol.parking, ol.cook, ol.wifi from tblRoom r inner join tblOptionList ol on r.seq = ol.rseq where hseq = ? and rownum = 1 order by r.seq";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			HomeOptionDTO dto = new HomeOptionDTO();
			
			if (rs.next()) {
				
				dto.setBath(rs.getString("bath"));
				dto.setPet(rs.getString("pet"));
				dto.setSmoke(rs.getString("smoke"));
				dto.setPool(rs.getString("pool"));
				dto.setParking(rs.getString("parking"));
				dto.setCook(rs.getString("cook"));
				dto.setWifi(rs.getString("wifi"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.homeoption");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<RoomListDTO> roomlist(String seq) {

		try {
		
			String sql = "select r.path, r.name, bo.value, o.maxpeople, r.price, r.seq from tblRoom r inner join tblOptionList o on r.seq = o.rseq inner join tblBedOption bo on o.bseq = bo.seq where r.hseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<RoomListDTO> rolist = new ArrayList<RoomListDTO>();
			
			while (rs.next()) {
				
				RoomListDTO dto = new RoomListDTO();
				
				dto.setPath(rs.getString("path"));
				dto.setName(rs.getString("name"));
				dto.setValue(rs.getString("value"));
				dto.setMaxpeople(rs.getString("maxpeople"));
				dto.setPrice(rs.getString("price"));
				dto.setSeq(rs.getString("seq"));
				
				rolist.add(dto);
				
			}
			
			return rolist;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.roomlist");
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<HomeReviewListDTO> homeReviewList(String seq) {

		try {
			
			String sql = "select hr.seq, hr.id, hr.regdate, hr.star, hr.content, hre.content as pcontent from tblHome h right outer join tblRoom r on h.seq = r.hseq right outer join tblHomeBook hb on r.seq = hb.rseq right outer join tblHomeReview hr on hr.hseq = hb.seq left outer join tblHomeReply hre on hr.seq = hre.rseq where h.seq = ? order by hr.regdate desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<HomeReviewListDTO> hrlist = new ArrayList<HomeReviewListDTO>();
			
			while (rs.next()) {
				
				HomeReviewListDTO dto = new HomeReviewListDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setPcontent(rs.getString("pcontent"));
				
				hrlist.add(dto);
			}
			
			return hrlist;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.homeReviewList");
			e.printStackTrace();
		}
		
		return null;
	}

	public RoomViewInfoDTO getRoomViewInfo(String seq) {

		try {
			
			String sql = "select h.name, r.name as roomname, r.path, bo.value, ol.maxpeople, r.price, ol.bath, ol.pet, ol.smoke, ol.pool, ol.parking, ol.cook, ol.wifi, h.enterhome, h.outerhome from tblRoom r inner join tblHome h on r.hseq = h.seq inner join tblOptionList ol on r.seq = ol.rseq inner join tblBedOption bo on bo.seq = ol.bseq where r.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			RoomViewInfoDTO dto = new RoomViewInfoDTO();
			
			if (rs.next()) {
				
				dto.setName(rs.getString("name"));
				dto.setRoomname(rs.getString("roomname"));
				dto.setPath(rs.getString("path"));
				dto.setValue(rs.getString("value"));
				dto.setMaxpeople(rs.getString("maxpeople"));
				dto.setPrice(rs.getString("price"));
				dto.setBath(rs.getString("bath"));
				dto.setPet(rs.getString("pet"));
				dto.setSmoke(rs.getString("smoke"));
				dto.setPool(rs.getString("pool"));
				dto.setParking(rs.getString("parking"));
				dto.setCook(rs.getString("cook"));
				dto.setWifi(rs.getString("wifi"));
				dto.setEnterhome(rs.getString("enterhome"));
				dto.setOuterhome(rs.getString("outerhome"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.getRoomViewInfo");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<RoomPicDTO> getRoomPic(String seq) {

		try {
			
			String sql = "select fpath from tblroompic where rseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<RoomPicDTO> rplist = new ArrayList<RoomPicDTO>();
			
			while (rs.next()) {
				
				RoomPicDTO dto = new RoomPicDTO();
				
				dto.setFpath(rs.getString("fpath"));
				
				rplist.add(dto);
				
			};
			
			return rplist;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.getRoomPic");
			e.printStackTrace();
		}

		return null;
	}

	public int addComment(HomeReviewListDTO dto) {

		try {
			
			String sql = "insert into tblHomeReview values ((select max(seq) + 1 from tblHomeReview), ?, (select max(hb.seq) from tblHomeBook hb inner join tblRoom r on hb.rseq = r.seq inner join tblHome h on h.seq = r.hseq where hb.id = ? and h.seq = ?), ?, ?, sysdate)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getHseq());
			pstat.setString(4, dto.getStar());
			pstat.setString(5, dto.getContent());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("HomeDAO.addComment");
			e.printStackTrace();
		}
		
		return 0;
	}

	public HomeReviewListDTO getComment() {

		try {
			
			String sql = "select tblHomeReview.* from tblHomeReview where seq = (select max(seq) from tblHomeReview)";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			HomeReviewListDTO dto = new HomeReviewListDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setId(rs.getString("id"));
				dto.setStar(rs.getString("star"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.getComment");
			e.printStackTrace();
		}
		
		return null;
	}

	public int delcomment(String seq) {
		 
		try {
			
			String sql = "delete from tblHomeReview where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("HomeDAO.delcomment");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int edithComment(HomeReviewListDTO dto) {

		try {
			
			String sql = "update tblHomeReview set content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("HomeDAO.editComment");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getCommentAvail(String seq, String id) {

		try {
			
			String sql = "select hb.id from tblHomeBook hb left outer join tblHomeReview hr on hb.seq = hr.hseq inner join tblRoom r on r.seq = hb.rseq inner join tblHome h on h.seq = r.hseq where hb.id = ? and hr.content is null and enddate + 7 > sysdate and h.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				return rs.getString("id");
			}
			
		} catch (Exception e) {
			System.out.println("HomeDAO.getCommentAvail");
			e.printStackTrace();
		}
		
		return null;
	}

	public HomeBookPayDTO homebookpay(String seq) {

		try {
			
			String sql = "select r.seq, r.name, h.name as homename, h.location, h.enterhome, h.outerhome, u.id as sellerid, u.name as seller, u.tel as sellertel, r.price from tblRoom r inner join tblHome h on r.hseq = h.seq inner join tblUser u on u.id = h.pid where r.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			HomeBookPayDTO dto = new HomeBookPayDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setHomename(rs.getString("homename"));
				dto.setLocation(rs.getString("location"));
				dto.setEnterhome(rs.getString("enterhome"));
				dto.setOuterhome(rs.getString("outerhome"));
				dto.setSellerid(rs.getString("sellerid"));
				dto.setSeller(rs.getString("seller"));
				dto.setSellertel(rs.getString("sellertel"));
				dto.setPrice(rs.getString("price"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.homebookpay");
			e.printStackTrace();
		}
		
		return null;
	}

	public BookUserDTO getUserInfo(String auth) {

		try {
			
			String sql = "select * from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, auth);
			
			rs = pstat.executeQuery();

			BookUserDTO udto = new BookUserDTO(); 
			
			if (rs.next()) {
				
				udto.setName(rs.getString("name"));
				udto.setTel(rs.getString("tel"));
				udto.setEmail(rs.getString("email"));
				
			}
			
			return udto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.getUserInfo");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addBookList(String auth) {

		try {
			
			String sql = "insert into tblBookList values ((select max(seq) + 1 from tblBookList), ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, auth);
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("HomeDAO.addBookList");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addHomeBook(String seq, String auth, String startDate, String endDate) {
		
		try {
			
			String sql = "insert into tblHomeBook values ((select max(seq) + 1 from tblHomeBook), ?, 1, ?, (select max(seq) from tblBookList), 1, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, auth);
			pstat.setString(3, startDate);
			pstat.setString(4, endDate);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("HomeDAO.addHomeBook");
			e.printStackTrace();
		}

		return 0;
		
	}

	public PartnerInfoDTO getPartner(String sellerid) {

		try {
			
			String sql = "select u.name, a.bank, a.acnumber from tblAccount a inner join tblUser u on a.id = u.id where u.id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, sellerid);
			
			rs = pstat.executeQuery();
			
			PartnerInfoDTO dto = new PartnerInfoDTO();
			
			if (rs.next()) {
				
				dto.setName(rs.getString("name"));
				dto.setBank(rs.getString("bank"));
				dto.setAcnumber(rs.getString("acnumber"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("HomeDAO.getPartner");
			e.printStackTrace();
		}

		return null;
	}

	public int delroom(String seq) {

		try {
			
			String sql = "delete from tblroom where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("HomeDAO.delhome");
			e.printStackTrace();
		}
		
		
		return 0;
	}

}













