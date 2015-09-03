package org.skc.admin.store;

import java.util.List;

import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface StoreService {

	public List<StoreVO> listAll(PagingCriteria cri);

	public PageMaker countPaging(PagingCriteria cri);

	public void changeState(PagingCriteria cri);

	public void deleteStore(PagingCriteria cri);

}
