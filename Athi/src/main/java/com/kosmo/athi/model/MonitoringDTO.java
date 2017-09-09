package com.kosmo.athi.model;

import java.sql.Date;

public class MonitoringDTO {
	
	private java.sql.Date date;
	private int num;
	
	public MonitoringDTO() {}
	public MonitoringDTO(Date date, int num) {
		this.date = date;
		this.num = num;
	}
	
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
