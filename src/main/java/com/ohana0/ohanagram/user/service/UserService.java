package com.ohana0.ohanagram.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanagram.common.EncryptUtils;
import com.ohana0.ohanagram.user.domain.User;
import com.ohana0.ohanagram.user.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	public int addUser(
			String loginId
			, String password
			, String name
			, String email
			, String profileImage
			, String introduce) {
		String encryptPassword = EncryptUtils.md5(password);
		int count = userRepository.insertUser(loginId,encryptPassword,name,email,profileImage,introduce);
		return count;
	}



}
