package com.ohana0.ohanagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.common.FileManager;
import com.ohana0.ohanagram.post.domain.Post;
import com.ohana0.ohanagram.post.dto.PostDetail;
import com.ohana0.ohanagram.post.repository.PostRepository;
import com.ohana0.ohanagram.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;

	public int addPost(String userId, String content, MultipartFile file) {
		String imagePath = FileManager.saveFile(userId, file);
		
		int id = userService.getIdByUserId(userId);
		
		int count = postRepository.insertPost(id,content,imagePath);
		
		return count;
	}

	public List<PostDetail> getPostDetailList() {
		List<Post> postList = postRepository.selectPostList();
		List<PostDetail> postDetailList =new ArrayList<>();
		
		for(Post post:postList) {
			PostDetail postDetail = PostDetail.builder()
					.id(post.getId())
					.content(post.getContent())
					.imagePath(post.getImagePath())
					.userId(post.getUserId())
					.userName(userService.getUserNameById(post.getUserId()))
					.loginId(userService.getLoginIdById(post.getUserId()))
					.profileImagePath(userService.getProfileImagePathById(post.getUserId()))
					.build();
			
			postDetailList.add(postDetail);
			
			
		}
		return postDetailList;
	}

}
