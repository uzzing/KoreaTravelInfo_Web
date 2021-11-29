package com.scit.team4.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.team4.dao.BookmarkDAO;
import com.scit.team4.vo.Bookmark;

@Service
public class BookmarkService {
	
	@Autowired
	private BookmarkDAO dao;

	public String makeBookmark(HashMap<String, String> map) {
		int result = dao.makeBookmark(map);
		
		String path = "";
		if (result > 0) path = "redirect:/";
		
		return path;
	}
	
	public String deleteBookmark(HashMap<String, String> map) {
		int result = dao.deleteBookmark(map);
		
		String path = "";
		if (result > 0) path = "redirect:/";
		
		return path;
	}
	
	public List<Bookmark> getBookmark(HashMap<String, String> map) {
		
		return dao.getBookmark(map);
	}
}
