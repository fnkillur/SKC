package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.skc.admin.store.StoreVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface StoreMapper {

	public List<StoreVO> listAll(PagingCriteria cri);

	public PageMaker countPaging(PagingCriteria cri);

	public void changeState(PagingCriteria cri);
	
	@Delete("delete from tbl_store where st_tel=#{st_tel}")
	public void deleteStroe(PagingCriteria cri);

}
