package com.scit.team4.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.team4.vo.ask;


@Repository
public class AskDAO {
	
	@Autowired
	SqlSession session;

	public int insertAsk(ask ask) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		
		int result =0;
		
		try {
			result = mapper.insertAsk(ask);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public List<ask> selectAllAsk(int srow, int erow,String searchItem, String searchWord) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		List<ask> result = null; 
		Map<String,Object> search = new HashMap<>();
		search.put("searchItem", searchItem);
		search.put("searchWord", searchWord);
		search.put("srow", srow);
		search.put("erow", erow);
		
		try {
			result = mapper.selectAllAsk(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public ask selectOneAsk(int ask_seq) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		ask result =null; 
		try {
			result = mapper.selectOneAsk(ask_seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int deleteAsk(int ask_seq) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		int result = 0;
		try {
			result = mapper.deleteAsk(ask_seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int updateAsk(ask ask) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		int result = 0;
		try {
			result = mapper.updateAsk(ask);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getBoardCount(String searchItem, String searchWord) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		int result = 0;
		Map<String,String> search = new HashMap<>();
		search.put("searchItem", searchItem);
		search.put("searchWord", searchWord);
		
		try {
			result = mapper.getBoardCount(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
