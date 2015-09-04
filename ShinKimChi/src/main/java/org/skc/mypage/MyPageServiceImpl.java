package org.skc.mypage;

import java.util.List;

import javax.inject.Inject;

import org.skc.admin.coupon.CouponVO;
import org.skc.admin.review.ReviewVO;
import org.skc.mapper.MyPageMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MyPageMapper mapper;
	
	@Override
	public MemberVO getMember(String id) {

		return mapper.getMember(id);
	}

	@Override
	public MemberVO nickCheck(MemberVO memberVO) {

		return mapper.nickCheck(memberVO);
	}

	@Override
	public void modifyMember(MemberVO memberVO) {
		
		mapper.modifyMember(memberVO);
	}

	@Override
	public List<ReviewVO> getMyReview(PagingCriteria cri) {

		return mapper.getMyReview(cri);
	}

	@Override
	public PageMaker countPaging(PagingCriteria cri) {

		return mapper.countPaging(cri);
	}

	@Override
	public List<CouponVO> getMyCoupon(PagingCriteria cri) {

		return mapper.getMyCoupon(cri);
	}

	@Override
	public PageMaker countPagingCoupon(PagingCriteria cri) {

		return mapper.countPagingCoupon(cri);
	}

	@Override
	public void modifyReview(ReviewVO reviewVO) {

		mapper.modifyReview(reviewVO);
	}

	@Override
	public void deleteReivew(ReviewVO reviewVO) {

		mapper.deleteReivew(reviewVO);
	}

}
