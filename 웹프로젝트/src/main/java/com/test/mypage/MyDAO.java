package com.test.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.member.MemberDTO;
import com.test.tripnow.DBUtil;

public class MyDAO {

	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;
	
	public MyDAO() {
		conn = DBUtil.open();
	}
	

	public int pwCheck(MemberDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			System.out.println("MemberDAO.pwCheck");
			e.printStackTrace();
		}
		return 0;
	}


	//id와 카테고리(방, 렌터카, 액티비티)를 넘겨 받으면 예약을 조회해 "예약중"인 예약이 있는지 여부(int 0 || int 1)를 반환하는 메소드 
	public int checkList(String id, String category) {
		
		try {
			
			String tbl;
			if (category.equals("home")) {
				tbl = "tblHomeBook";
			} else if (category.equals("car")) {
				tbl = "tblCarBook";
			} else {
				tbl = "tblActivityBook";
			}
			
			String sql = "select count(*) as cnt from " + tbl + " where id = ? and bsseq = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("MyDAO.checkbooklist");
			e.printStackTrace();
		}
		return 0;
	}


	//id를 받아온다
	//String tbl 매개변수가 존재할 경우 tblHomeBook에서 예약 상태가 '예약중'인 예약을 조회
	//String tbl 매개변수가 빈문자열일 경우 모든 예약을 조회
	//ArrayList<BookDTO>에 담아 반환
	public ArrayList<BookDTO> getHomeBookingList(String id, String tbl) {
		
		try {
			
			String where = "";
			
			if (tbl != "") {
				where = " and " + tbl + ".bsseq = 1";
			}
			
			String sql = "select hb.seq as seq, hb.id as id, r.path as pic, h.name as bookname, r.name as roomname, hb.startdate as startdate, hb.enddate as enddate, h.enterhome as checkin, h.outerhome as checkout, h.location as location, r.price as price, bs.value as state, (hb.enddate - hb.startdate) as period from tblHomeBook hb inner join tblRoom r on hb.rseq = r.seq inner join tblHome h on r.hseq = h.seq inner join tblBookState bs on hb.bsseq = bs.seq where hb.id = ?" + where;
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();

			ArrayList<BookDTO> list = new ArrayList<BookDTO>();
			
			while (rs.next()) {
				
				BookDTO dto = new BookDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(id);
				dto.setPic(rs.getString("pic"));
				dto.setBookName(rs.getString("bookname"));
				dto.setRoomName(rs.getString("roomname"));
				dto.setStartdate(rs.getString("startdate").substring(0, 10));
				dto.setEnddate(rs.getString("enddate").substring(0, 10));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getInt("price") * rs.getInt("period") + "");
				dto.setState(rs.getString("state"));
				dto.setPeriod(rs.getString("period"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MyDAO.getHomeBookingList");
			e.printStackTrace();
		}
		
		return null;
	}


	public ArrayList<BookDTO> getCarBookingList(String id, String tbl) {
		
		try {
			
			String where = "";
			
			if (tbl != "") {
				where = " and " + tbl + ".bsseq = 1";
			}
			
			String sql = "select cb.seq as seq, cb.id as id, cn.path as pic, cn.seq as bookname, cb.startdate as startdate, cb.enddate as enddate, c.rentstart as checkin, c.rentend as checkout, c.location as location, c.price as price, bs.value as state, (cb.enddate - cb.startdate) as period from tblCarBook cb inner join tblCar c on cb.cseq = c.seq inner join tblCarType ct on c.ctseq = ct.seq inner join tblCarName cn on ct.seq = cn.tseq inner join tblBookState bs on cb.bsseq = bs.seq where cb.id = ?" + where;
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<BookDTO> list = new ArrayList<BookDTO>();
			while (rs.next()) {
				
				BookDTO dto = new BookDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setPic(rs.getString("pic"));
				dto.setId(rs.getString("id"));
				dto.setBookName(rs.getString("bookname"));
				dto.setStartdate(rs.getString("startdate").substring(0, 10));
				dto.setEnddate(rs.getString("enddate").substring(0, 10));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getInt("price") * rs.getInt("period") + "");
				dto.setState(rs.getString("state"));
				dto.setPeriod(rs.getString("period"));
				
				list.add(dto);
				
			}

			return list;
		} catch (Exception e) {
			System.out.println("MyDAO.getCarBookingList");
			e.printStackTrace();
		}
		
		return null;
	}


	public ArrayList<BookDTO> getActBookingList(String id, String tbl) {

		try {

			String where = "";
			
			if (tbl != "") {
				where = " and " + tbl + ".bsseq = 1";
			}
			
			String sql = "select ab.seq as seq, ab.id as id, a.path as pic, a.name as bookname, ab.regdate as startdate, a.period as enddate, a.location as location, a.price as price, ab.count as count, bs.value as state from tblActivityBook ab inner join tblActivity a on ab.aseq = a.seq inner join tblBookState bs on ab.bsseq = bs.seq where id = ?" + where;
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<BookDTO> list = new ArrayList<BookDTO>();
			while (rs.next()) {
				
				BookDTO dto = new BookDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setPic(rs.getString("pic"));
				dto.setBookName(rs.getString("bookname"));
				dto.setStartdate(rs.getString("startdate").substring(0, 10));
				dto.setEnddate(rs.getString("enddate").substring(0, 10));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getInt("price") * rs.getInt("count") + "");
				dto.setCount(rs.getString("count"));
				dto.setState(rs.getString("state"));
				
				list.add(dto);
				
			}
			return list;
			
			
		} catch (Exception e) {
			System.out.println("MyDAO.getActBookingList");
			e.printStackTrace();
		}
		
		return null;
	}


	//id로 숙소 예약 목록을 검색, '예약중'(1)인 예약의 예약 상태를 취소(4)로 바꾸기
	public int cancelHome(String id) {
		
		try {
			
			String sql = "update tblHomeBook set bsseq = 4 where id = ? and bsseq = 1";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MyDAO.cancelHome");
			e.printStackTrace();
		}
		
		
		return -1;
	}


	public int cancelAct(String id) {
		
		try {
			
			String sql = "update tblActivityBook set bsseq = 4 where id = ? and bsseq = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MyDAO.cancelAct");
			e.printStackTrace();
		}
		return -1;
	}


	public int cancelCar(String id) {

		try {
			
			String sql = "update tblCarBook set bsseq = 4 where id = ? and bsseq = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			return pstat.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("MyDAO.cancelCar");
			e.printStackTrace();
		}
		
		return -1;
	}


	public int unregister(String id) {

		try {
			
			String sql = "update tblUser set gseq = 4 where id = ?";
			
			pstat = conn.prepareStatement(sql);		
			pstat.setString(1,  id);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MyDAO.unregister");
			e.printStackTrace();
		}
		
		return 0;
	}


	//id를 넘겨주면 MemberDTO에 회원정보를 담아 반환
	public MemberDTO getInfo(String id) {
		
		try {
			
			String sql = "select * from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setBirth(rs.getString("birth").substring(0, 10).replace("-", ""));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setTel1(rs.getString("tel").substring(0, 3));				
				dto.setTel2(rs.getString("tel").substring(3, 7));
				dto.setTel3(rs.getString("tel").substring(7));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("MyDAO.getInfo");
			e.printStackTrace();
		}
		
		return null;
	}


	//수정될 정보 MemberDTO를 넘겨주면 해당 정보로 회원 정보를 수정
	public int editinfo(MemberDTO dto) {
		
		try {
			
			String sql;
			
			if (dto.getPw() == null || dto.getPw().equals("")) {

				sql = "update tblUser set name = ?, tel = ?, email = ? where id = ?";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getName());
				pstat.setString(2, dto.getTel());
				pstat.setString(3, dto.getEmail());
				pstat.setString(4, dto.getId());
				
			} else {				
				
				sql = "update tblUser set pw = ?, name = ?, tel = ?, email = ? where id = ?";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getPw());
				pstat.setString(2, dto.getName());
				pstat.setString(3, dto.getTel());
				pstat.setString(4, dto.getEmail());
				pstat.setString(5, dto.getId());
			}
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MyDAO.editinfo");
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<QnADTO> getQnAList(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select q.seq as qseq, a.seq as aseq, q.id as id, qc.value as category, q.title as qsubject, q.content as qcontent, q.regdate as qregdate, a.content as acontent, a.regdate as aregdate, case when q.id = 'admin' then ' ' when a.seq is null then '처리중' when a.seq is not null then '답변완료' end as state from tblQuestion q left outer join tblAnswer a on q.seq = a.qseq inner join tblQuestionCategory qc on q.cseq = qc.seq where q.id = ? order by q.seq desc) a) where rnum between %s and %s", map.get("begin"), map.get("end"));

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			
			rs = pstat.executeQuery();
			
			ArrayList<QnADTO> list = new ArrayList<QnADTO>();

			while (rs.next()) {
				
				QnADTO dto = new QnADTO();
				
				dto.setQseq(rs.getString("qseq"));
				dto.setAseq(rs.getString("aseq"));
				dto.setId(rs.getString("id"));
				dto.setCategory(rs.getString("category"));
				dto.setQsubject(rs.getString("qsubject"));
				dto.setQcontent(rs.getString("qcontent"));
				dto.setQregdate(rs.getString("qregdate").substring(0, 10));
				dto.setAcontent(rs.getString("acontent"));
				
				if (rs.getString("aregdate") != null) {					
					dto.setAregdate(rs.getString("aregdate").substring(0, 10));
				} else {					
					dto.setAregdate(rs.getString("aregdate"));
				}
				
				dto.setState(rs.getString("state"));
			
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			System.out.println("MyDAO.getQnAList");
			e.printStackTrace();
		}
		
		return null;
	}


	public int getTotalCount(String id) {
		
		
		try {
			
			String sql = "select count(*) as cnt from tblQuestion q left outer join tblAnswer a on q.seq = a.qseq inner join tblQuestionCategory qc on q.cseq = qc.seq where q.id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println("MyDAO.getTotalCount");
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<QnADTO> getNoticeList() {
		
		try {
			
			String sql = "select q.seq as qseq, a.seq as aseq, q.id as id, qc.value as category, q.title as qsubject, q.content as qcontent, q.regdate as qregdate, a.content as acontent, a.regdate as aregdate, case when q.id = 'admin' then ' ' when a.seq is null then '처리중' when a.seq is not null then '답변완료' end as state from tblQuestion q left outer join tblAnswer a on q.seq = a.qseq inner join tblQuestionCategory qc on q.cseq = qc.seq where q.id = 'admin' order by q.seq desc";
			
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<QnADTO> nlist = new ArrayList<QnADTO>();

			while (rs.next()) {
				
				QnADTO dto = new QnADTO();
				
				dto.setQseq(rs.getString("qseq"));
				dto.setAseq(rs.getString("aseq"));
				dto.setId(rs.getString("id"));
				dto.setCategory(rs.getString("category"));
				dto.setQsubject(rs.getString("qsubject"));
				dto.setQcontent(rs.getString("qcontent"));
				dto.setQregdate(rs.getString("qregdate").substring(0, 10));
				dto.setAcontent(rs.getString("acontent"));
				
				if (rs.getString("aregdate") != null) {					
					dto.setAregdate(rs.getString("aregdate").substring(0, 10));
				} else {					
					dto.setAregdate(rs.getString("aregdate"));
				}
				
				dto.setState(rs.getString("state"));
				
				nlist.add(dto);
			}
			
			return nlist;
			
		} catch (Exception e) {
			System.out.println("MyDAO.getNoticeList");
			e.printStackTrace();
		}
		
		return null;
	}


	public QnADTO getQnAView(String seq) {
		
		try {
			
			String sql = "select q.seq as qseq, a.seq as aseq, q.id as id, qc.value as category, q.title as qsubject, q.content as qcontent, q.regdate as qregdate, a.content as acontent, a.regdate as aregdate, case when q.id = 'admin' then ' ' when a.seq is null then '처리중' when a.seq is not null then '답변완료' end as state from tblQuestion q left outer join tblAnswer a on q.seq = a.qseq inner join tblQuestionCategory qc on q.cseq = qc.seq where q.seq = ? order by q.seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				QnADTO dto = new QnADTO();
				
				dto.setQseq(rs.getString("qseq"));
				dto.setAseq(rs.getString("aseq"));
				dto.setId(rs.getString("id"));
				dto.setCategory(rs.getString("category"));
				dto.setQsubject(rs.getString("qsubject"));
				dto.setQcontent(rs.getString("qcontent"));
				dto.setQregdate(rs.getString("qregdate").substring(0, 10));
				dto.setAcontent(rs.getString("acontent"));
				
				if (rs.getString("aregdate") != null) {					
					dto.setAregdate(rs.getString("aregdate").substring(0, 10));
				} else {					
					dto.setAregdate(rs.getString("aregdate"));
				}
				
				dto.setState(rs.getString("state"));
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("MyDAO.getQnAView");
			e.printStackTrace();
		}
		return null;
	}


	public int addQuestion(QnADTO dto) {
		
		try {
			
			String sql = "insert into tblQuestion values ((select max(seq) from tblQuestion) + 1, ?, ?, ?, ?, sysdate)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getCategory());
			pstat.setString(3, dto.getQsubject());
			pstat.setString(4, dto.getQcontent());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MyDAO.addQuestion");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
}
