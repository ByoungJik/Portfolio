package com.test.tripnow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Test {
	
	
	private PreparedStatement pstat;
	
	
	public static void main(String[] args) {
		
	
		Connection conn = null;
		Statement stat = null;
		ResultSet rs;
		
		try {
			conn = DBUtil.open();
			
			String sql = "select * from tblUser";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<UserDTO> list = new ArrayList<UserDTO>();
			
			while (rs.next()) {
				
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setGseq(rs.getString("gseq"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				
				list.add(dto);
				
			}
			
			System.out.println(list.toString());
			
		} catch (Exception e) {
			System.out.println("Test.main");
			e.printStackTrace();
		}
	}
}
	
	
