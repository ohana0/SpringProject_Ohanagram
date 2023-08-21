<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${user.name }님의 프로필</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"></head>
</head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<section class="contents d-flex">
		<div class="col-3"></div>
		
<c:if test="${not empty user }" >
		<div class="contentsArea col-6">
		<div class="d-flex">
			<img src="${user.profileImagePath }" width="260px" height="260px" class="m-2">
			<div class="profileBox m-2">
				<h3>${user.name }</h3>
				<div style="height:140px">${user.introduce }</div>
				<div><b>${user.email }</b></div>
				<div><b>${user.userId }</b></div>
				<div>게시글 <b>${countPost }</b>개</div>
			</div>
		</div>
		<hr>
		<div class="cardList d-flex flex-wrap">
<c:forEach items="${postList}" var="post">
				<a class="card" href="/post/detail-view?postId=${post.id }">
					<img src="${post.imagePath }" width="170px" height="170px" class="m-2">	
				</a>
</c:forEach>
		</div>
		</div>
</c:if>


<c:if test="${empty user }">
<div>
	<h1>오류발생: 해당유저가 존재하지않습니다.</h1>
	<br>
	<a href="/post/home-view">홈으로 돌아가기</a>
</div>

</c:if>
	
	</section>
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	

</div>
</body>
</html>