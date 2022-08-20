package com.test.partner;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private String seq;
	private String id;
	private String star;
	private String content;
	private String regdate;
	private String name;
	
	
	private String rregdate;
	private String rcontent;
	
	
}
