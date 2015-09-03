package org.skc.storepage;

public class MenuVO {
	
	/*
	create table tbl_menu(
			me_seq int primary key auto_increment,
			me_name varchar(150) not null,
			me_price int not null,
			me_img varchar(100),
			me_weight int default 0,
			me_grade int default 0,
			st_tel int not null
	);
	*/
	
	private int me_seq;
	private String me_name;
	private int me_price;
	private String me_img;
	private String me_weight;
	private int me_grade;
	private int st_tel;
	
	public int getMe_seq() {
		return me_seq;
	}
	public void setMe_seq(int me_seq) {
		this.me_seq = me_seq;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public int getMe_price() {
		return me_price;
	}
	public void setMe_price(int me_price) {
		this.me_price = me_price;
	}
	public String getMe_img() {
		return me_img;
	}
	public void setMe_img(String me_img) {
		this.me_img = me_img;
	}
	public String getMe_weight() {
		return me_weight;
	}
	public void setMe_weight(String me_weight) {
		this.me_weight = me_weight;
	}
	public int getMe_grade() {
		return me_grade;
	}
	public void setMe_grade(int me_grade) {
		this.me_grade = me_grade;
	}
	public int getSt_tel() {
		return st_tel;
	}
	public void setSt_tel(int st_tel) {
		this.st_tel = st_tel;
	}
	
}