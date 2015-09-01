package org.skc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.skc.member.SessionCookieVO;


public interface LoginMapper {

	@Insert("insert into tbl_sessioncookie values(#{cookie}, #{session}, #{rememberDate}, #{cookieDate})")
	public void insertSessionCookie(SessionCookieVO vo);
	
	
	@Select("select session from tbl_sessioncookie where cookie = #{cookie} and cookieDate >= #{rememberDate}")
	public String loginCookie(SessionCookieVO scVO);
}
