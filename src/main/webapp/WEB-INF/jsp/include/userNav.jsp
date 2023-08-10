<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<div class="col-2"></div>
		<div class="col-1 d-none" id="userNav">

				<ul class="nav flex-column" style="width:100px">
				    <li class="nav-item"><a href="/user/logout" class="nav-link bg-secondary text-white font-weight-bold">로그아웃</a></li>
				    <li class="nav-item"><a href="/post/profile-view/?id=${user.userId }" class="nav-link bg-secondary text-white font-weight-bold">내글보기</a></li>
				    <li class="nav-item"><a href="#" class="nav-link bg-secondary text-white font-weight-bold">내활동</a></li>
				    
				</ul>

		</div>