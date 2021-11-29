package com.scit.team4.dao;

import java.util.HashMap;
import java.util.List;

import com.scit.team4.vo.Bookmark;

public interface BookmarkMapper {
	public int makeBookmark(HashMap<String, String> map);
	public int deleteBookmark(HashMap<String, String> map);
	public List<Bookmark> getBookmark(HashMap<String, String> map);
}
