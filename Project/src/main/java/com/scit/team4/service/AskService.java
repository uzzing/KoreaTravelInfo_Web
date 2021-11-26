package com.scit.team4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.team4.dao.AskDAO;
import com.scit.team4.vo.ask;

@Service
public class AskService {
	@Autowired
	AskDAO askdao;
	
	public int insertAsk(ask ask){
		int result = askdao.insertAsk(ask);
		return result;
	}

	public List<ask> selectAllAsk(int srow, int erow,String searchItem, String searchWord) {
		List<ask> result = askdao.selectAllAsk(srow,erow,searchItem, searchWord);
		return result;
	}

	public ask selectOneAsk(int ask_seq) {
		ask result = askdao.selectOneAsk(ask_seq);
		return result;
	}

	public int deleteAsk(int ask_seq) {
		int result = askdao.deleteAsk(ask_seq);
		return result;
	}

	public int updateAsk(ask ask) {
		int result = askdao.updateAsk(ask);
		return result;
	}

	public int getBoardCount(String searchItem, String searchWord) {
		int result = askdao.getBoardCount(searchItem,searchWord);
		return result;
	}
	
	
}
