package com.ohana0.ohanagram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohana0.ohanagram.post.dto.PostDetail;
import com.ohana0.ohanagram.post.service.PostService;


@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	PostService postService;
	
	@GetMapping("/home-view")
	public String homeView(HttpSession session, Model model){
		List<PostDetail> postList = postService.getPostDetailList(session);
		model.addAttribute("postList", postList);
		return "/post/home";
	}
	
	
}
