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
<c:if test="${not empty post }">
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
					<div class="likeCount m-2" id="${post.id}">					
					<c:if test="${post.myLike}">
						<i class="bi bi-heart-fill text-danger"></i>
					</c:if>
					<c:if test="${not post.myLike }">
						<i class="bi bi-heart"></i>
					</c:if>${post.likeCount }명이 좋아합니다</div>
				</div>
				<div class="commentInput d-flex w-100">
					<input type="text" class="form-control m-1" id="comment">
					<button type="button" class="btn btn-lignt btn-small m-1" id="commentInputBtn">작성</button>
				</div>
			<hr>
<c:if test="${post.userId == id }">
			<div class="d-flex justify-content-between align-items-center">
				<a href="/post/update-view?postId=${post.id }"><button class="btn btn-secondary" id="updateBtn">수정</button></a>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">삭제</button>

			</div>
</c:if>
		</div>    	
	</section>
</c:if>
	
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제하기</h5>
      </div>
      <div class="modal-body">
        정말로 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
        <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
      </div>
    </div>
  </div>
</div>
	
	
	
	
	
	
	
	
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