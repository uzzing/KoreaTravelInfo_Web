package com.scit.team4;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}
	
	@RequestMapping(value = "/attractions", method = RequestMethod.GET)
	public String attractions() {
		
		return "tabs/attractions";
	}
	
	@RequestMapping(value = "/accommodations", method = RequestMethod.GET)
	public String accommodations() {
		
		return "tabs/accommodations";
	}
	
	@RequestMapping(value = "/restaurants", method = RequestMethod.GET)
	public String restaurants() {
		
		return "tabs/restaurants";
	}
	
	@RequestMapping(value = "/shopping", method = RequestMethod.GET)
	public String shopping() {
		
		return "tabs/shopping";
	}
	
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark() {
		
		return "tabs/bookmark";
	}
}
