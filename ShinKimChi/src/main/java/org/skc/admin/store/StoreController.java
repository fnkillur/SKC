package org.skc.admin.store;

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
@RequestMapping("/admin/skc/store/*")
public class StoreController {
	
	private static final Logger logger =LoggerFactory.getLogger(StoreController.class);
	
	@Inject
	private StoreService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= 가게등록 리스트 ===============");
		
		return "/admin/store/storeList";
	}
	
	@RequestMapping(value="/ajaxList", method=RequestMethod.GET)
	@ResponseBody
	public List<StoreVO> ajaxList(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= 가게등록 리스트 알맹이 ===============");
		
		return service.listAll(cri);
	}
	
	@RequestMapping(value="/ajaxPaging", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPaging(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= 가게등록 리스트 페이징 ===============");
		
		return service.countPaging(cri).calcPage(cri);
	}
	
	@RequestMapping(value="/changeState", method=RequestMethod.POST)
	@ResponseBody
	public String changeState(@ModelAttribute("cri")PagingCriteria cri)throws Exception{
		
		logger.info("============= 가게등록 상태처리 ===============");
		
		if(cri.getBtnType().equals("delBtn"))
			service.deleteStore(cri);
		else 	
			service.changeState(cri);
		
		return "change success";
	}
	
}
