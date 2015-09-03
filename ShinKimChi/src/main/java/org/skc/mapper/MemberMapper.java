package org.skc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.skc.member.MemberVO;

public interface MemberMapper {

	@Select("select count(*) from tbl_member where id=#{id} or pw=#{pw}")
	public int loginView(@Param("id") String id, @Param("pw") String pw);
	
	
	@Select("select * from tbl_member where id=#{id}")
	public MemberVO selectSession(String id);
	
	@Insert("insert into tbl_member(id, pw, name, nick, aut) values(#{id}, #{pw}, #{name}, #{nick}, #{aut})")
	public void registMember(MemberVO vo);
}
