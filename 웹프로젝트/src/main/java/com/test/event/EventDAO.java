package com.test.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.activitiy.ActivityDTO;
import com.test.tripnow.DBUtil;

public class EventDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public EventDAO() {
		conn = DBUtil.open();
	}
	
	public ArrayList<EventMainDTO> eventlist() {
		
		try {
			
			String sql = "select seq, eventname, bennerpicture, rate, value, finished from tblevent";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<EventMainDTO> list = new ArrayList<EventMainDTO>();
			
			while (rs.next()) {
				
				EventMainDTO dto = new EventMainDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setEventname(rs.getString("eventname"));
				dto.setBennerpicture(rs.getString("bennerpicture"));
				dto.setRate(rs.getString("rate"));
				dto.setValue(rs.getString("value"));
				dto.setFinished(rs.getString("finished"));
				
				list.add(dto);
				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("EventDAO.eventlist");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	public String getCoupon(EventMainDTO dto) {
		
		try {
			// 쿠폰이 이미 있거나 사용했는지 확인
			String sql = "select count(eseq)as count from tblUserCoupon where eseq like ? and id like ?"; 
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			pstat.setString(2, dto.getUserid());
			
			rs = pstat.executeQuery();
			
			int count = 0;
			
			
			while(rs.next()) {
				
				count = rs.getInt("count");
				
			}
			
			// 카운트가 0이 아닐경우 exit
			if(count != 0 ) {
				
				return "이미 사용하거나 가지고 있는 쿠폰입니다.";
			}
			
			
			sql = "insert into tblUserCoupon values((select max(seq)+1 from tblUserCoupon),?,?,'n')";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getUserid());
			pstat.setString(2, dto.getSeq());
			
			
			pstat.executeUpdate();
			
			
			return "쿠폰을 받았습니다.";
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "실패!";
	}

	public ArrayList<CouponDTO> couponlist(CouponDTO dto) {
		try {
			
			String sql ="select a.* , b.name , b.enddate, b.rate , b.value, b.finished from tblUserCoupon a left outer join tblEvent b on a.eseq = b.seq where a.id like ? and a.used like 'n' and b.finished like 'y'  order by enddate ";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			
			rs = pstat.executeQuery();
			
			ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
			
			while(rs.next()) {
				
				CouponDTO listDto = new CouponDTO();
				
				
				listDto.setName(rs.getString("name"));
				listDto.setEnddate(rs.getString("enddate"));
				listDto.setValue(rs.getString("value"));
				listDto.setRate(rs.getInt("rate"));
				listDto.setEseq(rs.getString("eseq"));
				
				
			
				list.add(listDto);
				
			}
			
			
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("EventDAO.couponlist");
			e.printStackTrace();
		}
		return null;
	}

	public CouponDTO getEvent(CouponDTO cdto) {
		
		try {
			
			String sql ="select * from tblEvent where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, cdto.getEseq());
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				cdto.setRate(rs.getInt("rate"));
				
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("EventDAO.getEvent");
			e.printStackTrace();
		}
		
		return null;
	}



	
	
}





















