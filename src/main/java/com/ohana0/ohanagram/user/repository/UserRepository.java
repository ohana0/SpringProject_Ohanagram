package com.ohana0.ohanagram.user.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository {

	public int insertUser(
			@Param("loginId") String loginId
			,@Param("password") String password
			,@Param("name") String name
			,@Param("email") String email
			,@Param("profileImage") String profileImage
			,@Param("introduce") String introduce);

}
