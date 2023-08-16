package com.ohana0.ohanagram.user.domain;

import java.time.ZonedDateTime;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class User {
	private int id;
	private String userId;
	private String password;
	private String name;
	private String email;
	private String introduce;
	private String profileImagePath;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;

}
