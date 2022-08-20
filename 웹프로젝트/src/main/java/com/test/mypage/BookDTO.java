package com.test.mypage;

import lombok.Data;

@Data
public class BookDTO {

	private String seq;
	private String id;
	private String pic;
	private String bookName;
	private String roomName;
	private String startdate;
	private String enddate;
	private String checkin;
	private String checkout;
	private String location;
	private String price;
	private String state;
	private String count;
	private String period;
}
