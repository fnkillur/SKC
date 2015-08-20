package org.skc.web;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

@Service
public interface TestMapper {

	@Select("select now()")
	public void test();
}
