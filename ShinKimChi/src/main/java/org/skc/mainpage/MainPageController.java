package org.skc.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skc/main/mainPage")
public class MainPageController {

	@RequestMapping("main")
	public String mainPage(){
		return "/main/mainPage/mainPage";
	}
}
