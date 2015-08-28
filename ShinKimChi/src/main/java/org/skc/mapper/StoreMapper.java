package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import org.skc.admin.store.StoreVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface StoreMapper {

	public List<StoreVO> listAll(PagingCriteria cri)throws Exception;

	public PageMaker countPaging(PagingCriteria cri)throws Exception;

	public void changeState(PagingCriteria cri)throws Exception;
	
	@Delete("delete from tbl_store where st_tel=#{st_tel}")
	public void deleteStroe(PagingCriteria cri)throws Exception;

}
