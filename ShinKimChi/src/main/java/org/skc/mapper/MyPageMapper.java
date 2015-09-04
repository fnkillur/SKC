package org.skc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.skc.admin.coupon.CouponVO;
import org.skc.admin.review.ReviewVO;
import org.skc.mypage.MemberVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;

public interface MyPageMapper {

	@Select("select * from tbl_member where id=#{id}")
	public MemberVO getMember(String id);

	@Select("select * from tbl_member where nick=#{nick}")
	public MemberVO nickCheck(MemberVO memberVO);

	@Update("update tbl_member set nick=#{nick}, pw=#{pw} where id=#{id}")
	public void modifyMember(MemberVO memberVO);

	@Select("select re_seq, tbl_review.id, re_content, re_grade, re_state, re_parent, re_depth, tbl_review.me_seq me_seq, me_name, st_name "
			+ " from tbl_review "
			+ " join tbl_menu using(me_seq) "
			+ " join tbl_store on tbl_menu.st_tel = tbl_store.st_tel"
			+ " where tbl_review.id=#{id} order by re_seq desc "
			+ " limit #{pageStart}, #{perPageNum}")
	public List<ReviewVO> getMyReview(PagingCriteria cri);

	@Select("select count(re_seq) totalCount from tbl_review where id=#{id} ")
	public PageMaker countPaging(PagingCriteria cri);

	@Select("select tbl_coupon.id id, cp_num, cp_startdate, cp_enddate, cp_state, st_name "
			+ "from tbl_coupon join tbl_store using(st_tel) "
			+ "where tbl_coupon.id=#{id} order by cp_seq "
			+ " limit #{pageStart}, #{perPageNum}")
	public List<CouponVO> getMyCoupon(PagingCriteria cri);

	@Select("select count(cp_seq) totalCount from tbl_coupon where id=#{id} ")
	public PageMaker countPagingCoupon(PagingCriteria cri);

	@Update("update tbl_review set re_content=#{re_content}, re_grade=#{re_grade} where re_seq=#{re_seq}")
	public void modifyReview(ReviewVO reviewVO);

	@Delete("delete from tbl_review where re_seq=#{re_seq}")
	public void deleteReivew(ReviewVO reviewVO);

}
