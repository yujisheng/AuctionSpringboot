package com.baizhi.auction.web.intercepter;

import com.baizhi.auction.entity.AuctionUser;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthIntercepter implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		HttpSession session = request.getSession();
		AuctionUser auctionUser = (AuctionUser) session.getAttribute("auctionUser");
		if(auctionUser != null){
			// �ѵ�¼������
			return true;
		}else{
			// û�е�¼
			response.sendRedirect("/AuctionNewSsm/login.jsp");
			return false;
		}
	}

}
