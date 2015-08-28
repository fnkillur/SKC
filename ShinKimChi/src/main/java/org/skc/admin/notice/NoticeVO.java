package org.skc.admin.notice;

public class NoticeVO {
	
	/*	
	create table tbl_notice(
		no_seq int primary key,
		no_title varchar(50) not null,
		no_content varchar(200) not null,
		no_viewcnt int
	);
	*/
	
	private int no_seq;
	private String no_title;
	private String no_content;
	private int no_viewcnt;
	
	public int getNo_seq() {
		return no_seq;
	}
	public void setNo_seq(int no_seq) {
		this.no_seq = no_seq;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public int getNo_viewcnt() {
		return no_viewcnt;
	}
	public void setNo_viewcnt(int no_viewcnt) {
		this.no_viewcnt = no_viewcnt;
	}
	
	
}
