package com.ohana0.ohanagram.comment.domain;

import java.util.Date;

import lombok.Getter;
@Getter
public class Comment {
	
	private int id;
	private int userId;
	private int postId;
	private String content;
	private Date createdAt;
	private Date updatedAt;

}
