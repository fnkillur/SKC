package org.skc.mypage;

public class MemberVO {

	/*
	create table tbl_member(
			id varchar(50) primary key not null,
			pw varchar(50) not null,
			name varchar(50) not null,
			nick varchar(50) not null,
			aut int not null
			);
	*/
	
	private String id;
	private String pw;
	private String name;
	private String nick;
	private int aut;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getAut() {
		return aut;
	}
	public void setAut(int aut) {
		this.aut = aut;
	}
	
}
