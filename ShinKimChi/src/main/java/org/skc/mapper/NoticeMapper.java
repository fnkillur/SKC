package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.skc.admin.notice.NoticeVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;


public interface NoticeMapper {
	
	//@Select("select * from tbl_notice order by no_seq desc limit #{pageStart}, #{perPageNum}")
	public List<NoticeVO> listAll(PagingCriteria cri)throws Exception;

	@Select("select * from tbl_notice where no_seq=#{no_seq}")
	public NoticeVO read(int no_seq)throws Exception;

	@Update("update tbl_notice set no_title=#{no_title}, no_content=#{no_content} where no_seq=#{no_seq}")
	public void modify(NoticeVO notice)throws Exception;

	@Delete("delete from tbl_notice where no_seq=#{no_seq}")
	public void delete(NoticeVO notice)throws Exception;

	@Insert("insert into tbl_notice(no_title,no_content) values(#{no_title},#{no_content})")
	public void regist(NoticeVO notice)throws Exception;
	
	//@Select("select count(no_seq) totalCount from tbl_notice")
	public PageMaker countPaging(PagingCriteria cri)throws Exception;
}
