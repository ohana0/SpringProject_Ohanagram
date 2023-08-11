<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="d-flex align-items-center">
		<a href="/post/home-view" class="m-3 col-4 "><h1 class="text-dark">ohanagram</h1></a>
		<div class="col-4 d-flex search-box">
			<input type="text" class="form-control" id="searchbox" placeholder="loginId">
			<a href="#" class="searchBtn">
				<img alt="searchIcon" src="" width="40px">
			</a>
		
		</div>
		<div class="d-flex col-4 justify-content-end align-items-center pr-4">
			<c:if test="${not empty userId }" >
				<a href="#" class="createPostBtn">
					<img alt="inputIcon" src="" width="40px" height="40px" class="mr-2">
				</a>
				<a id="userProfileImage" href="#"><img alt="userImage" src="${profileImagePath }" width="50px"></a>

			</c:if>
			
		</div>
		
	</header>