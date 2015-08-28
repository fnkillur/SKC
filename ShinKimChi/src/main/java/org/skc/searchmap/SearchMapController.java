package org.skc.searchmap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skc/main/searchMap/*")
public class SearchMapController {

	@RequestMapping("map")
	public String mapView(){
		return "/main/searchMap/searchMap";
	}
}
