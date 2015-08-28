package org.skc.admin.store;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.admin.store.StoreController;
import org.skc.admin.store.StoreVO;
import org.skc.mapper.StoreMapper;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class StoreMapperTest {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Inject
	private StoreMapper mapper;
	
	/*
	@Test
	public void listTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSearchType("m").setKeyword("hell");
		
		List<StoreVO> list = mapper.listAll(cri);
		
		for(StoreVO storeVO : list){
			logger.info(storeVO.getSt_tel()+":"+storeVO.getSt_name());
		}
	}
	
	@Test
	public void stateTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSt_tel(31413414).setBtnType("okBtn");
		
		mapper.changeState(cri);
	}
	*/
	@Test
	public void deleteStroeTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSt_tel(24126752).setBtnType("delBtn");
		
		mapper.deleteStroe(cri);
	}
	
}
