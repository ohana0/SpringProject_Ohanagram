<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="d-flex align-items-center">
		<h1 class="m-3 col-4">ohanagram</h1>
		<div class="col-4 d-flex search-box">
			<input type="text" class="form-control" id="searchbox">
			<a href="#" class="searchBtn">
				<img alt="searchIcon" src="/static/image/search_icon.png" width="40px">
			</a>
		
		</div>
		<div class="d-flex col-4 justify-content-end align-items-center">
			<c:if test="${not empty userId }" >
				<a href="#" class="createPostBtn">
					<img alt="searchIcon" src="/static/image/create_post_icon.png" width="40px" height="40px" class="mr-2">
				</a>
				<a href="/user/logout" class="myProfileBtn">

					<img alt="userImage" src="/static/image/null_user_image.png" width="50px" id="user_profile_image">
	
				</a>
			</c:if>
			
		</div>
	</header>