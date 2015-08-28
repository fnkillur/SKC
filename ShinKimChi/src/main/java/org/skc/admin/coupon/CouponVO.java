package org.skc.admin.coupon;

import java.util.Date;

public class CouponVO {

	/*
	create table tbl_coupon(
			cp_seq int primary key auto_increment,
			st_tel int not null,
			id varchar(50) not null,
			cp_num varchar(50) not null,
			cp_startdate timestamp,
			cp_enddate varchar(50),
			cp_state int not null
	);
	*/
	
	private int cp_seq;
	private int st_tel;
	private String id;
	private String cp_num;
	private Date cp_startdate;
	private String cp_enddate;
	private int cp_state;
	
	private String st_name;
	
	public int getCp_seq() {
		return cp_seq;
	}
	public void setCp_seq(int cp_seq) {
		this.cp_seq = cp_seq;
	}
	public int getSt_tel() {
		return st_tel;
	}
	public void setSt_tel(int st_tel) {
		this.st_tel = st_tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCp_num() {
		return cp_num;
	}
	public void setCp_num(String cp_num) {
		this.cp_num = cp_num;
	}
	public Date getCp_startdate() {
		return cp_startdate;
	}
	public void setCp_startdate(Date cp_startdate) {
		this.cp_startdate = cp_startdate;
	}
	public String getCp_enddate() {
		return cp_enddate;
	}
	public void setCp_enddate(String cp_enddate) {
		this.cp_enddate = cp_enddate;
	}
	public int getCp_state() {
		return cp_state;
	}
	public void setCp_state(int cp_state) {
		this.cp_state = cp_state;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	
	
}
