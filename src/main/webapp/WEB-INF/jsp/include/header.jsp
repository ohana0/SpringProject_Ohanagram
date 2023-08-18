<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="d-flex align-items-center">
		<a href="/post/home-view" class="m-3 col-4 "><h1 class="text-dark">ohanagram</h1></a>
		<form class="col-4 d-flex search-box align-items-center" method="get" action="/user/profile-view">
			<input type="text" class="form-control" name="userId" placeholder="loginId">
			<button type="submit" class="btn btn-secondary" id="searchBtn">검색</button>
		
		</form>
		<div class="d-flex col-4 justify-content-end align-items-center pr-4">
			<c:if test="${not empty userId }" >

				<a id="userProfileImage" href="#"  data-toggle="modal" data-target="#userNav"><img alt="userImage" src="${profileImagePath }" width="50px"></a>
				

			</c:if>
			
		</div>
<!-- Modal -->
<div class="modal fade" id="userNav" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
  	<div class="modal-content">
 		<div class="nav flex-column w-100">
 			<button>${userId }</button>
		    <a href="/user/logout" class="btn nav-link bg-secondary text-white font-weight-bold">로그아웃</a>
		    <a href="/user/profile-view/?userId=${userId }" class="btn nav-link bg-secondary text-white font-weight-bold">내글보기</a>
		</div>
	</div>
  </div>
</div>
	</header>
	
