package org.skc.mypage;

import java.util.List;

import javax.inject.Inject;

import org.skc.admin.coupon.CouponVO;
import org.skc.admin.review.ReviewVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/skc/myPage/*")
public class MyPageController {

	private static final Logger logger =LoggerFactory.getLogger(MyPageController.class);
	
	@Inject
	private MyPageService service;
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(@ModelAttribute("cri")PagingCriteria cri){
	
		logger.info("============= ȸ�� ������ ===============");
		
		return "/main/myPage/myPage";
	}
	
	@RequestMapping(value="modifyForm", method=RequestMethod.GET)
	@ResponseBody
	public MemberVO modifyForm(String id){
	
		logger.info("============= ȸ������ ===============");
		
		return service.getMember(id);
	}
	
	@RequestMapping(value="nickCheck", method=RequestMethod.GET)
	@ResponseBody
	public String nickCheck(MemberVO memberVO){
	
		logger.info("============= �г��� �ߺ�üũ ===============");
		
		String result;
		MemberVO checkVO = service.nickCheck(memberVO);
		
		if(checkVO == null) result = "ok";
		else result = "no";
		
		return result;
	}
	
	@RequestMapping(value="modifyMember", method=RequestMethod.POST)
	@ResponseBody
	public String modifyMember(MemberVO memberVO){
	
		logger.info("============= ȸ������ ���� ===============");
		
		service.modifyMember(memberVO);
		
		return "success";
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	@ResponseBody
	public List<ReviewVO> reviewList(@ModelAttribute("cri")PagingCriteria cri){
	
		logger.info("============= ���� ��� ===============");
		
		cri.setPerPageNum(4);
		
		return service.getMyReview(cri);
	}
	
	@RequestMapping(value="/ajaxPaging", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPaging(@ModelAttribute("cri")PagingCriteria cri){
		
		logger.info("============= ���� ����Ʈ ����¡ ===============");

		cri.setPerPageNum(4);
		
		return service.countPaging(cri).calcPage(cri);
	}
	
	@RequestMapping(value="couponList", method=RequestMethod.GET)
	@ResponseBody
	public List<CouponVO> couponList(@ModelAttribute("cri")PagingCriteria cri){
	
		logger.info("============= ���� ��� ===============");
		
		cri.setPerPageNum(4);
		
		return service.getMyCoupon(cri);
	}
	
	@RequestMapping(value="/ajaxPagingCoupon", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPagingCoupon(@ModelAttribute("cri")PagingCriteria cri){
		
		logger.info("============= ���� ����Ʈ ����¡ ===============");

		cri.setPerPageNum(4);
		
		return service.countPagingCoupon(cri).calcPage(cri);
	}
	
	@RequestMapping(value="modiReview", method=RequestMethod.POST)
	@ResponseBody
	public String modiReview(ReviewVO reviewVO){
	
		logger.info("============= ���� ���� ===============");
		
		service.modifyReview(reviewVO);
		
		return "success";
	}
	
	@RequestMapping(value="deleteReivew", method=RequestMethod.POST)
	@ResponseBody
	public String deleteReivew(ReviewVO reviewVO){
	
		logger.info("============= ���� ���� ===============");
		
		service.deleteReivew(reviewVO);
		
		return "success";
	}
	
	
}
