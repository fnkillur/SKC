package org.skc.admin.notice;

import java.util.List;

import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface NoticeService {
	
	public List<NoticeVO> listAll(PagingCriteria cri) throws Exception;

	public NoticeVO read(int no_seq) throws Exception;

	public void modify(NoticeVO notice) throws Exception;

	public void delete(NoticeVO notice) throws Exception;

	public void regist(NoticeVO notice) throws Exception;
	
	public PageMaker countPaging(PagingCriteria cri) throws Exception;
}
