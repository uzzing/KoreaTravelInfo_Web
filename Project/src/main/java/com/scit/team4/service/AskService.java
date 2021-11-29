package com.scit.team4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.team4.dao.AskDAO;
import com.scit.team4.vo.administrator;
import com.scit.team4.vo.ask;
import com.scit.team4.vo.comment_ask;
import com.scit.team4.vo.user_Info;

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

	public comment_ask selectOneComment(int ask_seq) {
		comment_ask result = askdao.selectOneComment(ask_seq);
		return result;
	}

	public int insertComment(comment_ask comment) {
		int result = askdao.insertComment(comment);
		return result;
	}

	public int updateComment(comment_ask comment) {
		int result = askdao.updateComment(comment);
		return result;
	}

	public administrator selectOneAdmin(String checkedID) {
		administrator result = askdao.selectOneAdmin(checkedID);
		return result;
	}

	public user_Info selectOneUser(String checkedID) {
		user_Info result = askdao.selectOneUser(checkedID);
		return result;
	}
	
	
}
