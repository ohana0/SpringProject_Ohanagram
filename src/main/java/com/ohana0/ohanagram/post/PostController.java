package com.ohana0.ohanagram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.ohanagram.comment.dto.CommentDetail;
import com.ohana0.ohanagram.comment.service.CommentService;
import com.ohana0.ohanagram.post.domain.Post;
import com.ohana0.ohanagram.post.dto.PostDetail;
import com.ohana0.ohanagram.post.service.PostService;
import com.ohana0.ohanagram.user.service.UserService;


@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;	
	
	@Autowired
	private UserService userService;

	
	@GetMapping("/home-view")
	public String homeView(HttpSession session, Model model){
		int userId = (Integer)session.getAttribute("id");
		List<PostDetail> postList = postService.getPostDetailList(userId);
		
		
		
		model.addAttribute("postList", postList);
		return "/post/home";
	}
	
	@GetMapping("/detail-view")
	public String postDetailView(@RequestParam("postId") int postId,Model model,HttpSession session) {
		int userId = (Integer)session.getAttribute("id");
		PostDetail post = postService.getPostDetail(postId, userId);

		model.addAttribute("post",post);
		String userName = userService.getLoginIdById(post.getUserId());
		model.addAttribute("userName",userName);
		List<CommentDetail> commentList = commentService.getCommentListByPostId(postId);
		model.addAttribute("commentList",commentList);
		
		return "/post/postDetail";
	}
	
	@GetMapping("/update-view")
	public String postUpdate(@RequestParam("postId") int postId,Model model,HttpSession session) {
		int userId = (Integer) session.getAttribute("id");
		PostDetail post = postService.getPostDetail(postId, userId);
		model.addAttribute("post", post);
		
		
		return"/post/update";
	}
	
	
}
