package com.test.partner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.test.tripnow.DBUtil;

public class ActDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ActDAO() {
		conn = DBUtil.open();
	}
	
	public ActOptionDTO getActOption(String seq) {

		try {
			
			String sql = "select * from tblActivity where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			
			ActOptionDTO dto = new ActOptionDTO();
			
			if (rs.next()) {
				
				
				dto.setSeq(seq);
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setPrice(rs.getString("price"));
				dto.setPeriod(rs.getString("period").replace(" 00:00:00", ""));
				dto.setPath(rs.getString("path"));
				dto.setFpath(rs.getString("fpath"));
				dto.setContent(rs.getString("content"));
				
			}
			
			return dto;
			
			
		} catch (Exception e) {
			System.out.println("ActDAO.getActOption");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<ActOptionDTO> getPathList(String seq) {
		
		try {
			String sql = "select * from tblActPhoto where aseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();

			ArrayList<ActOptionDTO> pathlist = new ArrayList<ActOptionDTO>();
			
			
			while (rs.next()) {
				
				ActOptionDTO dto = new ActOptionDTO();
				
				dto.setApath(rs.getString("path"));
				
				pathlist.add(dto);
				
			}
			
			
			return pathlist;
			
			
		} catch (Exception e) {
			System.out.println("ActDAO.getPathList");
			e.printStackTrace();
		}
		
		
		return null;
	}

}









































