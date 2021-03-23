<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 
<title>회원탈퇴</title>
<srcipt src="http://ajax.googleapis.com/ajax/lib/jquery/1.11.1/jquery.min.js"></srcipt>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>
<div class="container">
   <h2 class="list" style="text-align: center">회원 강제 탈퇴</h2>
   <br><br>
   <h4 class="list" style="text-align: center">-회원 아이디-</h4>
</div>  
  
      <table class="form1">
      <tr class=btn-group2>
         <td>
            <form id="delete1" name="delete1" method="post">
               <input type="text" id="userId2" name=userId2 placeholder = "아이디 입력" />
            </form>
         </td>
         <td>
         &nbsp&nbsp
         </td>
         <td>
            <button type="button" class="btn" id="btnDelete">삭제</button>
         </td>
         <td>
         &nbsp&nbsp
         </td>
         <td>
            <button type="button" class="btn" id="close">창닫기</button>
         </td>
         
      </tr>
   </table>
<script>
$(document).ready(function() {      
   
   $("#btnDelete").on("click", function(){
         if(confirm("계정을 삭제 하시겠습니까?") == true)
         {
             $.ajax({
                 type : "POST",
                 url : "/admin/adminDeleteForm",
                 data : {
                    //hiBbsSeq : <c:out value="${hiBoard.hiBbsSeq}" />
                    userId2 : document.getElementById("userId2").value
                 },
                 datatype : "JSON",
                 beforeSend : function(xhr){
                       xhr.setRequestHeader("AJAX", "true");
                   },
                 success : function(response) {
                    // var data = JSON.parse(obj);

                    if(response.code == 0)
                    {
                       alert("계정이 삭제되었습니다.");
                       location.href = "/admin/adminList";
                       setTimeout('location.reload()',1000); 
                    }
                    else if(response.code == 400)
                    {
                       alert("계정을 찾을 수 없습니다.");
                    }
                    else if(response.code == 404)
                    {
                       alert("계정을 찾을 수 없습니다.");
                       location.href = "/admin/adminDelete";
                    }
                    else if(response.code == -999)
                      {
                         alert("답변 게시물이 존재하여 삭제할 수 없습니다.");
                      }
                    else
                    {
                       alert("계정 삭제중 오류가 발생하였습니다.");
                    }   
                 },
                 complete : function(data) 
                 {
                    // 응답이 종료되면 실행, 잘 사용하지않는다
                    icia.common.log(data);
                 },
                 error : function(xhr, status, error) 
                 {
                    icia.common.error(error);
                 }
              });
         }
      });
   
   $("#close").on("click",function(){
     location.href = "/admin/adminList";
   });

});
</script>
</body>
</html>