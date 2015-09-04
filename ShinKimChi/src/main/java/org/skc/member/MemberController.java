package org.skc.member;

import java.util.Calendar;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.skc.mapper.LoginMapper;
import org.skc.mapper.MemberMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/skc/member/*")
public class MemberController {

		@Inject
		private LoginMapper loMapper;
		
		@Inject
		private MemberMapper mMapper;
		
		@Inject
		private HttpSession session;
		
		@RequestMapping("login")
		public String loginPageTest(){
			Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			String date = String.valueOf(cal.get(Calendar.YEAR))+"."+String.valueOf(cal.get ( Calendar.MONTH ) + 1)+"."+String.valueOf(cal.get ( Calendar.DATE ));
			System.out.println(date);
			cal.add ( Calendar.YEAR, +1 ); 
			date = String.valueOf(cal.get(Calendar.YEAR))+"."+String.valueOf(cal.get ( Calendar.MONTH ) + 1)+"."+String.valueOf(cal.get ( Calendar.DATE ));
			System.out.println(date);
			
			return "";
		}
		
		@RequestMapping(value="login", method=RequestMethod.POST)
		public String loginPage(String id, String pw, String rememberMe, HttpServletResponse response, HttpServletRequest request){
			Cookie cookie = WebUtils.getCookie(request, "loginId");
			Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			System.out.println(cookie);
			String date = String.valueOf(cal.get(Calendar.YEAR))+"."+String.valueOf(cal.get ( Calendar.MONTH ) + 1)+"."+String.valueOf(cal.get ( Calendar.DATE ));
			if(rememberMe != null){
				String uuid = UUID.randomUUID().toString();
				if(mMapper.loginView(id, pw) == 1){
					System.out.println("id, pw ok");
					if(cookie != null){
						System.out.println("cookie yes");
						SessionCookieVO scVO = new SessionCookieVO();
						scVO.setRememberDate(date);
						scVO.setCookie(cookie.getValue());
						session.setAttribute("sessionLogin", mMapper.selectSession(loMapper.loginCookie(scVO)));
					}else{
						System.out.println("cookie no");
						SessionCookieVO scVO = new SessionCookieVO();
						Cookie cookie2 = new Cookie("loginId", uuid);
						cookie2.setMaxAge(60*60*24*365);
						cookie2.setPath("/");
						response.addCookie(cookie2);
						scVO.setCookie(uuid);
						scVO.setRememberDate(date);	
						cal.add ( Calendar.YEAR, +1 ); 
						date = String.valueOf(cal.get(Calendar.YEAR))+"."+String.valueOf(cal.get ( Calendar.MONTH ) + 1)+"."+String.valueOf(cal.get ( Calendar.DATE ));
						scVO.setCookieDate(date);
						scVO.setSession(id);
						loMapper.insertSessionCookie(scVO);
						session.setAttribute("sessionLogin", mMapper.selectSession(loMapper.loginCookie(scVO)));
					}
				}else{
					System.out.println("아이디랑 비번이 틀렸어");
				}
				return "redirect:/skc/main/mainPage/main";
			}else{
				System.out.println("rememberMe Not Checked");
				System.out.println("ID : "+ id+" PW : "+pw);
				if(mMapper.loginView(id, pw) == 1){
					session.setAttribute("sessionLogin", mMapper.selectSession(id));
				}else{
					System.out.println("아이디랑 비번이 틀렸어");
				}

				return "redirect:/skc/main/mainPage/main";
			}
			
		}
		
		@RequestMapping("logout")
		public String logoutPage(HttpServletRequest request, HttpServletResponse response){
			Cookie ck = WebUtils.getCookie(request, "loginId");
			if(ck != null){
				Cookie cookie2 = new Cookie("loginId", "nocookie");
				cookie2.setMaxAge(0);
				cookie2.setPath("/");
				response.addCookie(cookie2);
			}
			session.invalidate();
			return "redirect:/skc/main/mainPage/main";
		}
		
		@RequestMapping(value="regist", method=RequestMethod.POST)
		public String registPage(MemberVO vo){
			mMapper.registMember(vo);
			return "redirect:/skc/main/mainPage/main";
		}

}
