package com.scit.team4.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.team4.vo.administrator;
import com.scit.team4.vo.ask;
import com.scit.team4.vo.comment_ask;
import com.scit.team4.vo.user_Info;


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

	public comment_ask selectOneComment(int ask_seq) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		comment_ask result = null;
		try {
			result = mapper.selectOneComment(ask_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertComment(comment_ask comment) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		int result =0;
		try {
			result = mapper.insertComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateComment(comment_ask comment) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		int result = 0;
		try {
			result = mapper.updateComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public administrator selectOneAdmin(String checkedID) {
		
		AskMapper mapper = session.getMapper(AskMapper.class);
		administrator result = null;
		
		try {
			result = mapper.selectOneAdmin(checkedID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; 
	}

	public user_Info selectOneUser(String checkedID) {
		AskMapper mapper = session.getMapper(AskMapper.class);
		user_Info result = null;
		try {
			result = mapper.selectOneUser(checkedID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; 
	}

}
