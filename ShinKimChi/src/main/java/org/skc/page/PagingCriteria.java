package org.skc.page;

public class PagingCriteria {

	private int page = 1;
	private int perPageNum = 20;
	private int displayPageNum = 10;
	private int nextPage;
	
	private String searchType;
	private String keyword;
	
	
	public int getNextPage() {
		return nextPage;
	}
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
	public PagingCriteria setPage(int page) {
		this.page = page;
		this.nextPage = (page-1)*10; 
		return this;
	}
	public int getPage() {
		return page;
	}
	public int getPageStart(){
		return (this.page-1)* perPageNum;
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
	@Override
	public String toString() {
		return "PagingCriteria [page=" + page + ", perPageNum=" + perPageNum
				+ ", displayPageNum=" + displayPageNum + ", nextPage="
				+ nextPage + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}

}
