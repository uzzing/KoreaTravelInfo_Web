package com.scit.team4.controllers;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.team4.service.BookmarkService;
import com.scit.team4.vo.Bookmark;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkService bookmarkService;

	// ajax
	@RequestMapping(value = "/makeBookmark", method = RequestMethod.POST)
	@ResponseBody
	public String makeBookmark(String contentId, String title, String addr, String userid, String typeOf) {

		HashMap<String, String> map = new HashMap<>();
		map.put("contentId", contentId);
		map.put("title", title);
		map.put("addr", addr);
		map.put("userid", userid);
		map.put("typeOf", typeOf);

		return bookmarkService.makeBookmark(map);
	}

	// ajax
	@RequestMapping(value = "/deleteBookmark", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBookmark(String contentId, String userid) {

		HashMap<String, String> map = new HashMap<>();
		map.put("contentId", contentId);
		map.put("userid", userid);

		return bookmarkService.deleteBookmark(map);
	}

	// ajax
	@RequestMapping(value = "/getBookmark", method = RequestMethod.GET)
	@ResponseBody
	public List<Bookmark> getBookmark(String userid, String typeOf) {

		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("typeOf", typeOf);

		return bookmarkService.getBookmark(map);
	}

}
