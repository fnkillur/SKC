package org.skc.admin.review;

import java.util.List;

import javax.inject.Inject;

import org.skc.mapper.ReviewMapper;
import org.skc.page.PageMaker;
import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("admin/skc/review/*")
public class ReviewController {

	@Inject
	private ReviewService reService;
	
	@Inject
	private ReviewMapper reMapper;
	
	@RequestMapping("list")
	public String reviewList(@ModelAttribute("cri") PagingCriteria cri){
		
		return "admin/review/reviewList";
	}
	
	@ResponseBody
	@RequestMapping("reviewList")
	public List<ReviewVO> ajaxList(PagingCriteria cri){
		return reService.listSelect(cri);
	}
	
	@ResponseBody
	@RequestMapping("reviewDelete/{d_no}")
	public String ajaxDelete(@PathVariable("d_no")int d_no){
		reService.deleteList(d_no);
		return "delete success!!";
	}
	
	@ResponseBody
	@RequestMapping("reviewPaging")
	public PageMaker pageSearch(@ModelAttribute("cri") PagingCriteria cri){
		reMapper.listCount().calcPage(cri);
		return reMapper.listCount().calcPage(cri);
	}
}
