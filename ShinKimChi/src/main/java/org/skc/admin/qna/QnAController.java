package org.skc.admin.qna;

import java.util.List;

import javax.inject.Inject;

import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/skc/qna/*")
public class QnAController {
	
	@Inject
	private QnAService qnaService;
	
	@RequestMapping("list")
	public String QnAList(@ModelAttribute("cri") PagingCriteria cri){
		
		return "/admin/qna/qnaList";
	}
	
	@ResponseBody
	@RequestMapping("qnaList")
	public List<QnAVO> ajaxList(){
		return qnaService.searchList();
	}
	
	@ResponseBody
	@RequestMapping(value="qnaInsert", method=RequestMethod.POST)
	public void ajaxInsert(QnAVO vo){
		qnaService.insertAnswer(vo);
	}

	@ResponseBody
	@RequestMapping(value="qnaDelete/{del_no}", method=RequestMethod.POST)
	public void ajaxDelete(@PathVariable("del_no") int del_no){
		qnaService.deleteList(del_no);
	}
	
	@ResponseBody
	@RequestMapping(value="qnaParentDelete/{del_no}", method=RequestMethod.POST)
	public void ajaxParentDelete(@PathVariable("del_no") int del_no){
		qnaService.deleteParent(del_no);
	}
	
	@ResponseBody
	@RequestMapping("qnaRead/{no}")
	public QnAVO ajaxRead(@PathVariable("no") int no){
		return qnaService.searchRead(no);
	}
	
	@ResponseBody
	@RequestMapping("qnaUpdate/{up_no}/{qna_content}")
	public void ajaxUpdate(@PathVariable("up_no")int up_no, @PathVariable("qna_content") String qna_content){
		qnaService.updateList(up_no, qna_content);
	}
}
