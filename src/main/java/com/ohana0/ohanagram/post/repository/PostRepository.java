package com.ohana0.ohanagram.post.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository {

	int insertPost(@Param("userId") int userId, @Param("content") String content, @Param("imagePath")String imagePath);
	
}
