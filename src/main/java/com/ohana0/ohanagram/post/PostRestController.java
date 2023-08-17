package com.ohana0.ohanagram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.comment.service.CommentService;
import com.ohana0.ohanagram.common.FileManager;
import com.ohana0.ohanagram.like.service.LikeService;
import com.ohana0.ohanagram.post.service.PostService;

@RestController
public class PostRestController {

	@Autowired
	private PostService postService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private LikeService likeService;
	
	@PostMapping("/post/create")
	public Map<String,String> createPost(
			@RequestParam("content") String content 
			,@RequestParam(value="file", required=false) MultipartFile file
			,HttpSession session){
		String userId = (String) session.getAttribute("userId");
		
		int count = postService.addPost(userId, content, file);
		
		
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@PutMapping("/post/update")
	public Map<String,String> updatePost(
			@RequestParam("postId") int postId
			,@RequestParam("content") String content){
		
		int count = postService.updatePost(postId,content);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@DeleteMapping("/post/delete")
	public Map<String,String> deletePost(@RequestParam("postId")int postId,HttpSession session){
		
		Map<String,String> resultMap = new HashMap<>();
		
		int userId = (Integer)session.getAttribute("id");
		int count = 0;
		if(userId != postService.getPostById(postId).getUserId()) {
			count = 0;
		}
		else {
			
			//이미지 파일을지우고
			FileManager.deleteFile(postService.getPostById(postId).getImagePath());
			//댓글들을지우고
			commentService.deleteCommentByPostId(postId);
			//좋아요정보를지우고
			likeService.deleteLikeByPostId(postId);
			//게시글을지움
			count = postService.deletePost(postId);
		}
		
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	


}
