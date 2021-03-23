<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 
<meta http-equiv = "Content-Type" Content = "text/html; charset = UTF-8">
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>회원 목록</title>
<body>
<%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>
   <table class="blueone" style="width:100%" > <!-- style="text-align: center"  -->
        <br>
         <h2 class="list" style="text-align: center">회원 목록 </h2>
         <tr>
         <td><div class=btn-group2><button class="btn"><a href = "${path}/admin/adminDelete">강제탈퇴</a></button></div></td>
         </tr>
         <tr style="background-color: #bacad6;" >
            <th>아이디</th>
            <th>비밀번호</th>
            <th>회원명</th>
            <th>이메일</th>
            <th>성별</th>            
            <th>등록일</th>
         </tr>
         <c:forEach var = "row" items = "${list}">
         <tr class="readLine text-center" style="background-color: #fcfcfc;">
            <td>${row.userId2}</td>
            <td>${row.userPwd2}</td>
            <td>${row.userName2}</td>
            <td>${row.userEmail2}</td>
            <td>${row.gender2}</td>
            <td>${row.regDate2}</td>
         </tr>
         </c:forEach>
   </table>
</body>
</html>