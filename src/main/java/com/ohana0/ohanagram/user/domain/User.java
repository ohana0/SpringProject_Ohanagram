package com.ohana0.ohanagram.user.domain;

import java.time.ZonedDateTime;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Table(name="user")
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
