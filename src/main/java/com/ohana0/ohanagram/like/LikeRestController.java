package com.ohana0.ohanagram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ohana0.ohanagram.like.service.LikeService;

@RestController
public class LikeRestController {
	
	@Autowired
	LikeService likeService;
	
	@PostMapping("/post/like")
	public Map<String,String> like(
			@RequestParam("postId") int postId
			,HttpSession session
			){
		String loginId = (String) session.getAttribute("userId");
		
		int duplicateLike = likeService.duplicateLike(postId,loginId);
		
		if(duplicateLike!=0) {
			int count = likeService.deleteLike(loginId,postId);
			
			Map<String,String> resultMap = new HashMap<>();
			if(count == 1) {
				resultMap.put("result", "success");
			}
			else {
				resultMap.put("result", "fail");
			}
			
			return resultMap;
		}
		
		else {
			int count = likeService.addLike(postId,loginId);
			
			
			
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
	
		
	
	
}
