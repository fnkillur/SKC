package org.skc.admin.coupon;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CouponServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Inject
	private CouponService service;
	
	@Test
	public void listTest() throws Exception{
		
		PagingCriteria cri = new PagingCriteria();
		
		List<CouponVO> list = service.listAll(cri);
		
		for(CouponVO couponVO : list){
			logger.info(couponVO.getCp_seq()+":"+couponVO.getSt_name());
		}
	}
}
