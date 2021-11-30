package com.scit.team4.controllers;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.team4.service.MemberService;
import com.scit.team4.vo.administrator;
import com.scit.team4.vo.user_Info;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/loginForm";
	}
	
	@RequestMapping("/loginFormAdmin")
	public String loginForm_admin() {
		return "/loginFormAdmin";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(user_Info user) {
		return memberService.login(user);
	}
	
	@RequestMapping(value="/loginAdmin", method=RequestMethod.POST)
	public String login_admin(administrator admin) {
		System.out.println(admin);
		return memberService.loginAdmin(admin);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
		return memberService.logout();
	}
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm(user_Info user) {
		return "/joinForm" ;
	}
	
	@RequestMapping(value="/join" , method = RequestMethod.POST)
	public String join(user_Info vo) {
		return memberService.join(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public int idCheck(String userid) {
		return memberService.idCheck(userid);
	}
}
