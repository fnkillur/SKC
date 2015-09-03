package org.skc.admin.notice;

import java.util.List;

import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface NoticeService {
	
	public List<NoticeVO> listAll(PagingCriteria cri);

	public NoticeVO read(int no_seq);

	public void modify(NoticeVO notice);

	public void delete(NoticeVO notice);

	public void regist(NoticeVO notice);
	
	public PageMaker countPaging(PagingCriteria cri);
}
