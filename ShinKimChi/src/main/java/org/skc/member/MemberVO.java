package org.skc.member;

public class MemberVO {

	public String id;
	public String pw;
	public String name;
	public String nick;
	public int aut;
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
