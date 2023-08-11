package com.ohana0.ohanagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.user.domain.User;
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
			,@RequestParam(value="profileImage", required=false) MultipartFile file
			,@RequestParam("introduce") String introduce
			){
		
		
		
		int count = userService.addUser(loginId,password,name,email,file,introduce);
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@PostMapping("/join/duplicate-id")
	public Map<String,String> isDuplicateId(@RequestParam("loginId") String loginId) {

		int count = userService.countId(loginId);
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "duplicate");
		}
		else {
			resultMap.put("result", "not-duplicate");
		}
		
		return resultMap;
	}
	
	@PostMapping("/login")
	public Map<String,String> login(@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpSession session
			){
		
		Map<String,String> resultMap = new HashMap<>();
		User user = userService.getUser(loginId, password);
		
		
		
		if(user != null) {
			resultMap.put("result", "success");
			
			session.setAttribute("id", user.getId());
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("profileImagePath", user.getProfileImagePath());
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
