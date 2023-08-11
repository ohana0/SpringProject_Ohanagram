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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	
	<section class="contents d-flex">
		<div class="col-3"></div>
		<div class="contentsArea col-6">
			<div class="input-box card">
				<div class="d-flex m-2">
					<img src="${profileImagePath }" width="40px" class="m-2">
					<b class="m-2">${userId }</b>
				</div>
				<textarea placeholder="내용을 입력하세요" rows="4" class="form-control border rounded m-2 mt-0" style="width:550px" id="contentInput"></textarea>
				<div class="d-flex justify-content-between m-2">
					<i class="bi bi-card-image text-xl" id="imageIcon"></i>
					<input type="file" class="" id="postImageInput">
					<button type="button" class="btn btn-small" id="createPost">작성</button>				
				</div>
			</div>
			
			
			
			<div class="card-list">
				<hr class="mt-4 mb-4">
				
<c:forEach items="${postList}" var="post">
				<div class="card">
					<div class="d-flex align-items-center justify-content-between mt-2">
						<div class="d-flex align-items-center m-2">
							<img src="${post.profileImagePath }" width="40px">
							<strong class="ml-4">${post.userName }</strong>
						</div>
						<i class="bi bi-three-dots-vertical"></i>
					</div>
					
					<img src="${post.imagePath }" width="550px" class="m-2">
					
					<div class="likeCount m-2"><i class="bi bi-heart-fill"></i>44명이 좋아합니다</div>
					<div class="m-2"><strong>${post.loginId }</strong> ${post.content } </div>
					<div class="comment-box m-2">
						<div class="bg-light mb-2">댓글</div>
						<div class="d-flex">
							<b class="col-4">아이디</b><div>댓글내용</div>
						</div>
						<div class="d-flex">
							<b class="col-4">아이디</b><div>댓글내용이 길어요길어길어길어길ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</div>
						</div>
						<div class="d-flex">
							<b class="col-4">아이디</b><div>댓글내용</div>
						</div>
						<div class="comment-input d-flex m-2">
							<input type="text" class="form-control">
							<button type="button" class="btn btn-lignt btn-small">작성</button>
						</div>
	
					</div>
				</div>
</c:forEach>
		
			</div>
		</div>
	<%@ include file="/WEB-INF/jsp/include/userNav.jsp" %>


	</section>
	
	
	
	
	
	
	
	
	
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
</div>
<script>

	$(document).ready(function(){
		
		$("#createPost").on("click",function(){
			let content = $("#contentInput").val();
			
			var file = $("#postImageInput")[0].files[0];
			
			let formData = new FormData();
			formData.append("content",content);
			formData.append("file",file);
			
			$.ajax({
				type:"post"
				,url:"/post/create"
				,data:formData
			    ,enctype: 'multipart/form-data' // 파일 업로드를 위한 필수 설정
				,processData: false             // 파일 업로드를 위한 필수 설정
				,contentType: false              // 파일 업로드를 위한 필수 설정
				,success:function(data){
					if(data.result == "success"){
						location.href="/post/home-view";
						return;
					}
					else{
						alert("업로드 실패");
						return;
					}
					
				}
				,error:function(){
					alert("오류발생");
				}
				
			})
		})
		
		$("#imageIcon").on("click",function(){
			$("#postImageInput").click();
		})
		
		
		$("#userProfileImage").click(function(){

			if($("#userNav").hasClass("d-none")){
				
				$("#userNav").removeClass("d-none");
				return;
			}
			else{
				$("#userNav").addClass("d-none");
				return;
			}
		})
			
		
	})

</script>

</body>
</html>