package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.skc.admin.qna.QnAVO;

public interface QnAMapper {
	
	@Select("select * from tbl_qna order by qna_parent desc, qna_depth asc, qna_seq asc")
	public List<QnAVO> searchList();
	
	@Insert("insert into tbl_qna(id, qna_content, qna_title, qna_parent, qna_depth, qna_state) values('admin', #{qna_content}, 'title', #{qna_parent}, 'B', '2')")
	public void insertAnswer(QnAVO vo);
	
	@Delete("delete from tbl_qna where qna_seq = #{del_no}")
	public void deleteList(int del_no);
	
	@Delete("delete from tbl_qna where qna_parent = #{del_no}")
	public void deleteParent(int del_no);
	
	@Select("select * from tbl_qna where qna_seq = #{no}")
	public QnAVO searchRead(int no);
	
	@Update("update tbl_qna set qna_content = #{qna_content} where qna_seq = #{up_no}")
	public void updateList(@Param("up_no")int up_no, @Param("qna_content") String qna_content);
}
