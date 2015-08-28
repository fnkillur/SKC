package org.skc.admin.notice;

import java.util.List;

import javax.inject.Inject;

import org.skc.mapper.NoticeMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Inject
	private 	NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> listAll(PagingCriteria cri) throws Exception {
		
		return mapper.listAll(cri);
	}

	@Override
	public NoticeVO read(int no_seq) throws Exception {
		
		return mapper.read(no_seq);
	}

	@Override
	public void modify(NoticeVO notice) throws Exception {
		
		mapper.modify(notice);
	}

	@Override
	public void delete(NoticeVO notice) throws Exception {

		mapper.delete(notice);
	}

	@Override
	public void regist(NoticeVO notice) throws Exception {

		mapper.regist(notice);
	}

	@Override
	public PageMaker countPaging(PagingCriteria cri) throws Exception {
		
		return mapper.countPaging(cri);
	}
	
	

}
