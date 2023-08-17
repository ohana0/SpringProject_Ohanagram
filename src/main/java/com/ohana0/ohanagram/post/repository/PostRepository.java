package com.ohana0.ohanagram.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanagram.post.domain.Post;

@Repository
public interface PostRepository {

	public int insertPost(@Param("userId") int userId, @Param("content") String content, @Param("imagePath")String imagePath);

	public List<Post> selectPostList();

	public List<Post> selectPostListByUserId(@Param("userId")int userId);

	public Post selectPostById(@Param("postId")int postId);

	public int updatePost(@Param("postId")int postId, @Param("content")String content);

	public int deletePost(@Param("postId")int postId);
	
}
