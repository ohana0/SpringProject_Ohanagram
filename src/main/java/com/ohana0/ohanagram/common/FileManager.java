package com.ohana0.ohanagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager{
	
	
	public static String saveProfileImage(String loginId, MultipartFile file) {
		
		String FILE_UPLOAD_PATH = "D:\\김동휘\\springProject\\workspace\\Ohanagram\\files\\profileImage"; 
		
		if(file == null) {
			return null;
		}
		
		// 같은 이름의 파일이 구분되어서 저장되도록 구성
		// 폴더를 만들어서 파일을 저장
		// user Id 값을 폴더 이름에 포함
		// 시간정보를 폴더이름에 포함
		// UNIX TIME : 1970년 1월 1일 부터 흐른 시간을 milli second 로 표현한 방식
		// 폴더 이름 예시 : /10_24654564654/
		
		String directoryName = "/" + loginId + "_" + System.currentTimeMillis() + "/";
		
		// 폴더 생성 (디렉토리생성)
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			// 디렉토리 생성 실패
			return null;
		}
		
		// 파일저장 
		try {
			byte[] bytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			// 파일 저장 실패 
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
	}
	public static String savePostImage(int userId, MultipartFile file) {
	
		String FILE_UPLOAD_PATH = "D:\\김동휘\\springProject\\workspace\\Ohanagram\\files\\postImage";
		
		if(file == null) {
			return null;
		}
		
		// 같은 이름의 파일이 구분되어서 저장되도록 구성
		// 폴더를 만들어서 파일을 저장
		// user Id 값을 폴더 이름에 포함
		// 시간정보를 폴더이름에 포함
		// UNIX TIME : 1970년 1월 1일 부터 흐른 시간을 milli second 로 표현한 방식
		// 폴더 이름 예시 : /10_24654564654/
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 폴더 생성 (디렉토리생성)
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			// 디렉토리 생성 실패
			return null;
		}
		
		// 파일저장 
		try {
			byte[] bytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			// 파일 저장 실패 
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
	}

}