package com.ohana0.ohanagram.comment.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanagram.comment.domain.Comment;

@Repository
public interface CommentRepository {

	public int insertComment(
			@Param("userId")int userId
			,@Param("postId")String postId
			,@Param("content")String content);
	
	public List<Comment> selectCommentByPostId(@Param("postId")int postId);

}
