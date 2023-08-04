package com.ohana0.ohanagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ohana0.ohanagram.user.service.UserService;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserService userService;
	
	@PostMapping("/join")
	public Map<String,String> createUser(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,@RequestParam("name") String name
			,@RequestParam("email") String email
			,@RequestParam("profileImage") String profileImage
			,@RequestParam("introduce") String introduce
			){

		int count = userService.addUser(loginId,password,name,email,profileImage,introduce);
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	

	

}
