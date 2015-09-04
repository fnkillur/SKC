package org.skc.ceo.main;

import javax.inject.Inject;

import org.skc.admin.store.StoreVO;
import org.skc.mapper.MemberMapper;
import org.skc.mapper.StoreMapper;
import org.skc.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/skc/ceo/mainPage/*")
public class CEOMainController {
	
	@Inject
	private MemberMapper mMapper;
	
	@Inject
	private StoreMapper sMapper;

	@RequestMapping(value="main", method=RequestMethod.GET)
	public String mainPage(){
		
		return "/ceo/main/ceomain";
	}
	
	@RequestMapping(value="main", method=RequestMethod.POST)
	public String mainPagePost(MemberVO mVO, StoreVO sVO, String st_tel1, String time1, String time2){
		String[] tel = st_tel1.split("-");
		String tp = tel[0] + tel[1] + tel[2];
		sVO.setSt_tel(Integer.parseInt(tp));
		sVO.setSt_time(time1+"-"+time2);
		mMapper.registMember(mVO);
		sMapper.registStore(sVO);
		return "redirect:/skc/ceo/store/view";
	}
}
