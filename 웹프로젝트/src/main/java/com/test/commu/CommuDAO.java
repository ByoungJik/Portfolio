package com.test.commu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.tripnow.DBUtil;

public class CommuDAO {
		
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CommuDAO() {
		conn = DBUtil.open();
	}

	public int addCommu(CommuDTO dto) {

		try {
			
			String sql = "";
			

			if(dto.getId().equals("admin")) {
				
				sql = "insert into tblBoard values ((select max(seq) from tblBoard) + 1, ?, ?, ?, default, default, '공지', 1000)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getId());
				pstat.setString(2, dto.getSubject());
				pstat.setString(3, dto.getContent());
				
				return pstat.executeUpdate();
				
			} else {
				
				sql = "insert into tblBoard values ((select max(seq) from tblBoard) + 1, ?, ?, ?, default, default, default, default)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getId());
				pstat.setString(2, dto.getSubject());
				pstat.setString(3, dto.getContent());
				
				return pstat.executeUpdate();
				
			}
			
		} catch (Exception e) {
			System.out.println("CommuDAO.addCommu");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<CommuDTO> commulist(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwCommu) a) where rnum between %s and %s", map.get("begin"), map.get("end"));
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<CommuDTO> clist = new ArrayList<CommuDTO>();
			
			while (rs.next()) {
				
				CommuDTO dto = new CommuDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCommutype(rs.getString("commutype"));
				dto.setCommentcount(rs.getString("commentcount"));
				
				clist.add(dto);
				
			}
			
			return clist;
			
			
		} catch (Exception e) {
			System.out.println("CommuDAO.commulist");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String sql = "select count(*) as cnt from tblBoard";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			System.out.println("CommuDAO.getTotalCount");
			e.printStackTrace();
		}
		
		return 0;
	}

	public CommuDTO getview(CommuDTO boxdto) {
		
		try {
			
			String sql = "select seq, id, subject, content, readcount, regdate, commutype from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, boxdto.getSeq());
			
			rs = pstat.executeQuery();

			CommuDTO dto = new CommuDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCommutype(rs.getString("commutype"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("CommuDAO.getview");
			e.printStackTrace();
		}
		
		return null;
	}

	public void updateReadcount(String seq) {
		
		try {
			
			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println("CommuDAO.updateReadcount");
			e.printStackTrace();
		}
		
	}

	public ArrayList<CommuDTO> listComment(String seq) {
		
		try {
			
String sql = "select * from tblComment where bseq = ? order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CommuDTO> clist = new ArrayList<CommuDTO>();
			
			while (rs.next()) {
				
				CommuDTO dto = new CommuDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				
				clist.add(dto);
			}
			
			return clist;
			
		} catch (Exception e) {
			System.out.println("CommuDAO.listComment");
			e.printStackTrace();
		}
		
		return null;
	}

	public void delCommentSEQ(String seq) {

		try {
			
			String sql = "delete from tblComment where bseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CommuDAO.delCommentSEQ");
			e.printStackTrace();
		}
		
	}

	public int delCommu(String seq) {
		
		try {
			
			String sql = "delete from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CommuDAO.delCommu");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addCommuComment(CommuCommentDTO dto) {

		try {
			
			String sql = "insert into tblComment values ((select max(seq) from tblComment) + 1, ?, ?, default, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getBseq());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CommuDAO.addCommuComment");
			e.printStackTrace();
		}
		
		return 0;
	}

	public CommuCommentDTO getComment() {

		try {
			
			String sql = "select * from tblComment where seq = (select max(seq) from tblComment)";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			CommuCommentDTO dto = new CommuCommentDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setBseq(rs.getString("bseq"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("CommuDAO.getComment");
			e.printStackTrace();
		}
		
		return null;
	}

	public int delComment(String seq) {
		
		try {
			
			String sql = "delete from tblComment where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CommuDAO.delComment");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editCommetn(CommuCommentDTO dto) {
		
		try {
			
			String sql = "update tblComment set content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CommuDAO.editCommetn");
			e.printStackTrace();
		}
		
		return 0;
	}

	public CommuDTO getcommu(String seq) {

		try {
			
			String sql = "select seq, subject, content from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			CommuDTO dto = new CommuDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("CommuDAO.getcommu");
			e.printStackTrace();
		}
		
		return null;
	}

	public int editCommu(CommuDTO dto) {

		try {
			
			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("CommuDAO.editCommu");
			e.printStackTrace();
		}
		
		return 0;
	}

}




















