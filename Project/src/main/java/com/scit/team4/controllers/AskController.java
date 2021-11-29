package com.scit.team4.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scit.team4.service.AskService;
import com.scit.team4.util.PageNavigator;
import com.scit.team4.vo.administrator;
import com.scit.team4.vo.ask;
import com.scit.team4.vo.comment_ask;
import com.scit.team4.vo.user_Info;

@Controller
public class AskController {
	@Autowired
	AskService askservice;
	private static Logger logger = LoggerFactory.getLogger(AskController.class);
	
	@RequestMapping("/listAsk")
	public String indexAskList(
			@RequestParam(value="currentPage",defaultValue ="1") int currentPage,
			@RequestParam(value="searchItem", defaultValue="ask_title") String searchItem, 
			@RequestParam(value="searchWord", defaultValue="") String searchWord, 
			Model model,
			HttpSession session,
			HttpServletResponse response) {
		// 로그인한 권한 구분 (관리자, 회원)
		String checkedID = (String)session.getAttribute("loginId");
		administrator admin = askservice.selectOneAdmin(checkedID);
		user_Info user = askservice.selectOneUser(checkedID);
		
		if(admin != null) {
			String adminid = admin.getAdminid();
			model.addAttribute("adminid", adminid);
		}
		if(user != null) {
			String userid = user.getUserid();
			model.addAttribute("userid", userid);
		}
		
		//페이징 관련 
		int countPerPage = 10;
		int totalRecordCount = askservice.getBoardCount(searchItem, searchWord);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		int totalPageCount = navi.getTotalPageCount();
		int srow = navi.getSrow();
		int erow = navi.getErow();
		
		List<ask> list = askservice.selectAllAsk(srow,erow,searchItem, searchWord);
		
		//모델작업
		model.addAttribute("list", list);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("totalPageCount", totalPageCount);	
		model.addAttribute("currentPage", navi.getCurrentPage());
		model.addAttribute("navi", navi);
		
		return"/listAsk";
	}

	@RequestMapping("/writeAsk")
	public String writeask(){
		return "/ask/writeAsk";
	}
	
	@RequestMapping(value="/writeAsk",method=RequestMethod.POST)
	public String writeask(ask ask){
		
		int result = askservice.insertAsk(ask);
		logger.info("등록여부:{}",result);
		
		return "redirect:/listAsk";
	}
	
	@RequestMapping("/detailAsk")
	public String detailAsk(int ask_seq, Model model,HttpSession session,HttpServletResponse response) {
		
		String checkedID = (String)session.getAttribute("loginId");
		administrator admin = askservice.selectOneAdmin(checkedID);
		user_Info user = askservice.selectOneUser(checkedID);
		
		if(admin != null) {
			String adminid = admin.getAdminid();
			model.addAttribute("adminid", adminid);
		}
		if(user != null) {
			String userid = user.getUserid();
			model.addAttribute("userid", userid);
		}
		
		//DB접속 
		ask ask =askservice.selectOneAsk(ask_seq);
		
		//코멘트 불러오기 
		comment_ask comment = askservice.selectOneComment(ask.getAsk_seq());
		

		//모델작업
		model.addAttribute("ask", ask);
		model.addAttribute("comment", comment);

		return"ask/detailAsk";
	}
	
	@RequestMapping(value="/writeComment",method=RequestMethod.POST)
	public String writeComment(comment_ask comment){
		
		int result = askservice.insertComment(comment);
		logger.info("등록여부:{}",result);
		
		return "redirect:/listAsk";
	}
	
	@RequestMapping("/deleteAsk")
	public String deleteAsk(int ask_seq) {
		logger.info("삭제할 글번호"+ask_seq);
		
		int result = askservice.deleteAsk(ask_seq);
		if(result == 1) {
			return"redirect:/listAsk";
		}else {
			logger.info("수정실패");
			return "";
		}
	}

	@RequestMapping("/updateAsk")
	public String updateAsk(int ask_seq, Model model) {
		ask ask = askservice.selectOneAsk(ask_seq);
		model.addAttribute("ask", ask);
		
		return"ask/updateAsk";
	}

	@RequestMapping(value="/updateAsk", method=RequestMethod.POST)
	public String updateboard(ask ask) {
		logger.info("받아온 정보:{}",ask);
		int result = askservice.updateAsk(ask);
		logger.info("수정여부:{}",result);
		if(result == 1) {
			return"redirect:/listAsk";
		}else {
			logger.info("수정실패");
			return "";
		}
	}
	
	
	@RequestMapping("/updateComment")
	public String updateComment(int ask_seq,int comment_seq,Model model,HttpSession session,HttpServletResponse response){
		
		String checkedID = (String)session.getAttribute("loginId");
		administrator admin = askservice.selectOneAdmin(checkedID);
		user_Info user = askservice.selectOneUser(checkedID);
		
		if(admin != null) {
			String adminid = admin.getAdminid();
			model.addAttribute("adminid", adminid);
		}
		if(user != null) {
			String userid = user.getUserid();
			model.addAttribute("userid", userid);
		}
		
		ask ask =askservice.selectOneAsk(ask_seq);
		comment_ask comment = askservice.selectOneComment(ask.getAsk_seq());
		

		//모델작업
		model.addAttribute("ask", ask);
		model.addAttribute("comment", comment);
		
		return "ask/updateComment";
	}
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	public String updateComment(comment_ask comment) {
		
		int result = askservice.updateComment(comment);
		logger.info("수정여부:{}",result);
		if(result == 1) {
			return"redirect:/listAsk";
		}else {
			logger.info("수정실패");
			return "";
		}
		
	}
}
