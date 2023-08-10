package com.ohana0.ohanagram.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.common.FileManager;
import com.ohana0.ohanagram.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;

	public int addPost(int userId, String content, MultipartFile file) {
		String imagePath = FileManager.savePostImage(userId, file);
		int count = postRepository.insertPost(userId,content,imagePath);
		
		return count;
	}

}
