package org.skc.admin.coupon;

import java.util.List;

import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface CouponService {

	public List<CouponVO> listAll(PagingCriteria cri)throws Exception;

	public PageMaker countPaging(PagingCriteria cri)throws Exception;

	public void deleteCoupon(PagingCriteria cri)throws Exception;

	public void changeState(PagingCriteria cri)throws Exception;
}
