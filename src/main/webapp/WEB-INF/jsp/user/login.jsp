<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<section class="contents d-flex justify-content-center">
		<div class="login-box">
			<div class="d-flex justify-content-center">
				<h1>ohanagram</h1>
			</div>
			<br>
			<form id="loginForm">
				<div class="d-flex">
					<label class="input-label col-3 text-center">ID</label>
					<input type="text" class="form-control col-9" id="idInput">
				</div>
				<div class="d-flex pt-3">
					<label class="input-label col-3 text-center">Password</label>
					<input type="text" class="form-control col-9" id="passwordInput">
				</div>
				<button type="submit" class="btn btn-success btn-block mt-2" id="loginBtn">로그인</button>
			</form>
					
			<br><div>계정이 없으신가요?<a href="/user/join-view">회원가입</a></div>
		
		
		
		
		</div>
	
	
	
	</section>
	

	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit",function(e){
				
				e.preventDefault();
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				$.ajax({
					type:"post"
					,url:"/user/login"
					,data:{
						"loginId":id
						,"password":password
						
					}
					,success:function(data){
						if(data.result == "success"){
							alert(id + "님 환영합니다!");
							location.href="/post/home-view";
						}
						else{
							alert("아이디나 비밀번호를 잘못 입력하셨습니다.");
						}
					}
					,error:function(){
						alert("로그인 오류 발생");
					}
					
				})
				
				
			})
			
			
			
		});

	</script>
</div>
</body>
</html>