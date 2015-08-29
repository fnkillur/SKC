package org.skc.storepage;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/skc/storePage/*")
public class StorePageController {

	private static final Logger logger =LoggerFactory.getLogger(StorePageController.class);
	
	@Inject
	private StorePageService service;
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view() throws Exception{
	
		logger.info("============= 가게 페이지 ===============");
		
		return "/main/storePage/storePage";
	}
}
