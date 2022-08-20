package com.test.car;

import lombok.Data;

@Data
public class CarCouponDTO {
//seq / id / name / rate / value
	
	private String seq;
	private String id;
	private String name;
	private String rate;
	private String value;
	
}

// select * from tblUserCoupon uc inner join tblEvent e on e.seq = uc.eseq where id = 'user' and used = 'n' and sysdate < enddate and value = '렌터카';
