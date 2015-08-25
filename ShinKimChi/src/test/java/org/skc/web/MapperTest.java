package org.skc.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.mapper.ReviewMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
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
	PageMaker pm = new PageMaker();
	PagingCriteria cri = new PagingCriteria();
	
	@Test
	public void testTime(){
		reMapper.listCount().calcPage(cri);
		logger.info(pm.toString());
	}
}