package com.test.mypage;

import lombok.Data;

@Data
public class QnADTO {

	private String qseq;
	private String aseq;
	private String id;
	private String category;
	private String qsubject;
	private String qcontent;
	private String qregdate;
	private String acontent;
	private String aregdate;
	private String state;
}
