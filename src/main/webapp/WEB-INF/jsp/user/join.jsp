<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
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
		<h1>ohanagram</h1>
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
				<input type="file" id="profileImageInput" class="form-control col-3" accept=".jpg, .png"><div class="col-6">.jpg,.png 파일만 가능</div>
			</div>			
			
			<div class="d-flex align-items-center">
				<label class="input-label col-3 d-flex justify-content-center">Introduce</label>
				<textarea id="introduceInput" class="form-control" placeholder="introduce"></textarea>
			</div>
			
			<button type="button" class="btn btn-outline-secondary btn-block mt-2" id="joinBtn">제출</button>
			<br><div>계정이 있으신가요? <a href="/user/login-view">로그인</a></div>
		
		</div>
	</section>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>

</div>


<script>
	$(document).ready(function(){
		let idChecked = false;
		
		$("#idInput").on("input",function(){
			
			isChecked = false;
		});
		
		
		$("#idConfirm").on("click",function(){
			
			let loginId = $("#idInput").val();
			
			$.ajax({
				type:"post"
				,url:"/user/join/duplicate-id"
				,data:{"loginId":loginId}
				,success:function(data){
					if (data.result == "duplicate"){
						alert("중복된 아이디입니다.");
						idChecked = false;
					}
					else{
						alert("사용가능한 아이디입니다.");
						idChecked = true;
					}
					
				}
				,error:function(){
					alert("오류발생");
				}
				
			});
			
		});
		
		$("#joinBtn").on("click",function(){
			let loginId = $("#idInput").val();
			let password = $("#passwordInput").val();
			let name = $("#nameInput").val();
			var file = $("#profileImageInput")[0].files[0];

			let introduce = $("#introduceInput").val();

			if(!idChecked){
				alert("아이디 중복확인을 해주세요.");
				return;
			}
			
			if(loginId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			if(password.length < 4){
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

			var formData = new FormData();
			formData.append("loginId",loginId);
			formData.append("password",password);
			formData.append("name",name);
			formData.append("email",email);
			formData.append("profileImage",file);
			formData.append("introduce",introduce);
			
			$.ajax({
			
				type:"post"
				,url:"/user/join"
				,data:formData
			    ,enctype: 'multipart/form-data' // 파일 업로드를 위한 필수 설정
			   	,processData: false             // 파일 업로드를 위한 필수 설정
			    ,contentType: false              // 파일 업로드를 위한 필수 설정
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
				
				
				
				
			});
			
			
			
			
		});
	});

	
</script>

</body>
</html>