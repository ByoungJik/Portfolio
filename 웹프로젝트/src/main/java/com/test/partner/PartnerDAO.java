package com.test.partner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import com.test.activitiy.ActivityDTO;
import com.test.tripnow.DBUtil;

public class PartnerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public PartnerDAO() {
		conn = DBUtil.open();
	}

	public int getTotalCount(String id) {
		try {
			
			String sql = "select count(*) as cnt from vwReply where pid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getTotalCount");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<ReviewReplyDTO> getReviewList(HashMap<String, String> map) {
		try {
			
			String sql = String.format("select ROWNUM as num , r.* from (select * from vwReply  order by reply NULLS FIRST,regdate desc) r where ROWNUM between %s and %s and pid like ?", map.get("begin"), map.get("end"));
			

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			
			rs = pstat.executeQuery();
			
			ArrayList<ReviewReplyDTO> list = new ArrayList<ReviewReplyDTO>();
			
			while(rs.next()) {
				
				ReviewReplyDTO dto = new ReviewReplyDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setPid(rs.getString("pid"));
				dto.setSeq(rs.getString("seq"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setReply(rs.getString("reply"));
				dto.setCategory(rs.getString("category"));
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getReviewList");
			e.printStackTrace();
		}
		return null;
	}

	public ReviewDTO getActReview(ReviewDTO dto) {
		try {
			
			String sql = "select * from vwActReply where seq like ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				
				dto.setId(rs.getString("id"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				
				if(rs.getString("reply") != null) {
				
				dto.setRcontent(rs.getString("rcontent"));
				dto.setRregdate(rs.getString("rregdate").substring(0,10));
				
				}
			}
			
			return dto;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getActReview");
			e.printStackTrace();
		}
		return null;
	}

	public ReviewDTO getHomeReview(ReviewDTO dto) {
		try {
			String sql = "select * from vwHomeReply where seq like ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				
				dto.setId(rs.getString("id"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				
				if(rs.getString("reply") != null) {
					
					dto.setRcontent(rs.getString("rcontent"));
					dto.setRregdate(rs.getString("rregdate").substring(0,10));
					
				}
				
			}
			
			return dto;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getHomeReview");
			e.printStackTrace();
		}
		return null;
	}

	public ReviewDTO getCarReview(ReviewDTO dto) {
		try {
			
			String sql = "select * from vwCarReply where seq like ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				
				dto.setId(rs.getString("id"));
				dto.setStar(rs.getString("star"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				
				if(rs.getString("reply") != null) {
					
					dto.setRcontent(rs.getString("rcontent"));
					dto.setRregdate(rs.getString("rregdate").substring(0,10));
					
				}
			}
			
			return dto;
		} catch (Exception e) {
			System.out.println("PartnerDAO.getCarReview");
			e.printStackTrace();
		}
		return null;
	}

	public int reviewReply(ReviewReplyDTO dto) {
		try {
			
			String sql = "";
			
			if(dto.getCategory().equals("1")) {
				
				sql="insert into tblActivityReply values ((select max(seq)+1 from tblActivityReply),?,?,?,default)";
				
			}else if(dto.getCategory().equals("2")) {
				
				sql="insert into tblHomeReply values ((select max(seq)+1 from tblHomeReply),?,?,?,default)";
				
			}else{
				
				sql="insert into tblCarReply values ((select max(seq)+1 from tblCarReply),?,?,?,default)";
				
			}
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getContent());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.reviewReply");
			e.printStackTrace();
		}
		return 0;
	}

	public String getActMaxSeq() {
		
		try {
			
			String sql = "select max(seq)+1 as seq from tblActivity";
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getActMaxSeq");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int registAct(ActivityDTO dto) {
		try {
			
			String sql = "insert into tblActivity values(?,?,1,?,? ,?,?,?,?,'y',?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,dto.getSeq());
			pstat.setString(2, dto.getPid());
			pstat.setString(3,dto.getName() );
			pstat.setString(4,dto.getLocation() );
			pstat.setString(5,dto.getPeriod());
			pstat.setInt(6,dto.getPrice() );
			pstat.setString(7,dto.getPath() );
			pstat.setString(8,dto.getPath() );
			pstat.setString(9,dto.getContent() );
				
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.registAct");
			e.printStackTrace();
		}
		return 0;
	}

	
	public void setActPhoto(String name, ActivityDTO dto) {
			try {
			
			String sql = "insert into tblActPhoto values((select max(seq)+1 from tblActPhoto),?,?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			pstat.setString(2, "/tripnow/images/"+name);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setParking");
			e.printStackTrace();
		}
	
		
	}
	
	
	//병직님
	
	public ArrayList<MyCarDTO> getCarBookingList(String id) {

		try {
			
			String sql = "select c.seq as seq, carname, location, price, rentstart, pid, rentend, c.rseq as rseq, path from tbluser u inner join tblcar c on c.pid = u.id inner join tblcarname cn on cn.seq = c.carname where c.pid = ? order by c.seq asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyCarDTO> list = new ArrayList<MyCarDTO>();
			
			while (rs.next()) {
				
				MyCarDTO dto = new MyCarDTO();
				
				dto.setPic(rs.getString("path"));
				dto.setCarname(rs.getString("carname"));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getString("price"));
				dto.setRentstart(rs.getString("rentstart"));
				dto.setRentend(rs.getString("rentend"));
				dto.setPid(rs.getString("pid"));
				dto.setSeq(rs.getString("seq"));
				
				if (rs.getString("rseq").equals("1")) {
					dto.setRseq("진행중");
				} else if (rs.getString("rseq").equals("2")){
					dto.setRseq("등록완료");
				} else {
					dto.setRseq("거절");
				}
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getCarBookingList");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public ArrayList<MyActivityDTO> getActivityBookingList(String id) {

		try {
			
			String sql = "select a.seq as seq, a.name as name, location, price, pid, period, a.rseq as rseq, fpath from tblactivity a inner join tbluser u on u.id = a.pid where a.pid = ? order by a.seq asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyActivityDTO> alist = new ArrayList<MyActivityDTO>();
			
			while (rs.next()) {
				
				MyActivityDTO dto = new MyActivityDTO();
				
				dto.setPic(rs.getString("fpath"));
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getString("price"));
				dto.setPeriod(rs.getString("period"));
				dto.setPid(rs.getString("pid"));
				
				if (rs.getString("rseq").equals("2")) {
					dto.setRseq("등록완료");
				} else if (rs.getString("rseq").equals("1")){
					dto.setRseq("진행중");
				} else {
					dto.setRseq("거절");
				}
				dto.setSeq(rs.getString("seq"));
				
				alist.add(dto);
			}
			
			return alist;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getCarBookingList");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MyHomeDTO> getHomeBookingList(String id) {

		try {
			
			String sql = "select r.seq as seq, r.name as room, h.name as home, location, price, enterhome, outerhome, r.rseq as rseq, path, pid from tblhome h inner join tblroom r on r.hseq = h.seq where pid = ? order by h.seq asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyHomeDTO> hlist = new ArrayList<MyHomeDTO>();
			
			while (rs.next()) {
				
				MyHomeDTO dto = new MyHomeDTO();
				
				dto.setHomename(rs.getString("home"));
				dto.setRoomname(rs.getString("room"));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getString("price"));
				dto.setRentstart(rs.getString("enterhome"));
				dto.setRentend(rs.getString("outerhome"));
				dto.setPid(rs.getString("pid"));
				if (rs.getString("rseq").equals("2")) {
					dto.setRseq("진행중");
				} else if (rs.getString("rseq").equals("1")){
					dto.setRseq("등록완료");
				} else {
					dto.setRseq("거절");
				}
				dto.setPic(rs.getString("path"));
				dto.setSeq(rs.getString("seq"));
				
				hlist.add(dto);
			}
			
			return hlist;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getHomeBookingList");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int editAct(ActOptionDTO dto) {

		try {
			
			String sql = "update tblActivity set name = ?, location = ?, price = ?, period = ?, path = ?, fpath = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getLocation());
			pstat.setString(3, dto.getPrice());
			pstat.setString(4, dto.getPeriod());
			pstat.setString(5, dto.getPath());
			pstat.setString(6, dto.getPath());
			pstat.setString(7, dto.getContent());
			pstat.setString(8, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.editAct");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editActPath(ActOptionDTO dto, ArrayList<String> aorgfilename) {

		try {
			
			
			
			String sql = "delete tblActPhoto where aseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			
			pstat.executeUpdate();
			
			for (int i = 0; i < aorgfilename.size()-1; i++) {
				
				int j = 0;
				
				sql = "insert into tblactphoto values (seqActPhoto.nextVal, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getSeq());
				pstat.setString(2, aorgfilename.get(i));
				
				pstat.executeUpdate();
			}
			
			return 1;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.editActPath");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public HomeOptionDTO getHomeOption(String seq) {

		try {
			
			String sql = "select r.seq as seq, h.name as hname, location, enterhome, outerhome, r.name as rname, price, path, value, bath, pet, maxpeople, smoke, pool, parking, cook, wifi from tblhome h inner join tblroom r on h.seq = r.hseq inner join tblOptionList ol on ol.rseq = r.seq  inner join tblbedoption bo on bo.seq = ol.bseq where r.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			HomeOptionDTO dto = new HomeOptionDTO();
			
			if (rs.next()) {
				
				dto.setSeq(seq);
				
				dto.setHname(rs.getString("hname"));
				dto.setLocation(rs.getString("location"));
				dto.setEnterhome(rs.getString("enterhome"));
				dto.setOuterhome(rs.getString("outerhome"));
				dto.setRname(rs.getString("rname"));
				dto.setPrice(rs.getString("price"));
				dto.setPath(rs.getString("path"));
				dto.setBath(rs.getString("bath"));
				dto.setPet(rs.getString("pet"));
				dto.setMaxpeople(rs.getString("maxpeople"));
				dto.setSmoke(rs.getString("smoke"));
				dto.setPool(rs.getString("pool"));
				dto.setParking(rs.getString("parking"));
				dto.setCook(rs.getString("cook"));
				dto.setWifi(rs.getString("wifi"));
				dto.setBval(rs.getString("value"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getHomeOption");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	public ArrayList<HomeOptionDTO> getPathList(String seq) {

		try {
			String sql = "select * from tblroompic where rseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();

			ArrayList<HomeOptionDTO> pathlist = new ArrayList<HomeOptionDTO>();
			
			
			while (rs.next()) {
				
				HomeOptionDTO dto = new HomeOptionDTO();
				
				dto.setFpath(rs.getString("fpath"));
				
				pathlist.add(dto);
				
			}
			
			
			return pathlist;
			
			
		} catch (Exception e) {
			System.out.println("ActDAO.getPathList");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int editHome(HomeOptionDTO dto) {
		int result = 0;
		try {
			// 룸 
			String sql = "update tblroom set name = ?, price = ?, path = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getRname());
			pstat.setString(2, dto.getPrice());
			pstat.setString(3, dto.getPath());
			pstat.setString(4, dto.getSeq());
			
			result = result + pstat.executeUpdate();
			
			// 옵션
			sql = "update tblOptionList set bseq = ?, bath = ?, pet = ?, maxpeople = ?, smoke = ?, pool = ?, parking = ?, cook = ?, wifi = ? where rseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			if (dto.getBval().equals("일반")) {
				pstat.setString(1, "1");
			} else if (dto.getBval().equals("트윈")) {
				pstat.setString(1, "2");
			} else if (dto.getBval().equals("퀸")) {
				pstat.setString(1, "3");
			} else if (dto.getBval().equals("온돌")) {
				pstat.setString(1, "4");
			}
			
			pstat.setString(2, (dto.getBath() == null) ? "n" : "y");
			pstat.setString(3, (dto.getPet() == null) ? "n" : "y");
			pstat.setString(4, dto.getMaxpeople());
			pstat.setString(5, (dto.getSmoke() == null) ? "n" : "y");
			pstat.setString(6, (dto.getPool() == null) ? "n" : "y");
			pstat.setString(7, (dto.getParking() == null) ? "n" : "y");
			pstat.setString(8, (dto.getCook() == null) ? "n" : "y");
			pstat.setString(9, (dto.getWifi() == null) ? "n" : "y");
			pstat.setString(10, dto.getSeq());
			
			System.out.println(dto.getMaxpeople());
			
			result = result + pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.editHome");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int editHomePath(HomeOptionDTO dto, ArrayList<String> aorgfilename) {
		try {
			
			
			
			String sql = "delete tblroompic where rseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			
			pstat.executeUpdate();
			
			for (int i = 0; i < aorgfilename.size()-1; i++) {
				
				int j = 0;
				
				sql = "insert into tblroompic values (seqroomPhoto.nextVal, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getSeq());
				pstat.setString(2, aorgfilename.get(i));
				
				pstat.executeUpdate();
			}
			
			return 1;
			
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.editActPath");
			e.printStackTrace();
		}
		
		return 0;
	}


	/// 승연님
	
public ArrayList<PartnerDTO> getRoomList(HashMap<String, String> map) {
		
		try {
			
			String sql = "select h.name as info1, r.name as info2, hb.startdate as date1, hb.enddate as date2, p.finalprice as price from tblHomeBook hb inner join tblRoom r on hb.rseq = r.seq inner join tblHome h on r.hseq = h.seq inner join tblBookList bl on hb.bseq = bl.seq inner join tblPayment p on bl.seq = p.blseq where h.pid = ? and hb.bsseq in (2, 3) and substr(hb.startdate, 1, 2) = ? and substr(hb.startdate, 4, 2) = ?";
					
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("id"));
			pstat.setString(2, map.get("syear"));
			pstat.setString(3, map.get("smonth"));
			
			rs = pstat.executeQuery();
			ArrayList<PartnerDTO> list = new ArrayList<PartnerDTO>();
			
			while (rs.next()) {
				
				PartnerDTO dto = new PartnerDTO();
				
				dto.setInfo(rs.getString("info1") + " " + rs.getString("info2"));
				dto.setDate(rs.getString("date1").substring(0, 10) + " ~ " + rs.getString("date2").substring(0, 10));
				dto.setPrice(rs.getString("price"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getRoomList");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<PartnerDTO> getCarList(HashMap<String, String> map) {
		
		try {
			
			String sql = "select c.carname as info1, f.value as info2, cb.startdate as date1, cb.enddate as date2, p.finalprice as price from tblCarBook cb inner join tblCar c on cb.cseq = c.seq inner join tblCarName cn on c.carname = cn.seq inner join tblFuel f on c.fseq = f.seq inner join tblBookList bl on cb.bseq = bl.seq inner join tblPayment p on bl.seq = p.blseq where c.pid = ? and cb.bsseq in (2, 3) and substr(cb.startdate, 1, 2) = ? and substr(cb.startdate, 4, 2) = ?";
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));			
			pstat.setString(2, map.get("syear"));
			pstat.setString(3, map.get("smonth"));
			
			rs = pstat.executeQuery();
			ArrayList<PartnerDTO> list = new ArrayList<PartnerDTO>();
			
			while (rs.next()) {
				
				
				PartnerDTO dto = new PartnerDTO();
				
				dto.setInfo(rs.getString("info1") + "(" + rs.getString("info2") + ")");
				dto.setDate(rs.getString("date1").substring(0, 10) + " ~ " + rs.getString("date2").substring(0, 10));
				dto.setPrice(rs.getString("price"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getCarList");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<PartnerDTO> getActList(HashMap<String, String> map) {
		try {
			
			String sql = "select a.name as info, ab.regdate as bookdate, p.finalprice as price from tblActivityBook ab inner join tblActivity a on ab.aseq = a.seq inner join tblBookList bl on ab.blseq = bl.seq inner join tblPayment p on p.blseq = bl.seq where a.pid = ? and ab.bsseq in (2, 3) and substr(ab.regdate, 1, 2) = ? and substr(ab.regdate, 4, 2) = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));			
			pstat.setString(2, map.get("syear"));
			pstat.setString(3, map.get("smonth"));
			
			rs = pstat.executeQuery();
			
			ArrayList<PartnerDTO> list = new ArrayList<PartnerDTO>();
			
			while (rs.next()) {
				
				PartnerDTO dto = new PartnerDTO();
				
				dto.setInfo(rs.getString("info"));
				dto.setDate(rs.getString("bookdate").substring(0, 10));
				dto.setPrice(rs.getString("price"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.getCarList");
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	//	재민님
	
	
	public ArrayList<HomeBookManageDTO> homebookmanage(String pid) {

		try {
			
			String sql = "select r.path, h.name as homename, r.name as roomname, r.price, hb.startdate, hb.enddate, u.name, u.id, u.tel, hb.bsseq, hb.seq from tblHomeBook hb inner join tblRoom r on hb.rseq = r.seq inner join tblUser u on hb.id = u.id inner join tblHome h on r.hseq = h.seq where h.pid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, pid);
			
			rs = pstat.executeQuery();
			
			ArrayList<HomeBookManageDTO> bmlist = new ArrayList<HomeBookManageDTO>();
			
			while(rs.next()) {
				
				HomeBookManageDTO dto = new HomeBookManageDTO();
				
				dto.setPath(rs.getString("path"));
				dto.setHomename(rs.getString("homename"));
				dto.setRoomname(rs.getString("roomname"));
				dto.setPrice(rs.getString("price"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setTel(rs.getString("tel"));
				dto.setBsseq(rs.getString("bsseq"));
				dto.setSeq(rs.getString("seq"));
				
				bmlist.add(dto);
				
			}
			
			return bmlist;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.bookmanage");
			e.printStackTrace();
		}
		
		return null;
	}

	public int homebookcancel(String seq) {
		
		try {
			
			String sql = "update tblHomeBook set bsseq = 4 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.homebookcancel");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int homebookconfirm(String seq) {
		
		try {
			
			String sql = "update tblHomeBook set bsseq = 2 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.homebookconfirm");
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<ActivityBookManageDTO> activitybookmanage(String pid) {

		try {
			
			String sql = "select a.path, a.name, p.finalprice, ab.count, u.id, u.name as username, u.tel, ab.bsseq, ab.seq from tblActivity a inner join tblActivitybook ab on a.seq = ab.aseq inner join tblUser u on ab.id = u.id inner join tblBookList bl on ab.blseq = bl.seq inner join tblPayment p on bl.seq = p.blseq where a.pid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, pid);
			
			rs = pstat.executeQuery();
			
			ArrayList<ActivityBookManageDTO> amlist = new ArrayList<ActivityBookManageDTO>();
			
			while (rs.next()) {
				
				ActivityBookManageDTO dto = new ActivityBookManageDTO();
				
				dto.setPath(rs.getString("path"));
				dto.setName(rs.getString("name"));
				dto.setFinalprice(rs.getString("finalprice"));
				dto.setCount(rs.getString("count"));
				dto.setId(rs.getString("id"));
				dto.setUsername(rs.getString("username"));
				dto.setTel(rs.getString("tel"));
				dto.setBsseq(rs.getString("bsseq"));
				dto.setSeq(rs.getString("seq"));
				
				amlist.add(dto);
				
			}
			
			return amlist;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.activitybookmanage");
			e.printStackTrace();
		}
		
		return null;
	}

	public int activitybookcancel(String seq) {
		
		try {
			
			String sql = "update tblActivityBook set bsseq = 4 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.activitybookcancel");
			e.printStackTrace();
		}
		
		return 0;
		
	}

	public int activitybookconfirm(String seq) {
		
		try {
			
			String sql = "update tblActivityBook set bsseq = 2 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.homebookconfirm");
			e.printStackTrace();
		}

		return 0;
		
	}

	public ArrayList<CarBookManageDTO> carbookmanage(String pid) {

		try {
			
			String sql = "select cn.path, c.carname, p.finalprice, cb.startdate, cb.enddate, u.id, u.name, u.tel, cb.bsseq, cb.seq from tblCar c inner join tblcarname cn on c.carname = cn.seq inner join tblCarBook cb on cb.cseq = c.seq inner join tblUser u on cb.id = u.id inner join tblBookList bl on cb.bseq = bl.seq inner join tblPayment p on bl.seq = p.blseq where c.pid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, pid);
			
			rs = pstat.executeQuery();
			
			ArrayList<CarBookManageDTO> cmlist = new ArrayList<CarBookManageDTO>();
			
			while (rs.next()) {
				
				CarBookManageDTO dto = new CarBookManageDTO();
				
				dto.setPath(rs.getString("path"));
				dto.setCarname(rs.getString("carname"));
				dto.setFinalprice(rs.getString("finalprice"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setBsseq(rs.getString("bsseq"));
				dto.setSeq(rs.getString("seq"));
				
				cmlist.add(dto);
				
			}
			
			return cmlist;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.carbookmanage");
			e.printStackTrace();
		}

		return null;
	}

	public int carbookcancel(String seq) {

		try {
			
			String sql = "update tblCarBook set bsseq = 4 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.carbookcancel");
			e.printStackTrace();
		}

		return 0;
	}

	public int carbookconfirm(String seq) {

		try {
			
			String sql = "update tblCarBook set bsseq = 2 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.carbookconfirm");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int insertHome(HomeAddInfoDTO dto) {
		
		try {
			
			String sql = "insert into tblHome values ((select max(seq)+1 from tblHome), ?, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPid());
			pstat.setString(2, dto.getTseq());
			pstat.setString(3, dto.getHomename());
			pstat.setString(4, dto.getLocation());
			pstat.setString(5, dto.getEnter());
			pstat.setString(6, dto.getOuter());
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.insertHome");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int insertRoom(HomeAddInfoDTO dto) {
		
		try {
			
			String sql = "insert into tblRoom values ((select max(seq)+1 from tblRoom), (select max(seq) from tblHome), 1, ?, ?, ?, 'n')";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getRoomname());
			pstat.setString(2, dto.getPrice());
			pstat.setString(3, "images/" + dto.getThumbnail());
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.insertRoom");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int insertOptionList(HomeAddInfoDTO dto) {

		try {
			
			String sql = "insert into tblOptionList values ((select max(seq) + 1 from tblOptionList), (select max(seq) from tblRoom), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getBedoption());
			pstat.setString(2, dto.getBath());
			pstat.setString(3, dto.getPet());
			pstat.setString(4, dto.getMaxpeople());
			pstat.setString(5, dto.getSmoke());
			pstat.setString(6, dto.getPool());
			pstat.setString(7, dto.getParking());
			pstat.setString(8, dto.getCook());
			pstat.setString(9, dto.getWifi());
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.insertOptionList");
			e.printStackTrace();
		}

		return 0;
	}

	public int insertRoompic(HomeAddInfoDTO dto) {

		try {
			
			String sql = "";
			int result = 0;
			
			for (int i=0; i<dto.getFilename().size()-1; i++) {
				
				sql = "insert into tblRoomPic values ((select max(seq) + 1 from tblRoomPic), (select max(seq) from tblRoom), ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, "images/" + dto.getFilename().get(i));
				
				result += pstat.executeUpdate();
				
			}
			
			if (result == dto.getFilename().size()-1) {
				result = 1;
				return result;
			}
			
		} catch (Exception e) {
			System.out.println("PartnerDAO.insertRoompic");
			e.printStackTrace();
		}

		return 0;
	}
	
	
	
	
	
	
}


























