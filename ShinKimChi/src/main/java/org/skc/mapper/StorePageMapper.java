package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.skc.admin.review.ReviewVO;
import org.skc.admin.store.StoreVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.skc.storepage.MenuVO;

public interface StorePageMapper {

	@Select("select * from tbl_store where st_tel=#{st_tel}")
	public StoreVO getStore(int st_tel);

	@Select("select * from tbl_menu where st_tel=#{st_tel} order by me_grade desc limit 0, 5")
	public List<MenuVO> getMenu(int st_tel);

	@Select("select * from tbl_review where me_seq=#{me_seq} and re_state = 0 order by re_seq desc limit #{pageStart}, #{perPageNum}")
	public List<ReviewVO> getReview(PagingCriteria cri);

	@Select("select count(re_seq) totalCount from tbl_review where me_seq=#{me_seq} and re_state = 0 ")
	public PageMaker countPaging(PagingCriteria cri);

	@Insert("insert into tbl_review(id, re_content, re_grade,me_seq) values(#{id}, #{re_content}, #{re_grade}, #{me_seq})")
	public void insertReview(ReviewVO reviewVO);

	@Update("update tbl_menu set me_grade=#{menu_grade} where st_tel=#{st_tel} and menu_name=#{menu_name}")
	public void menuGrade(MenuVO menuVO);

	@Select("select * from tbl_menu where st_tel=#{st_tel} order by so_seq limit #{pageStart}, #{perPageNum}")
	public List<MenuVO> getMenuAll(PagingCriteria cri);

	@Select("select count(me_seq) totalCount from tbl_menu where st_tel=#{st_tel}")
	public PageMaker countPagingMenu(PagingCriteria cri);

}
