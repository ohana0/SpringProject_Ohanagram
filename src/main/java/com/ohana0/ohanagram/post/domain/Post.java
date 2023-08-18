package com.ohana0.ohanagram.post.domain;

import java.util.Date;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name="post")
public class Post {
	private int id;
	private int userId;
	private String content;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;

}
