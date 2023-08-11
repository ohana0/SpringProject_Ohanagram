package com.ohana0.ohanagram.post.dto;

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
}
