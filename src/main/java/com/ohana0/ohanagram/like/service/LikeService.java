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
	
	
	
	public int addLike(int postId, String loginId) {
		
		int userId = userService.getIdByUserId(loginId);
		
		int count = likeRepository.insertLike(postId,userId);
		
		return count;
	}


	public int deleteLike(String loginId, int postId) {
		int userId = userService.getIdByUserId(loginId);
		
		int count = likeRepository.deleteLike(postId,userId);
		return count;
	}


	public int countLike(int postId) {
		int count = likeRepository.countLike(postId);
		return count;
	}


	public int duplicateLike(int postId, String loginId) {
		int userId = userService.getIdByUserId(loginId);
		
		int count = likeRepository.selectByPostIdUserId(postId,userId);
		
		return count;
	}


	public int deleteLikeByPostId(int postId) {
		int count = likeRepository.deleteLikeByPostId(postId);
		return count;
		
	}




}
