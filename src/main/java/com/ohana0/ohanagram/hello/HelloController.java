package com.ohana0.ohanagram.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@ResponseBody
	@RequestMapping("/hello")
	public String hello() {
		return "helloworld";
	}
	
	@RequestMapping("/helloworld")
	public String helloJSP() {
		return "/hello/hello";
	}
	
}
