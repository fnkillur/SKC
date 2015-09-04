package org.skc.admin.store;

import java.util.Date;

public class StoreVO {
	/*
	create table tbl_store(
			id varchar(50) not null,
			st_name varchar(100) not null,
			st_tel int primary key,
			st_addr varchar(200) not null,
			st_x double(9,6) not null,
			st_y double(9,6) not null,
			st_time varchar(50) not null,
			st_type varchar(50) not null,
			st_state int default 0,
			st_date timestamp not null default now(),
			st_img varchar(200),
			st_intro varchar(200)
	);
	*/
	
	private String id;
	private String st_name;
	private int st_tel;
	private String st_addr;
	private double st_x;
	private double st_y;
	private String st_type;
	private String st_time;
	private int st_state;
	private Date st_date;
	private String st_img;
	private String st_intro;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	
	public int getSt_tel() {
		return st_tel;
	}
	public void setSt_tel(int st_tel) {
		this.st_tel = st_tel;
	}
	public String getSt_addr() {
		return st_addr;
	}
	public void setSt_addr(String st_addr) {
		this.st_addr = st_addr;
	}
	public double getSt_x() {
		return st_x;
	}
	public void setSt_x(double st_x) {
		this.st_x = st_x;
	}
	public double getSt_y() {
		return st_y;
	}
	public void setSt_y(double st_y) {
		this.st_y = st_y;
	}
	public String getSt_time() {
		return st_time;
	}
	public void setSt_time(String st_time) {
		this.st_time = st_time;
	}
	public int getSt_state() {
		return st_state;
	}
	public void setSt_state(int st_state) {
		this.st_state = st_state;
	}
	public Date getSt_date() {
		return st_date;
	}
	public void setSt_date(Date st_date) {
		this.st_date = st_date;
	}
	public String getSt_type() {
		return st_type;
	}
	public void setSt_type(String st_type) {
		this.st_type = st_type;
	}
	public String getSt_img() {
		return st_img;
	}
	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}
	public String getSt_intro() {
		return st_intro;
	}
	public void setSt_intro(String st_intro) {
		this.st_intro = st_intro;
	}
	
	@Override
	public String toString() {
		return "StoreVO [id=" + id + ", st_name=" + st_name + ", st_tel="
				+ st_tel + ", st_addr=" + st_addr + ", st_x=" + st_x
				+ ", st_y=" + st_y + ", st_type=" + st_type + ", st_time="
				+ st_time + ", st_state=" + st_state + ", st_date=" + st_date
				+ "]";
	}
	
	
}
