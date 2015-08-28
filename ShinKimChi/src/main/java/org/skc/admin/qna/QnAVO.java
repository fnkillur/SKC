package org.skc.admin.qna;

public class QnAVO {
	private int qna_seq;
	private String id;
	private String qna_title;
	private String qna_content;
	private int qna_parent;
	private String qna_depth;
	private int qna_state;
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQan_title() {
		return qna_title;
	}
	public void setQan_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_parent() {
		return qna_parent;
	}
	public void setQna_parent(int qna_parent) {
		this.qna_parent = qna_parent;
	}
	public String getQna_depth() {
		return qna_depth;
	}
	public void setQna_depth(String qna_depth) {
		this.qna_depth = qna_depth;
	}
	public int getQna_state() {
		return qna_state;
	}
	public void setQna_state(int qna_state) {
		this.qna_state = qna_state;
	}
	@Override
	public String toString() {
		return "QnAVO [qna_seq=" + qna_seq + ", id=" + id + ", qna_title="
				+ qna_title + ", qna_content=" + qna_content + ", qna_parent="
				+ qna_parent + ", qna_depth=" + qna_depth + ", qna_state="
				+ qna_state + "]";
	}
}
