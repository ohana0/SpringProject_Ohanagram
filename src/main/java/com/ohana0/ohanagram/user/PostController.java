package com.ohana0.ohanagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/home-view")
	public String homeView(){
		
		return "/post/home";
	}
	
	
}
