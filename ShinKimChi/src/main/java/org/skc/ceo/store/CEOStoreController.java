package org.skc.ceo.store;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.skc.mapper.StoreMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/skc/ceo/store/*")
public class CEOStoreController {

	@Inject
	private StoreMapper sMapper;
	
	@Inject
	private HttpSession session;
	
	@RequestMapping("view")
	public String storePage(Model model) throws Exception{
		session.setAttribute("sessionLogin", "wit89@hanmail.com");
		String id = String.valueOf(session.getAttribute("sessionLogin"));
		model.addAttribute("myStore", sMapper.mystoreView(id));
		
		return "/ceo/store/mystore";
	}
}
