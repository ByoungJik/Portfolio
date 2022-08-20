package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.tripnow.DBUtil;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;
	
	public MemberDAO() {
		conn = DBUtil.open();
	}

	public int idcheck(String id) {

		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("MemberDAO.idcheck");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int memberadd(MemberDTO dto) {
		
		try {

			String sql = "insert into tblUser values (?, 3, ?, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getBirth());
			pstat.setString(6, dto.getGender());
			pstat.setString(7, dto.getEmail());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberDAO.memberadd");
			e.printStackTrace();
		}
		
		return 0;
	}

	public MemberDTO logincheck(MemberDTO dto) {

		try {
			
			String sql = "select * from tblUser where id = ? and pw = ? and gseq not in (4, 5)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setGseq(rs.getString("gseq"));
				return dto;
			}
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.logincheck");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public MemberDTO findId(MemberDTO dto) {
		
		try {
			
			String sql = "select * from tblUser where name = ? and tel = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTel());
			
			rs = pstat.executeQuery();
			System.out.println("2번");
			if (rs.next()) {
				
				dto.setId(rs.getString("id"));
				return dto;
				
			} else {
				
				dto.setId("null");
			}
			
		} catch (Exception e) {
			System.out.println("MemberDAO.findId");
			e.printStackTrace();
		}
		
		return dto;
	}

	public int idemailcheck(MemberDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ? and email = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getEmail());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.idemailcheck");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int changePW(MemberDTO dto) {

		try {
			
			String sql = "update tblUser set pw = ? where id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getId());
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println("MemberDAO.changePW");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	
	
	
	
	
	
	
}