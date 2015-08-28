package org.skc.log;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skc/log/*")
public class LogController {

	@RequestMapping("login")
	public String loginPage(){
		return "/main/log/loginPage";
	}
}
