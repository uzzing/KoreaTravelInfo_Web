package com.scit.team4.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.team4.dao.AskDAO;
import com.scit.team4.dao.MemberDAO;
import com.scit.team4.vo.administrator;
import com.scit.team4.vo.user_Info;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String login(user_Info inputData) {
		
		String path = "";
		
		user_Info searchData = dao.selectMember(inputData.getUserid());

		
		if (searchData == null) {
			path = "redirect:/loginForm";
		}
		else {
			System.out.println(inputData);
			
			if (inputData.getUserpwd().equals(searchData.getUserpwd())) {
				session.setAttribute("loginId", searchData.getUserid());
				
				path = "redirect:/";
			}
			else {
				path = "redirect:/loginForm";
			}
		}
		
		return path;
	}
	
	public String loginAdmin(administrator inputData) {
		
		String path = "";
		
		administrator searchData = dao.selectAdmin(inputData.getAdminid());

		System.out.println(searchData);
		
		if (searchData == null) {
			path = "redirect:/loginFormAdmin";
		}
		else {
			System.out.println(inputData);
			
			if (inputData.getAdminpwd().equals(searchData.getAdminpwd())) {
				session.setAttribute("loginId", searchData.getAdminid());
				
				path = "redirect:/";
			}
			else {
				path = "redirect:/loginFormAdmin";
			}
		}
		
		return path;
	}
	
	public String logout() {
		session.removeAttribute("loginId");
		
		return "redirect:/";
	}
	
	public int idCheck(String id) {
		user_Info vo = dao.selectMember(id);
		
		if (vo != null) return 1;
		
		return 0;
	}
	
	public String join(user_Info vo) {
		int cnt = dao.join(vo);
		String path = "";
		
		if (cnt > 0) {
			path = "redirect:/";
		} else {
			try {
				path = "redirect:/joinForm";
			}
			catch(Exception e) {
				path = "redirect:/joinForm";
			}
		}
		
		return path;
	}
	
	
}
