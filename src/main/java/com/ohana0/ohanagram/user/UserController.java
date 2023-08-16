package com.ohana0.ohanagram.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.ohanagram.post.domain.Post;
import com.ohana0.ohanagram.post.service.PostService;
import com.ohana0.ohanagram.user.domain.User;
import com.ohana0.ohanagram.user.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;
	
	@GetMapping("/join-view")
	public String join() {
		return "/user/join";
	}
	@GetMapping("/login-view")
	public String login() {
		return "/user/login";
	}
	@GetMapping("/logout")
	public String logout (HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("profileImage");
		return "redirect:/user/login-view";
	}
	
	@GetMapping("/profile-view")
	public String profile(@RequestParam("userId")String userId, Model model) {
		User user = userService.getUserByUserId(userId);
		
		if(user.getProfileImagePath() == null) {
			user.setProfileImagePath("/images/null/null_user_image.png");
		}
		model.addAttribute("user",user);
		List<Post> postList = postService.getPostListByUserId(user.getId());
		model.addAttribute("postList",postList);		
		int countPost = postList.size();
		model.addAttribute("countPost",countPost);
		
		
		return "/user/profile";
	}
	
}
