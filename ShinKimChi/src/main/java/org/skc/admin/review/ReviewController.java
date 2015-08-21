package org.skc.admin.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("admin/skc/*")
public class ReviewController {

	
	@RequestMapping("review")
	public String reviewList(){
		return "admin/reply/reviewList";
	}
	
	@ResponseBody
	@RequestMapping("reviewList")
	public List<String> ajaxList(){
		List<String> list = new ArrayList<String>();
		list.add("1. dasda");
		list.add("2. dkjanbsdlknsa");
		return list;
	}
}
