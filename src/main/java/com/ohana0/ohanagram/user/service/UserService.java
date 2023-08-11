package com.ohana0.ohanagram.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanagram.common.EncryptUtils;
import com.ohana0.ohanagram.common.FileManager;
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
			, MultipartFile profileImage
			, String introduce) {
		String encryptPassword = EncryptUtils.md5(password);
		
				
		String imagePath = FileManager.saveFile(loginId,profileImage);
		int count = userRepository.insertUser(loginId,encryptPassword,name,email,imagePath,introduce);
		return count;
	}

	public int countId(String loginId) {
		int count = userRepository.countId(loginId);
		return count;
	}

	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		List<User> userList = userRepository.selectUserByLoginIdAndPassword(loginId,encryptPassword);
		if(userList.size() == 0) {
			return null;
		}
		else {
			return userList.get(0);
		}
	}
	
	public User getUserByUserId(String loginId) {
		User user = userRepository.selectUserByUserId(loginId);
		
		
		return user;
	}

	public User getUserById(int userId) {
		User user = userRepository.selectUserById(userId);
		return user;
	}

	public String getUserNameById(int userId) {
		User user = userRepository.selectUserById(userId);
		String name = user.getName();
		return name;
	}

	public String getLoginIdById(int userId) {
		User user = userRepository.selectUserById(userId);
		String loginId = user.getUserId();
		return loginId;
	}

	public String getProfileImagePathById(int userId) {
		User user = userRepository.selectUserById(userId);
		String profileImagePath = user.getProfileImagePath();
		return profileImagePath;
	}

	public int getIdByUserId(String userId) {
		User user = userRepository.selectUserByUserId(userId);
		return user.getId();
		
	}
}
