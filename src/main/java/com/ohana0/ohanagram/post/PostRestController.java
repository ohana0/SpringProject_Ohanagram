package com.ohana0.ohanagram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.post.service.PostService;

@RestController
public class PostRestController {

	@Autowired
	private PostService postService;
	
	@PostMapping("/post/create")
	public Map<String,String> createPost(
			@RequestParam("content") String content 
			,@RequestParam(value="profileImage", required=false) MultipartFile file
			,HttpSession session){
		int userId = (int) session.getAttribute("id");
		
		int count = postService.addPost(userId, content,file);
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
