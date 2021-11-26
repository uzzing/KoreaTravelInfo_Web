package com.scit.team4.controllers;

import java.util.List;

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
import com.scit.team4.vo.ask;

@Controller
public class AskController {
	@Autowired
	AskService askservice;
	private static Logger logger = LoggerFactory.getLogger(AskController.class);
	
	@RequestMapping("/")
	public String index(
			@RequestParam(value="currentPage",defaultValue ="1") int currentPage,
			@RequestParam(value="searchItem", defaultValue="ask_title") String searchItem, 
			@RequestParam(value="searchWord", defaultValue="") String searchWord, 
			Model model) {
		
		String userid = "aa";
		
		int countPerPage = 10;
		int totalRecordCount = askservice.getBoardCount(searchItem, searchWord);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		int totalPageCount = navi.getTotalPageCount();
		logger.info("전체 페이지 :{}",totalPageCount);
		int srow = navi.getSrow();
		int erow = navi.getErow();
		
		List<ask> list = askservice.selectAllAsk(srow,erow,searchItem, searchWord);
		
		logger.info("[[문의리스트 정보]] : "+list);
		model.addAttribute("list", list);
		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);

		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("totalPageCount", totalPageCount);	
		model.addAttribute("currentPage", navi.getCurrentPage());
		model.addAttribute("navi", navi);
		
		return"listAsk";
	}

	@RequestMapping("/writeAsk")
	public String writeask(){
		return "/ask/writeAsk";
	}
	
	@RequestMapping(value="/writeAsk",method=RequestMethod.POST)
	public String writeask(ask ask){
		
		int result = askservice.insertAsk(ask);
		logger.info("등록여부:{}",result);
		
		return "redirect:/";
	}
	
	@RequestMapping("/detailAsk")
	public String detailAsk(int ask_seq, Model model) {
		//DB접속
		ask ask =askservice.selectOneAsk(ask_seq);
		
		//코멘트 불러오기 
		
		

		//모델작업

		model.addAttribute("ask", ask);

		return"ask/detailAsk";
	}
	
	@RequestMapping("/deleteAsk")
	public String deleteAsk(int ask_seq) {
		logger.info("삭제할 글번호"+ask_seq);
		
		//ask ask = askservice.selectOneAsk(ask_seq);
		
		int result = askservice.deleteAsk(ask_seq);
		if(result == 1) {
			return"redirect:/";
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
		logger.info("변경정보 받아옴!!");
		
//		Board b = repository.selectOne(board.getBoardnum());
		
		int result = askservice.updateAsk(ask);
		logger.info("수정여부:{}",result);
		if(result == 1) {
			return"redirect:/";
		}else {
			logger.info("수정실패");
			return "";
		}
	}
}
