package com.ohana0.ohanagram.user.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanagram.user.domain.User;

@Repository
public interface UserRepository {

	public int insertUser(
			@Param("loginId") String loginId
			,@Param("password") String password
			,@Param("name") String name
			,@Param("email") String email
			,@Param("profileImage") String profileImage
			,@Param("introduce") String introduce);

	public int countId(@Param("loginId") String loginId);

	public List<User> selectUserByLoginIdAndPassword(@Param("loginId") String loginId, @Param("password") String encryptPassword);

	public User selectUserById(@Param("loginId") String loginId);

}
