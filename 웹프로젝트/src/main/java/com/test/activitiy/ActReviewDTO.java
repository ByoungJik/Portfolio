package com.test.activitiy;

import lombok.Data;

@Data
public class ActReviewDTO {
	
	// 댓글번호
	private String seq;
	
	// 예약 번호
	private String rseq;

	// 액티비티 상품 번호
	private String aseq ;
	
	// 사용자 id
	private String id ;
	
	// 사용자 이름
	private String name ;
	
	// 리뷰 등록일
	private String regdate;
	
	//리뷰 내용
	private String content;
	
	//별점
	private int star; 
	
	
	// 답변자 리뷰 내용
	private String acontent;
	
	
	
}
