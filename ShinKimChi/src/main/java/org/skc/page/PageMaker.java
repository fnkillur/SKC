package org.skc.page;


public class PageMaker {
	
	private int totalCount;
	private int first = 1;
	private int last = 10;
	private int prev = 1;
	private int next = 11;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public PageMaker calcPage(PagingCriteria cri) {
		
		int page = cri.getPage();
		double perPageNum = cri.getPerPageNum();
		double displayPageNum = cri.getDisplayPageNum();
		
		double tempLast = Math.ceil(page / (double) displayPageNum) * displayPageNum;
		
		first = (int)(tempLast - displayPageNum) +1;
		
		last = (int)(totalCount < tempLast*perPageNum ? 
						Math.ceil(totalCount/(double)perPageNum) :
						tempLast);
		
		prev = first > 1 ? first -1 : 0;
		next = totalCount > last * perPageNum ? last +1 : 0;
		
		return this;
	}
}
