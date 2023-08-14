package com.ohana0.ohanagram.like.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {

	public int insertLike(@Param("postId") int postId, @Param("userId") int userId);

	public int deleteLike(@Param("postId") int postId, @Param("userId") int userId);

	public int countLike(@Param("postId") int postId);

	public int selectByPostIdUserId(@Param("postId") int postId, @Param("userId")int userId);

}
