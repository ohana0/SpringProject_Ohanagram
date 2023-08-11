package com.ohana0.ohanagram.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanagram.like.repository.LikeRepository;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	
	public int addLike(int postId, int userId) {
		int count = likeRepository.insertLike(postId,userId);
		
		return count;
	}


	public int deleteLike(int userId, int postId) {
		int count = likeRepository.deleteLike(postId,userId);
		return count;
	}

}
