package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.skc.admin.store.StoreVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface StoreMapper {

	public List<StoreVO> listAll(PagingCriteria cri);

	public PageMaker countPaging(PagingCriteria cri);

	public void changeState(PagingCriteria cri);
	
	@Delete("delete from tbl_store where st_tel=#{st_tel}")
	public void deleteStroe(PagingCriteria cri);

	@Insert("insert into tbl_store(id, st_name, st_tel, st_addr, st_x, st_y, st_time, st_type) values(#{id}, #{st_name}, #{st_tel}, #{st_addr}, #{st_x}, #{st_y}, #{st_time}, #{st_type})")
	public void registStore(StoreVO svo);
	
	@Select("select * from tbl_store where id=#{id}")
	public List<StoreVO> mystoreView(String id);
}
