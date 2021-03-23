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
}

//모달기능
$(document).ready(function(){
	//1. 모달 히든 불러오기
	$("#searchBtn1").click(function(){
		$("#backgroundModal").show();
	});
	
	//2. 모달창 닫기
	$(".close").on("click", function(){
		$("#backgroundModal").hide();
	});
	
	//3. 모달창 윈도우 클릭 시 닫기
	$(window).on("click", function(){
		if(event.target == $("#backgroundModal").get(0)){
			$("#backgroundModal").hide();
		}
	});
});
</script>
<script>
//아이디소스 아작스 개싫다
var idValue = "";

var idSearchClick = function(){
	console.log($('#inputName1').val());
	
	$.ajax({
		type : "POST",
		url : "/user/userSearch",
		data : {
			inputName1 : $('#inputName1').val()
		},
		datatype : "JSON",		 
		
		success:function(response){
			
			console.log(response);
			
			if(response.code == 0){
				$('#idValue').text("아이디가 존재하지 않습니다.");
				alert("0");
			}
			
			else{
				$('#idValue').text(response);
				alert("1 : " + response);
				//아이디값 별도 저장
				idValue = response;
			}
			
		}		
	});
}
</script> 

<body>
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>
	<h3>아이디 / 비밀번호 찾기</h3>
	<p>인증된 이메일만 정보 찾기가 가능 합니다.</p>
	<br>
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
		<div class = "form-group">
			
			<label>이름</label>
			
			<div>
			<input type = "text" id = "inputName1" name ="inputName1"
			 placeholder = "ex>김아무개">	
			</div>
		
		</div>
		
		<div class = "form-group">
			<button id = "searchBtn1" type = "button" onclick = "idSearchClick()">
			확인</button>
			<button><a href = "http://travel.icia.co.kr:8088/index">취소</a></button>
		</div>
	</div>
		
<!-- -------------------------- 비밀번호 찾기 --------------------------->	
		<div id = "searchP" style = "display: none;">
			
			<div class = "form-group">
				<label>아이디</label>
				
				<div>
					<input type = "text" id = "inputId"
					name = "inputId2" placeholder = "ex>kimamugae">
				</div>
				
				<label for = "inputEmail2">이메일</label>
				
				<div>
					<input type = "email" id = inputEmail2 name = inputEmail2
					placeholder = "ex>email@naver.com">
				</div>
			</div>
			
			<div class = "form-group">
				<button id = "searchBtn2" type = "button" onclick = "idSearchClick">
				확인</button>
				<button><a href = "http://travel.icia.co.kr:8088/index">취소</a></button>
			</div>
			
		</div>
<%@ include file="/WEB-INF/views/include/userSearchModal.jsp" %>
<script>$("#backgroundModal").hide(); </script>
	
</body>
</html>