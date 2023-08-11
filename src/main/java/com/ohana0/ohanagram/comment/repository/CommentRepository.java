package com.ohana0.ohanagram.comment.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository {

	int insertComment(@Param("userId")int userId, @Param("postId")int postId, @Param("content")String content);

}
