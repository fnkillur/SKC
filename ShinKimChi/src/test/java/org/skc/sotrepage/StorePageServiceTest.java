package org.skc.sotrepage;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.admin.review.ReviewVO;
import org.skc.admin.store.StoreVO;
import org.skc.storepage.MenuVO;
import org.skc.storepage.StorePageController;
import org.skc.storepage.StorePageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class StorePageServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(StorePageController.class);
	
	@Inject
	private StorePageService service;
	
	/*
	@Test
	public void getStoreTest()throws Exception{
		
		StoreVO storeVO = service.getStore(123123);
		
		logger.info(storeVO.getSt_tel());
	}
	
	@Test
	public void getMenuTest()throws Exception{
		
		List<MenuVO> list = service.getMenu(123123);
		
		for(MenuVO menuVO : list){
			logger.info(menuVO.getSt_tel() + " : " + menuVO.getMenu_name());
		}
	}
	
	
	@Test
	public void getReviewTest()throws Exception{
		
		List<ReviewVO> list =  service.getReview(123123);
		
		for(ReviewVO reviewVO : list){
			logger.info(reviewVO.getSt_tel()+" : "+reviewVO.getRe_content());
		}
	}
	*/
}
