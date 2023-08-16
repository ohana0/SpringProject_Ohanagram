package com.ohana0.ohanagram.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class CommentDetail {
	
	private int id;
	private String loginId;
	private int postId;
	private String content;

}
