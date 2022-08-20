package com.test.car;

public class Comparator implements java.util.Comparator<CarDTO> {

	@Override
	public int compare(CarDTO o1, CarDTO o2) {

		return o1.getSeq().compareTo(o2.getSeq());
	}

	

}
