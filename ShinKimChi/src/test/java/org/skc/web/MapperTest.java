package org.skc.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.mapper.LoginMapper;
import org.skc.mapper.QnAMapper;
import org.skc.mapper.ReviewMapper;
import org.skc.member.SessionCookieVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MapperTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MapperTest.class);
	
	@Inject
	private ReviewMapper reMapper;
	
	@Inject
	private QnAMapper qnaMapper;
	
	@Inject
	private LoginMapper loMapper;
	
	@Test
	public void testTime(){
		SessionCookieVO scVO = new SessionCookieVO();
		scVO.setCookie("cookie");
		scVO.setRememberDate("2015.8.29");
		System.out.println(loMapper.loginCookie(scVO));
		
	}
}