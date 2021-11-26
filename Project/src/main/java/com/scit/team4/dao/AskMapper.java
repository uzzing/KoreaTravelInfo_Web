package com.scit.team4.dao;

import java.util.List;
import java.util.Map;
import com.scit.team4.vo.ask;

public interface AskMapper {
	public int insertAsk(ask ask) throws Exception;
	public List<ask> selectAllAsk(Map<String,Object> search) throws Exception;
	public int updateAsk(ask ask) throws Exception;
	public int deleteAsk(int ask_seq) throws Exception;

	public ask selectOneAsk(int ask_seq) throws Exception;
//	public int updateHitCount(ask ask)throws Exception;
	public int getBoardCount(Map<String, String> search)throws Exception; 
}
