package com.ohana0.ohanagram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ohana0.ohanagram.comment.service.CommentService;

@RestController
public class CommentRestController {
	@Autowired
	private CommentService commentService;
	
	public Map<String,String> createComment(
			@RequestParam("postId") int postId
			,@RequestParam("content") String content
			,HttpSession session
			){
		int userId = (Integer) session.getAttribute("id");
		
		int count = commentService.addComment(userId, postId,content);
		
		
		
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
