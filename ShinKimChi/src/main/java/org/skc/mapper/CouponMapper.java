package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.skc.admin.coupon.CouponVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface CouponMapper {
	
	public List<CouponVO> listAll(PagingCriteria cri)throws Exception;

	public PageMaker countPaging(PagingCriteria cri)throws Exception;

	@Delete("delete from tbl_coupon where cp_seq=#{cp_seq}")
	public void deleteCoupon(PagingCriteria cri)throws Exception;

	public void changeState(PagingCriteria cri)throws Exception;

}
