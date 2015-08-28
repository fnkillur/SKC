package org.skc.admin.coupon;

import java.util.List;

import javax.inject.Inject;

import org.skc.mapper.CouponMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService {

	@Inject
	private CouponMapper mapper;
	
	@Override
	public List<CouponVO> listAll(PagingCriteria cri) throws Exception {
	
		return mapper.listAll(cri);
	}

	@Override
	public PageMaker countPaging(PagingCriteria cri) throws Exception {

		return mapper.countPaging(cri);
	}

	@Override
	public void deleteCoupon(PagingCriteria cri) throws Exception {
		
		mapper.deleteCoupon(cri);
	}

	@Override
	public void changeState(PagingCriteria cri) throws Exception {
		
		mapper.changeState(cri);
	}

}
