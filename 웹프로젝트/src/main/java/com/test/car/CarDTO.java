package com.test.car;

import lombok.Data;

@Data
public class CarDTO {

	// 렌터카
	private String seq;
	private String location;
	private String price;
	private String geartype;
	private String mileage;
	private String rentstart;
	private String rentend;
	private String show;
	
	
	
	/*
	private String ctseq;
	private String pid;
	private String rseq;
	
	
	
	
	 */
	// 최대 탑승인원
	private String hcvalue;
	
	
	// 연료 형태
	private String fvalue;
	private String fseq;

	
	// 차량 종류
	private String ctvalue;
	
	
	
	// 차량명
	private String cnseq;
	private String path;
	/*
	
	
	// 렌터카 예약
	private String cbseq;
	private String sseq;
	private String id;
	private String cseq;
	private String bseq;
	private String bsseq;
	private String startdate;
	private String enddate;
	
	
	
	
	// 렌터카리뷰답변
	private String crpseq;
	private String crpcontent;
	private String crpregdate;
	
	
	*/
	// 렌터카 리뷰
//	private String crseq;
//	private String content;
//	private String regdate;
	
	// 렌터카 리뷰
//	private String crseq;
	
}







































