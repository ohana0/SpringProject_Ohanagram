<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userName }님의 게시글 수정</title>
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
			<div class="d-flex justify-content-center">
				<img src="${post.imagePath }" style="width:350px; height:350px" class="m-2">
				<input type="text" value="${post.content }" id="contentInput" class="form-control m-2" style="width:350px; height:350px">
			</div>
			<button type="button" class="btn btn-secondary" id="submit">수정</button>
		</div>    	

	</section>

	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
</div>
<script>	

	$(document).ready(function(){
		$("#submit").on("click",function(){
			let postId = ${post.id}
			let content = $("#contentInput").val();
			
			$.ajax({
				type:"put"
				,url:"/post/update"
				,data:{"postId":postId, "content":content}
				,success:function(data){
					if(data.result == "success"){
						location.href="/post/detail-view?postId="+postId;

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

		

	})

</script>

</body>
</html>