package com.test.event;

import lombok.Data;

@Data
public class CouponDTO {
	
	
	//이벤트seq
	private String eseq;
		
	//유저id
	private String id;
	
	//쿠폰명
	private String name;
	//카테고리
	private String value;
	//종료일
	private String enddate;
	//할인율
	private int rate;
	
}
