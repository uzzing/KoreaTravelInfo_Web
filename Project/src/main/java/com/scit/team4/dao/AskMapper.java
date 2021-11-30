package com.scit.team4.dao;

import java.util.List;
import java.util.Map;

import com.scit.team4.vo.administrator;
import com.scit.team4.vo.ask;
import com.scit.team4.vo.comment_ask;
import com.scit.team4.vo.user_Info;

public interface AskMapper {
	public int insertAsk(ask ask) throws Exception;
	public List<ask> selectAllAsk(Map<String,Object> search) throws Exception;
	public int updateAsk(ask ask) throws Exception;
	public int deleteAsk(int ask_seq) throws Exception;
	public ask selectOneAsk(int ask_seq) throws Exception;
	public int getBoardCount(Map<String, String> search) throws Exception; 
	public administrator selectOneAdmin(String checkedID) throws Exception;
	public user_Info selectOneUser(String checkedID) throws Exception;
	
	public comment_ask selectOneComment(int ask_seq) throws Exception;
	public int insertComment(comment_ask comment) throws Exception;
	public int updateComment(comment_ask comment) throws Exception;
}
