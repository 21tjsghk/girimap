package kr.co.map.dto.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor  extends HandlerInterceptorAdapter{

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		System.out.println("pre handler");
		boolean pass = false;
		System.out.println(request.getRequestURI());
		HttpSession session = request.getSession();
		if(session.getAttribute("loginId") != null) {
			pass = true;
		}else {
			pass = false;
			System.out.println("비정상적 접근...");
			response.sendRedirect("./");
		}
		return pass;
    }
    

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
            System.out.println("post Handle");
    }
}
