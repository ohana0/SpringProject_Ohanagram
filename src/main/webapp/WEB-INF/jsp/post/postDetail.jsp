<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"></head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	
	<section class="contents d-flex">
		<div class="col-2"></div>
		<div class="contentsArea col-8 d-flex">
			<img src="${post.imagePath }" style="width:350px; height:350px">
			<div>
				<div class="post" style="height:100px">
					<h3>${userName }</h3>
					<div>${post.content }</div>
				</div>
				<div class="commentList" style="height:400px;">
<c:forEach items="${commentList }" var="comment">						
						<div class="d-flex">
							<b style="width:100px">${comment.loginId}</b><div>${comment.content}</div>
						</div>
</c:forEach>					
					
				</div>
			</div>
			

		</div>    	

		<div class="col-1"></div>
		<div class="col-1 d-none" id="userNav">

				<ul class="nav flex-column" style="width:100px">
				    <li class="nav-item"><a href="/user/logout" class="nav-link bg-secondary text-white font-weight-bold">로그아웃</a></li>
				    <li class="nav-item"><a href="/user/profile-view/?userId=${userId }" class="nav-link bg-secondary text-white font-weight-bold">내글보기</a></li>
				    
				</ul>

		</div>
	</section>
	
	
	
	
	
	
	
	
	
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
</div>
<script>

	$(document).ready(function(){

	})

</script>

</body>
</html>