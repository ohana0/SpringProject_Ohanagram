package com.ohana0.ohanagram.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanagram.comment.domain.Comment;
import com.ohana0.ohanagram.comment.dto.CommentDetail;
import com.ohana0.ohanagram.comment.repository.CommentRepository;
import com.ohana0.ohanagram.user.service.UserService;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private UserService userService;

	public int addComment(int userId, String postId, String content) {
		int count = commentRepository.insertComment(userId,postId,content);
		return count;
	}
	
	public List<CommentDetail> getCommentListByPostId(int postId){
		List<Comment> commentList = commentRepository.selectCommentByPostId(postId);
		List<CommentDetail> commentDetailList = new ArrayList<>();
		for(Comment comment:commentList) {
			CommentDetail commentDetail = CommentDetail.builder()
				.id(comment.getId())
				.loginId(userService.getLoginIdById(comment.getUserId()))
				.content(comment.getContent())
				.postId(comment.getPostId())
				.build();
			commentDetailList.add(commentDetail);
		}
		return commentDetailList;
	}

	public int deleteCommentByPostId(int postId) {
		int count = commentRepository.deleteCommentByPostId(postId);
		return count;
	}
	
}
