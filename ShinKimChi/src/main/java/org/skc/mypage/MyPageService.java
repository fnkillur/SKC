package org.skc.mypage;

import java.util.List;

import org.skc.admin.coupon.CouponVO;
import org.skc.admin.review.ReviewVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface MyPageService {

	public MemberVO getMember(String id);

	public MemberVO nickCheck(MemberVO memberVO);

	public void modifyMember(MemberVO memberVO);

	public List<ReviewVO> getMyReview(PagingCriteria cri);

	public PageMaker countPaging(PagingCriteria cri);

	public List<CouponVO> getMyCoupon(PagingCriteria cri);
	
	public PageMaker countPagingCoupon(PagingCriteria cri);

	public void modifyReview(ReviewVO reviewVO);

	public void deleteReivew(ReviewVO reviewVO);

}
