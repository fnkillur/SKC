package org.skc.admin.coupon;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.mapper.CouponMapper;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CouponMapperTest {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Inject
	private CouponMapper mapper;
	
	
	@Test
	public void listTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria();
		
		List<CouponVO> list = mapper.listAll(cri);
		
		for(CouponVO couponVO : list){
			logger.info(couponVO.getCp_seq()+":"+couponVO.getSt_name());
		}
	}
	/*
	@Test
	public void stateTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSt_tel(31413414).setBtnType("okBtn");
		
		mapper.changeState(cri);
	}
	
	@Test
	public void deleteStroeTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria().setSt_tel(24126752).setBtnType("delBtn");
		
		mapper.deleteStroe(cri);
	}
	*/
}
