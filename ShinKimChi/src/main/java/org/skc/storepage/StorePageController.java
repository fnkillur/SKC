package org.skc.storepage;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.skc.admin.review.ReviewVO;
import org.skc.admin.store.StoreVO;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/skc/storePage/*")
public class StorePageController {

	private static final Logger logger =LoggerFactory.getLogger(StorePageController.class);
	
	@Inject
	private StorePageService service;
	
	@Inject
	private HttpSession session;
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(@ModelAttribute("cri") PagingCriteria cri, Model model){
	
		logger.info("============= 가게 페이지 ===============");
		
		model.addAttribute("st_tel", "123123");
		
		return "/main/storePage/storePage";
	}
	
	@RequestMapping(value="ajaxStore", method=RequestMethod.GET)
	@ResponseBody
	public StoreVO ajaxStore(int st_tel){
		
		logger.info("============= 가게 페이지 가게정보 ===============");
		
		return service.getStore(st_tel);
	}
	
	@RequestMapping(value="ajaxMenu", method=RequestMethod.GET)
	@ResponseBody
	public List<MenuVO> ajaxMenu(int st_tel){
		
		logger.info("============= 가게 페이지 메뉴 ===============");
		
		return service.getMenu(st_tel);
	}
	
	@RequestMapping(value="ajaxMenuAll", method=RequestMethod.GET)
	@ResponseBody
	public List<MenuVO> ajaxMenuAll(@ModelAttribute("cri")PagingCriteria cri){
		
		logger.info("============= 가게 페이지 메뉴 ===============");
		
		cri.setPerPageNum(14);
		
		return service.getMenuAll(cri);
	}
	
	@RequestMapping(value="ajaxReview", method=RequestMethod.GET)
	@ResponseBody
	public List<ReviewVO> ajaxReview(@ModelAttribute("cri")PagingCriteria cri){
		
		logger.info("============= 가게 페이지 리뷰 ===============");
		
		cri.setPerPageNum(4);

		return service.getReview(cri);
	}
	
	@RequestMapping(value="/ajaxPaging", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPaging(@ModelAttribute("cri")PagingCriteria cri){
		
		logger.info("============= 리뷰 리스트 페이징 ===============");

		cri.setPerPageNum(4);
		
		return service.countPaging(cri).calcPage(cri);
	}
	
	@RequestMapping(value="/ajaxPagingMenu", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPagingMenu(@ModelAttribute("cri")PagingCriteria cri){
		
		logger.info("============= 메뉴 리스트 페이징 ===============");

		cri.setPerPageNum(14);
		
		return service.countPagingMenu(cri).calcPage(cri);
	}
	
	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	@ResponseBody
	public String insertReview(ReviewVO reviewVO){
		
		logger.info("============= 리뷰 작성 ===============");
		reviewVO.setId("abc123");
		service.insertReview(reviewVO);
		
		return "insert success";
	}
	
}
