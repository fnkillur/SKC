package org.skc.page;

public class PagingCriteria {
	
	private int page = 1;
	private int perPageNum = 10;
	private int displayPageNum = 10;
	private String searchType;
	private String keyword;
	private int nextPage;
	
	//Notice
	private int no_seq;
	
	//Store
	private int st_tel;
	private String sortType = "s";
	private String btnType;
	
	//coupon
	private int cp_seq;
	
	public String getSearchType() {
		return searchType;
	}
	public PagingCriteria setSearchType(String searchType) {
		this.searchType = searchType;
		return this;
	}
	public String getKeyword() {
		return keyword;
	}
	public PagingCriteria setKeyword(String keyword) {
		this.keyword = keyword;
		return this;
	}
	public int getNo_seq() {
		return no_seq;
	}
	public void setNo_seq(int no_seq) {
		this.no_seq = no_seq;
	}
	public int getPage() {
		return page;
	}
	public PagingCriteria setPage(int page) {
		this.page = page;
		return this;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public PagingCriteria setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
		return this;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public PagingCriteria setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		return this;
	}
	public int getSt_tel() {
		return st_tel;
	}
	public PagingCriteria setSt_tel(int st_tel) {
		this.st_tel = st_tel;
		return this;
	}
	public String getSortType() {
		return sortType;
	}
	public PagingCriteria setSortType(String sortType) {
		this.sortType = sortType;
		return this;
	}
	public String getBtnType() {
		return btnType;
	}
	public PagingCriteria setBtnType(String btnType) {
		this.btnType = btnType;
		return this;
	}
	public int getCp_seq() {
		return cp_seq;
	}
	public void setCp_seq(int cp_seq) {
		this.cp_seq = cp_seq;
	}
	public int getPageStart(){
		
		return (this.page -1)* perPageNum;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
}
