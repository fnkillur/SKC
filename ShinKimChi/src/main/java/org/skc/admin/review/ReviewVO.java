package org.skc.admin.review;

public class ReviewVO {

	private int re_seq;
	private String id;
	private String re_content;
	private int re_grade;
	private int re_state;
	private int re_parent;
	private int re_depth;
	private int me_seq;
	
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_grade() {
		return re_grade;
	}
	public void setRe_grade(int re_grade) {
		this.re_grade = re_grade;
	}
	public int getRe_state() {
		return re_state;
	}
	public void setRe_state(int re_state) {
		this.re_state = re_state;
	}
	public int getRe_parent() {
		return re_parent;
	}
	public void setRe_parent(int re_parent) {
		this.re_parent = re_parent;
	}
	public int getRe_depth() {
		return re_depth;
	}
	public void setRe_depth(int re_depth) {
		this.re_depth = re_depth;
	}
	public int getMe_seq() {
		return me_seq;
	}
	public void setMe_seq(int me_seq) {
		this.me_seq = me_seq;
	}
	
	
}
