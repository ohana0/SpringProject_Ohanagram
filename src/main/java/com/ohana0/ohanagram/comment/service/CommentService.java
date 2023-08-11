package com.ohana0.ohanagram.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanagram.comment.repository.CommentRepository;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;

	public int addComment(int userId, int postId, String content) {
		int count = commentRepository.insertComment(userId,postId,content);
		return count;
	}
}
