package org.skc.web;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {

	@Select("select now()")
	public String test();
}
