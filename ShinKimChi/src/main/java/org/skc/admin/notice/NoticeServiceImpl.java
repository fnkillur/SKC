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
	public List<NoticeVO> listAll(PagingCriteria cri){
		
		return mapper.listAll(cri);
	}

	@Override
	public NoticeVO read(int no_seq){
		
		return mapper.read(no_seq);
	}

	@Override
	public void modify(NoticeVO notice){
		
		mapper.modify(notice);
	}

	@Override
	public void delete(NoticeVO notice){

		mapper.delete(notice);
	}

	@Override
	public void regist(NoticeVO notice){

		mapper.regist(notice);
	}

	@Override
	public PageMaker countPaging(PagingCriteria cri){
		
		return mapper.countPaging(cri);
	}
	
	

}
