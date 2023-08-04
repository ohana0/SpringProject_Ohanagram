<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<header class="d-flex align-items-center">
		<h1 class="m-3 col-4">ohanagram</h1>
		<div class="col-4 d-flex search-box">
			<input type="text" class="form-control" id="searchbox">
			<a href="#" class="searchBtn">
				<img alt="searchIcon" src="/static/image/search_icon.png" width="40px">
			</a>
		
		</div>
		<div class="d-flex col-4 justify-content-end align-items-center">
			<a href="#" class="createPostBtn">
				<img alt="searchIcon" src="/static/image/create_post_icon.png" width="40px" height="40px" class="mr-2">
			</a>
			<a href="#" class="myProfileBtn">
				<img alt="userImage" src="/static/image/null_user_image.png" width="50px" id="user_profile_image">
			</a>
		</div>
		</header>
	<section class="contents d-flex justify-content-center">
		<div class="join-box">
			<h1 class="d-flex justify-content-center">Welcome</h1>
			<br>
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">ID</label>
				<input type="text" id="idInput" class="form-control col-6" placeholder="ID">
				<button type="button" class="btn btn-block" id="idConfirm">중복확인</button>
			</div>
			
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">Password</label>
				<input type="password" id="passwordInput" class="form-control col-9" placeholder="****">
			</div>			
			
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">Name</label>
				<input type="text" id="nameInput" class="form-control col-9" placeholder="name">
			</div>			
			
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">Email</label>
				<input type="text" id="emailNameInput" class="form-control col-4" placeholder="email">
				<h4 class="col-1">@</h4>
				<input type="text" id="emailAddressInput" class="form-control col-4" placeholder="ohanagram.com">
			</div>
			
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">Profile</label>
				<input type="text" id="profileImageInput" class="form-control input-value col-9" placeholder="image path">
			</div>			
			
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">Introduce</label>
				<textarea id="introduceInput" class="form-control" placeholder="introduce"></textarea>
			</div>
			
			<button type="button" class="btn btn-outline-secondary btn-block mt-2" id="joinBtn">제출</button>
		
		</div>
	</section>
	<footer>
		<div class="text-secondary">copyright @ ohanagram 2023</div>
	</footer>

</div>


<script>
	$(document).ready(function(){
		$("#idConfirm").on("click",function(){
			
			let loginId = $("#idInput").val();
			
			
		})
		
		$("#joinBtn").on("click",function(){
			let loginId = $("#idInput").val();
			let password = $("#passwordInput").val();
			let name = $("#nameInput").val();
			let profileImage = $("#profileImageInput").val();
			let introduce = $("#introduceInput").val();
			
			
			if(loginId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			if(password.length <= 4){
				alert("최소 4글자의 비밀번호를 입력하세요");
				return;
			}
			if(name == ""){
				alert("이름을 입력하세요");
				return;
			} 
			if($("emailNameInput").val() == "" || $("#emailAddressInput").val() == ""){
				alert("이메일을 입력하세요");
				return;
			}
			if(!$("#emailAddressInput").val().includes(".")){
				alert("형식이 잘못된 이메일입니다.");
				return;
			}
			let email = $("#emailNameInput").val() + "@" + $("#emailAddressInput").val();

			$.ajax({
			
				type:"post"
				,url:"/user/join"
				,data:{
					"loginId": loginId
					,"password":password
					,"name":name
					,"email":email
					,"profileImage":profileImage
					,"introduce":introduce
				}
				,success:function(data){
					if(data.result == "success"){
						alert("가입 성공");
						location.href="/user/login-view";
					}
					else{
						alert("가입 실패");
						return;
					}
				}
				,error:function(){
					alert("오류발생");
					return;
				}
				
				
				
				
			})
			
			
			
			
		})
	})

	
</script>

</body>
</html>