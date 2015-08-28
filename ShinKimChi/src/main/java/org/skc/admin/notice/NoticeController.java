package org.skc.admin.notice;

import java.util.List;

import javax.inject.Inject;

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
@RequestMapping("/admin/skc/notice/*")
public class NoticeController {
	
	private static final Logger logger =LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= �������� ����Ʈ ==============="); 
		
		return "/admin/notice/noticeList";
	}
	
	@RequestMapping(value="/ajaxList", method=RequestMethod.GET)
	@ResponseBody
	public List<NoticeVO> ajaxList(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= �������� ����Ʈ �˸��� ===============");
		
		return service.listAll(cri);
	}
	
	@RequestMapping(value="/ajaxPaging", method=RequestMethod.GET)
	@ResponseBody
	public PageMaker ajaxPaging(@ModelAttribute("cri")PagingCriteria cri) throws Exception{
		
		logger.info("============= �������� ����Ʈ ����¡ ===============");
		
		return service.countPaging(cri).calcPage(cri);
	}
			
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGet(@ModelAttribute("cri") PagingCriteria cri,Model model) throws Exception{
		
		logger.info("============= �������� �ۺ��� ===============");
		
		model.addAttribute("notice", service.read(cri.getNo_seq()));
		
		return "/admin/notice/noticeRead";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public NoticeVO modify(NoticeVO notice, Model model) throws Exception{
		
		logger.info("============= �������� �ۼ��� ===============");
		
		service.modify(notice);
		
		return service.read(notice.getNo_seq());
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(NoticeVO notice) throws Exception{
		
		logger.info("============= �������� �ۼ��� ===============");
		
		service.delete(notice);
		
		return "delete success";
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String registGet() throws Exception{
		
		logger.info("============= �������� ��� �� ===============");
				
		return "/admin/notice/noticeRegist";
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPost(NoticeVO notice) throws Exception{
		
		logger.info("============= �������� ��� ó�� ===============");
		
		service.regist(notice);
		
		return "redirect:/admin/skc/notice/list";
	}
	
}
