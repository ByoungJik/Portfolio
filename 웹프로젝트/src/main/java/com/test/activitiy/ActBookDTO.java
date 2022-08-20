package com.test.activitiy;

import lombok.Data;

@Data
public class ActBookDTO {
	
	//예약번호
	private String seq;
	//입금상태번호
	private String pseq;
	//액티비티번호
	private String aseq;
	//유저아이디
	private String id;
	//예약리스트번호
	private String blseq;
	//예약상태번호
	private String bsseq;
	
	// 주문날자
	private String regdate;
	
	//수량
	private String count;
	
	//총 결제금액
	private String totalprice;

}
