package com.ohana0.ohanagram.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanagram.like.repository.LikeRepository;
import com.ohana0.ohanagram.user.service.UserService;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	@Autowired
	private UserService userService;
	
	
	
	public int addLike(int postId, int userId) {

		int count = likeRepository.insertLike(postId,userId);
		
		return count;
	}


	public int deleteLike(int userId, int postId) {		
		int count = likeRepository.deleteLike(postId,userId);
		return count;
	}


	public int countLike(int postId) {
		int count = likeRepository.countLike(postId);
		return count;
	}


	public boolean duplicateLike(int postId, int userId) {
		
		int count = likeRepository.selectByPostIdUserId(postId,userId);
		
		if(count==0) {
			return false;
		}
		else {
			return true;
		}
	}


	public int deleteLikeByPostId(int postId) {
		int count = likeRepository.deleteLikeByPostId(postId);
		return count;
		
	}




}
