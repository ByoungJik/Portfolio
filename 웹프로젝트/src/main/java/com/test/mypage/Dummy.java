package com.test.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.tripnow.DBUtil;

public class Dummy {

	public static void main(String[] args) {
		
		//게시글 더미 생성하기
		

		int category = (int)(Math.floor(Math.random() * 5 + 1));
		String sql = "insert into tblQuestion values (seqQuestion.nextVal, 'truser', ?, ?, ?, sysdate)";
		
		
		//시드 데이터
		
		String[] subject = { "게시판을", "안녕하세요", "안녕", "배고파", "점심시간", "홍길동입니다", "아무개", "친구야", "반가워요", "인사", "비가", "많이", "힘드네요", "졸려요", "테스트중", "입니다", "뭐라고?", "습도가 높아요", "하이", "반갑습니당"};
		
		String content = "내용입니다.";
		

		
		
		Connection conn = null;
		PreparedStatement pstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			pstat = conn.prepareStatement(sql);
			Random rnd = new Random();
			
			for (int i=0; i<40; i++) {
				pstat.setInt(1, category);
				pstat.setString(2, subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)] + " " + subject[rnd.nextInt(subject.length)]);
				pstat.setString(3, content);
				
				pstat.executeUpdate();
				
			}
			
		} catch (Exception e) {
			System.out.println("Dummy");
			e.printStackTrace();
		}
		
	}
}
