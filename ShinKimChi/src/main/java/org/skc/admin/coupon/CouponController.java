package org.skc.admin.coupon;

import java.util.List;

import javax.inject.Inject;

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
@RequestMapping("/admin/skc/coupon/*")
public class CouponController {

	private static final Logger logger =LoggerFactory.getLogger(CouponController.class);
	
	@Inject
	private CouponService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String skcCouponList(@ModelAttribute("cri")PagingCriteria cri)throws Exception{
		
		logger.info("============= ���� ����Ʈ ===============");
		
		return "admin/coupon/couponList";
	}
	
	@RequestMapping(value="/ajaxList", method=RequestMethod.GET)
	@ResponseBody
	public List<CouponVO> ajaxList(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= ���Ե�� ����Ʈ �˸��� ===============");

		return service.listAll(cri);
	}
	
	@RequestMapping(value="/ajaxPaging", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPaging(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= ���Ե�� ����Ʈ ����¡ ===============");
		
		return service.countPaging(cri).calcPage(cri);
	}
	
	@RequestMapping(value="/changeState", method=RequestMethod.POST)
	@ResponseBody
	public String changeState(@ModelAttribute("cri")PagingCriteria cri)throws Exception{
		
		logger.info("============= ���Ե�� ����ó�� ===============");
		
		if(cri.getBtnType().equals("delBtn"))
			service.deleteCoupon(cri);
		else 	
			service.changeState(cri);
		
		return "change success";
	}
}
