package com.baizhi.auction.controller;

import com.baizhi.auction.entity.AuctionUser;
import com.baizhi.auction.service.AuctionUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AuctionUserController {

	@Autowired
	private AuctionUserService auctionUserService;
	
	
	@RequestMapping("/login")
	public String login(HttpSession session,String user_name,String user_password,String kaptcha){
		AuctionUser auctionUser = auctionUserService.login(user_name, user_password);
		String code = (String) session.getAttribute("kaptcha");
		
		System.out.println(auctionUser);
		System.out.println("����login==��kaptcha==��"+kaptcha);
		System.out.println("����login==��code==��"+code);
		
		if(auctionUser != null && code.equals(kaptcha)){
			session.setAttribute("auctionUser", auctionUser);
			System.out.println("=========");
			return "redirect:/private/getAll.do";
		}else{
			return "redirect:/login.jsp";
		}
	}
	
	@RequestMapping("/register")
	public String register(AuctionUser auctionUser,HttpSession session,String kaptcha){
		String code = (String) session.getAttribute("kaptcha");
		
		System.out.println("����register==��kaptcha==��"+kaptcha);
		System.out.println("����register==��code==��"+code);
		
		if(auctionUser != null && code.equals(kaptcha)){
			auctionUserService.register(auctionUser);
			return "redirect:/login.jsp";
		}else{
			System.out.println("**ע��ʧ�ܣ�");
			return "redirect:/register.jsp";
		}
	}
	
	@RequestMapping("/logOut")
	public String logOut(HttpSession session){
		System.out.println("+++++");
		session.removeAttribute("auctionUser");
		return "redirect:/login.jsp";
	}
}
