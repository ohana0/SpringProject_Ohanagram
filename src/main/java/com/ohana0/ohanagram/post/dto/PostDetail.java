package com.ohana0.ohanagram.post.dto;


import java.util.List;

import com.ohana0.ohanagram.comment.dto.CommentDetail;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PostDetail {
	private int id;
	private String content;
	private String imagePath;
	private int userId;
	private String userName;
	private String loginId;
	private String profileImagePath;
	private int likeCount;
	private String myLike;
	private List<CommentDetail> commentList;
	

	
}
