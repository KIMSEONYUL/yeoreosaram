<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
<script>

//체크 버튼에 따라 아이디 비번 기능 달라짐
function searchCheck(num){
	if(num == '1'){
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";
		
	}
	else{
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
};


</script>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type = "text/javascript">

$(function(){
	("#searchBtn1").click(function(){
		location.href = "/user/findIdForm";
		
	});
	$("#searchBtn2").click(function(){
		var massage = ${msg};
		$.ajax({
	        type : "POST",
	        url : "/user/findPwdForm",
	        data : {
	           userId2 : $("#userId2").val(),
	           userEmail2 : $("#userEmail2").val()
	           
	        },
	        
	        datatype : "JSON",
	        
	        beforeSend : function(xhr){
	               xhr.setRequestHeader("AJAX", "true");
	        },    
	        success : function(response) {

	           if(response.code == 0)
	           {
	        	   alert("msg");
	        	   location.href = "/user/userSearch";
	           }
	           else if(response.code == 100)
	           {
	        	   alert("msg");
		           newPwd();
	        	   location.href = "/user/findPwdForm";
	           } 
	           
	           else if (response.code == -1){
	        	   alert("msg");
	        	   location.href = "/user/userSearch";
	           }
		},
	   });
		

	});
}
function newPwd(){
	//임시비번 생성
		String newPwd = "";
		int i;
		
		for(i = 0 ; i < 12; i++) {
			newPwd += (char)((Math.random() * 20) + 97);
		}
		
		user2.setUserPwd2(newPwd);


    return "/user/findPwdForm";

 	 // 임시비번 생성


}


		


</script>



<body>
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>
	<h3>아이디 / 비밀번호 찾기</h3>
	<p>인증된 이메일만 정보 찾기가 가능 합니다.</p>
	
<!-------------------------------- 라디오 버튼  ----------------------------------->
	
		
		<div class = "custom-control custom-radio custom-control-inline">
			<input type = "radio" id = "search1" name = "searchTotal" 
			class = "custom-control-input" onclick = "searchCheck(1)" checked = "checked">
			<label class = "custom-control-label" for = "search1">아이디 찾기</label>
		</div>
		
		
		<div class = "custom-control custom-radio custom-control-inline">
			<input type = "radio" id = "search2" name = "searchTotal"
			class = "custom-control-input" onclick = "searchCheck(2)">
			<label for = "search2" class = "custom-control-label">비밀번호 찾기</label>
		</div>
	
	
<!--------------------- 아이디 찾기 -------------------------------->
	
	<div id = "searchI">
		<form action = "/user/findIdForm" method = "POST">
			
			<label>이메일</label>
			
			<div>
			<input type = "text" id = "e_mail" name ="e_mail"
			   placeholder = "ex>email@naver.com" required>	
			</div>
		
		<br>
		
			<button id = "searchBtn1" class="btn btn-outline-warning" type = "submit">아이디찾기</button>
			<button class="btn btn-outline-warning"><a href = "http://travel.icia.co.kr:8088/index">취소</a></button>
		
		</form>
	</div>
		
<!-- -------------------------- 비밀번호 찾기 --------------------------->	
		<div id = "searchP" style = "display: none;"><!-- css할 때 display:none 건들 ㄴㄴ -->
			<form action = "/user/findPwdForm" method = "POST">			
				
				<label>아이디</label>
				
				<div>
					<input type = "text" id = "userId2" 
					name = "userId2" placeholder = "ex>kimamugae">
				</div>
				
				<label>이메일</label>
				
				<div>
					<input type = "text" id = "userEmail2" name = "userEmail2"
					placeholder = "ex>email@naver.com">
				</div>
			
			<br>
			
			
				<button id = "searchBtn2" class="btn btn-outline-warning">
				임시 비밀번호 발급받기</button>
				<button class="btn btn-outline-warning"><a href = "http://travel.icia.co.kr:8088/index">취소</a></button>
			
		</form>
	</div>
			
	
</body>
</html>