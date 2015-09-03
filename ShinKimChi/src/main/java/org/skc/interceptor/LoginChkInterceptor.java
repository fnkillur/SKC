package org.skc.interceptor;

import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.skc.mapper.LoginMapper;
import org.skc.mapper.MemberMapper;
import org.skc.member.SessionCookieVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginChkInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private HttpSession session;
	
	@Inject
	private MemberMapper mMapper;
	
	@Inject
	private LoginMapper loMapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Cookie ck = WebUtils.getCookie(request, "loginId");
		if(ck != null){
			System.out.println("들어옴" +ck+ " 이거지이");
			Calendar cal = Calendar.getInstance ( );
			String date = String.valueOf(cal.get(Calendar.YEAR))+"."+String.valueOf(cal.get ( Calendar.MONTH ) + 1)+"."+String.valueOf(cal.get ( Calendar.DATE ));
			SessionCookieVO scVO = new SessionCookieVO();
			scVO.setRememberDate(date);
			scVO.setCookie(ck.getValue());
			session.setAttribute("sessionLogin", mMapper.selectSession(loMapper.loginCookie(scVO)));
		}
		return true;
	}
	
}
