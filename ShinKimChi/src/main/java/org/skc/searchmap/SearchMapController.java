package org.skc.searchmap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skc/main/searchMap/*")
public class SearchMapController {

	@RequestMapping("map")
	public String mapView(double st_x, double st_y, Model model){
		model.addAttribute("lat", st_x);
		model.addAttribute("lng", st_y);
		return "/main/searchMap/searchMap";
	}
}
