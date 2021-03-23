<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset=UTF-8">
<%
String userId2 = request.getParameter("userId2");
String userEmail2 = request.getParameter("userEmail2");
%>

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("#btnLogin").click(function(){
		location.href = "/index";
	});
	
	$("#btnClose").click(function(){
		location.href = "/user/userSearch";
	});
})
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
		<h3>임시비밀번호 발급</h3>
		<h1>${user2.getUserPwd2()}</h1>
		<h5 color = "red">※임시비밀번호 입니다. 빠른 시일내에 변경 바랍니다.</h5>
		
		<button type = "button" id = "btnLogin">로그인</button>
		<button type = "button" id = "btnClose">창닫기</button>
	</td>
</tr>
</table>
<input type = "text" name = "userId2" id = "userId2" value = "${userId2}" />
<input type = "hidden" name = "userEmail2" id = "userEmail2"value = "${userEmail2}" />
</body>
</html>