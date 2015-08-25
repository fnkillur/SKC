package org.skc.admin.qna;

import org.skc.page.PagingCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/skc/qna/*")
public class QnAController {
	
	@RequestMapping("list")
	public String QnAList(@ModelAttribute("cri") PagingCriteria cri){
		
		return "/admin/qna/qnaList";
	}

}
