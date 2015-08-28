package org.skc.admin.store;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.admin.store.StoreController;
import org.skc.admin.store.StoreService;
import org.skc.admin.store.StoreVO;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class StoreServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Inject
	private StoreService service;
	
	@Test
	public void listTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSearchType("m").setKeyword("hell");
		
		List<StoreVO> list = service.listAll(cri);
		
		for(StoreVO storeVO : list){
			logger.info(storeVO.getSt_tel()+":"+storeVO.getSt_name());
		}
	}
}
