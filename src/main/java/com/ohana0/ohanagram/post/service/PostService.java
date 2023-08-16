package com.ohana0.ohanagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.comment.service.CommentService;
import com.ohana0.ohanagram.common.FileManager;
import com.ohana0.ohanagram.like.service.LikeService;
import com.ohana0.ohanagram.post.domain.Post;
import com.ohana0.ohanagram.post.dto.PostDetail;
import com.ohana0.ohanagram.post.repository.PostRepository;
import com.ohana0.ohanagram.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CommentService commentService;
	


	public int addPost(String userId, String content, MultipartFile file) {
		String imagePath = FileManager.saveFile(userId, file);
		
		int id = userService.getIdByUserId(userId);
		
		int count = postRepository.insertPost(id,content,imagePath);
		
		return count;
	}
	
	public List<Post> getPostListByUserId(int userId){
		List<Post> postList = postRepository.selectPostListByUserId(userId);
		return postList;
	}

	public List<PostDetail> getPostDetailList(String userId) {
		List<Post> postList = postRepository.selectPostList();
		List<PostDetail> postDetailList =new ArrayList<>();
		
		for(Post post:postList) {
			String myLike;
			if(likeService.duplicateLike(post.getId(), userId)==1) {
				myLike = "<i class=\"bi bi-heart-fill\"></i>";
				
			}
			else {
				myLike="<i class=\"bi bi-heart\"></i>";
			}
			PostDetail postDetail = PostDetail.builder()
					.id(post.getId())
					.content(post.getContent())
					.imagePath(post.getImagePath())
					.userId(post.getUserId())
					.userName(userService.getUserNameById(post.getUserId()))
					.myLike(myLike)
					.loginId(userService.getLoginIdById(post.getUserId()))
					.profileImagePath(userService.getProfileImagePathById(post.getUserId()))
					.likeCount(likeService.countLike(post.getId()))
					.commentList(commentService.getCommentListByPostId(post.getId()))
					.build();
			
			postDetailList.add(postDetail);
			
			
		}
		return postDetailList;
	}

	public Post getPostById(int postId) {
		Post post = postRepository.selectPostById(postId);
		return post;
	}

}
