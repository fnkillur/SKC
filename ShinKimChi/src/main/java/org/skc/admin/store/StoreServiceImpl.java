package org.skc.admin.store;

import java.util.List;

import javax.inject.Inject;

import org.skc.mapper.StoreMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService {

	@Inject
	private StoreMapper mapper;
	
	@Override
	public List<StoreVO> listAll(PagingCriteria cri)throws Exception{
		
		return mapper.listAll(cri);
	}

	@Override
	public PageMaker countPaging(PagingCriteria cri)throws Exception {
		
		return mapper.countPaging(cri);
	}

	@Override
	public void changeState(PagingCriteria cri) throws Exception {
		
		mapper.changeState(cri);
	}

	@Override
	public void deleteStore(PagingCriteria cri) throws Exception {

		mapper.deleteStroe(cri);
	}

}
