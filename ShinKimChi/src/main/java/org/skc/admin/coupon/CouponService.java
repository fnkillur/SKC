package org.skc.admin.coupon;

import java.util.List;

import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface CouponService {

	public List<CouponVO> listAll(PagingCriteria cri);

	public PageMaker countPaging(PagingCriteria cri);

	public void deleteCoupon(PagingCriteria cri);

	public void changeState(PagingCriteria cri);
}
