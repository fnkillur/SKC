package org.skc.admin.store;

import java.util.List;

import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface StoreService {

	public List<StoreVO> listAll(PagingCriteria cri)throws Exception;

	public PageMaker countPaging(PagingCriteria cri)throws Exception;

	public void changeState(PagingCriteria cri)throws Exception;

	public void deleteStore(PagingCriteria cri)throws Exception;

}
