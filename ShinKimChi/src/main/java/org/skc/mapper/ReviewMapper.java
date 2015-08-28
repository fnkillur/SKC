package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.skc.admin.review.ReviewVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface ReviewMapper {

	@Select("select * from tbl_review limit #{pageStart}, #{perPageNum}")
	public List<ReviewVO> listSelect(PagingCriteria cri);
	
	@Delete("delete from tbl_review where re_seq = #{d_no}")
	public void deleteList(int d_no);
	
	@Select("select count(*) totalCount from tbl_review")
	public PageMaker listCount();
}
