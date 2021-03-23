<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta http-equiv = "Content_Type" content = "text/html; charset=UTF-8">


<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("#btnLogin").click(function(){
		location.href = "/index";
	});
});

</script>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<table border="2" width="300" height="300" align= "center" margin-left = "auto" margin-right = "auto";>
<tr style="text-align:center;">
	<td>
		<h3>아이디 찾기 검색 결과</h3>
		<br>
		<h4>${userId2}</h4>
		
		<button type = "button" id = "btnLogin">로그인</button>
		<button type = "button" id = "btnClose" onclick = "history.go(-1)">창닫기</button>
	</td>
</tr>
</table>

</body>
</html>