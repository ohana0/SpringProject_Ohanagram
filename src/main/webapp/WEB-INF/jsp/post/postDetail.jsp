<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userName }님의 게시글</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"></head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<hr>
	<section class="contents d-flex">
		<div class="col-2"></div>
		<div class="contentsArea col-8 card p-2">
		<div class="d-flex">
			<img src="${post.imagePath }" style="width:350px; height:350px" class="m-2">
			<div>
				<br>
				<div class="post" style="height:100px">
					<a href="/user/profile-view?userId=${userName }">
						<h3 class="text-dark">${post.userName }</h3>
					</a>
					<div>${post.content }</div>
				</div>
				
				<div class="commentList" style="height:300px;" class="d-flex align-items-end">
					<div>
<c:forEach items="${commentList }" var="comment">						
						<div class="d-flex">
							<a href="/user/profile-view?userId=${comment.loginId }" style="width:100px">
								<b class="text-dark">${comment.loginId}</b>
							</a>
							<div>${comment.content}</div>
						</div>
</c:forEach>					
					</div>


					
				</div>
				
			</div>
			</div>
				<div class="likecount">
					<div class="likeCount m-2" id="${post.id}">${post.myLike}${post.likeCount }명이 좋아합니다</div>
				</div>
				<div class="commentInput d-flex w-100">
					<input type="text" class="form-control m-1" id="comment">
					<button type="button" class="btn btn-lignt btn-small m-1" id="commentInputBtn">작성</button>
				</div>
			<hr>
				
			<div class="d-flex justify-content-between align-items-center">
				<button class="btn btn-secondary" id="updateBtn">수정</button>
				<button class="btn btn-secondary" id="deleteBtn">삭제</button>
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
		$(".likeCount").on("click",function(){

			let postId =$(this).attr("id");
			$.ajax({
				type:"post"
				,url:"/post/like"
				,data:{"postId":postId}
				,success:function(data){
					if(data.result == "success"){
						location.reload();
					}
					else{
						alert("실패");
						location.reload();
						return;
					}
				
				}
				,error:function(){
					alert("오류발생");
					return;
				}
				
			})
			
			
			
		})
		
		$("#deleteBtn").on("click",function(){
			let postId = ${post.id};
			
			$.ajax({
				type:"delete"
				,url:"/post/delete"
				,data:{"postId":postId}
				,success:function(data){
					if(data.result=="success"){
						location.href="/post/home-view";
					}
					else{
						alert("삭제 실패");
						return;

					}
				}
				,error:function(){
					alert("오류 발생");
					return;
				}
			})
			
			
		})
		
		$("#commentInputBtn").on("click",function(){
			
			let postId = ${post.id};
			let content = $("#comment").val();
			if(content == ""){
				alert("내용을 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post"
				,url:"/post/comment/create"
				,data:{"postId":postId,"content":content}
				,success:function(data){
					if(data.result=="success"){
						location.reload();
					}
					else{
						alert("댓글입력 실패");
						return;
	
					}
				}
				,error:function(){
					alert("오류 발생");
					return;
				}
			})
			
			
			
		})
		
		

	})

</script>

</body>
</html>