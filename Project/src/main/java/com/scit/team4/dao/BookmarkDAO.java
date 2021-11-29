package com.scit.team4.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.team4.vo.Bookmark;

@Repository
public class BookmarkDAO {

	@Autowired
	private SqlSession session;
	
	public int makeBookmark(HashMap<String, String> map) {
		
		int result = 0;
		
		try {
			BookmarkMapper mapper = session.getMapper(BookmarkMapper.class);
			result = mapper.makeBookmark(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteBookmark(HashMap<String, String> map) {
		
		int result = 0;
		
		try {
			BookmarkMapper mapper = session.getMapper(BookmarkMapper.class);
			result = mapper.deleteBookmark(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Bookmark> getBookmark(HashMap<String, String> map) {
		
		List<Bookmark> list = null;
		
		try {
			BookmarkMapper mapper = session.getMapper(BookmarkMapper.class);
			list = mapper.getBookmark(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
