package com.newzen.webeditors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class PageController {
	
	@RequestMapping("summerNote")
	public String summerNote() {
		return "summer_note";
	}
	
	@RequestMapping("froala")
	public String froala() {
		return "froala";
	}
	
	@RequestMapping(value="summerNote", method=RequestMethod.POST)
	public void getSummerNote(@RequestParam(value="contents") String contents) {
		System.out.println("############# getSummerNote");
		System.out.println(contents);
	}
	
	
}
