package com.ohana0.ohanagram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PermissionInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws IOException {
		HttpSession session  = request.getSession();
		Integer userId = (Integer)session.getAttribute("id");
		// /user/login-view
		String uri = request.getRequestURI();
		
		// /post로시작하는페이지 접근X 로그인페이지로
		if(userId == null) {
			if() {
				response.sendRedirect("/user/login-view");
				return false;
				
			}
			
		}
		// //user로시작하는경우
		else {
			if(uri.startsWith("/user/login-view")||uri.startsWith("/user/join-view")) {
				//리다이렉트
				response.sendRedirect("/post/home-view");
				//controller까지 전달되지않고 중단시킴.
				return false;
			}
		}
		return true;

	}
}
