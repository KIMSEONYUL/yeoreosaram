<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib2.jsp" %>
<%
   // 개행문자 값을 저장한다.
   //개행문자 값을 newLine에 저장해서 JSTL에서 쓴다는것
   pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>게시물 보기</title>
<script type="text/javascript">
$(document).ready(function() { 
<c:choose>
   <c:when test="${empty admin}">
   alert("조회하신 게시물이 존재하지 않습니다.");
   document.bbsForm.action = "/admin/adminCustomerList";
   document.bbsForm.submit();
   </c:when>
   <c:otherwise>

   $("#btnList").on("click", function() {
      document.bbsForm.action = "/admin/adminCustomerList";
      document.bbsForm.submit();
   });
   
   $("#btnReply").on("click", function() {
      document.bbsForm.action = "/admin/adminReplyForm";
      document.bbsForm.submit();
   });
   
   
   $("#btnDelete").on("click", function(){
      if(confirm("게시물을 삭제 하시겠습니까?") == true)
      {
         $.ajax({
            type : "POST",
            url : "/admin/adminqListDelete",
            data : {
               qnaHiBbsSeq : <c:out value="${admin.qnaHiBbsSeq}" />
            },
            datatype : "JSON",
            beforeSend : function(xhr){
                  xhr.setRequestHeader("AJAX", "true");
              },
            success : function(response) {
               // var data = JSON.parse(obj);

               if(response.code == 0)
               {
                  alert("게시물이 삭제되었습니다.");
                  location.href = "/admin/adminCustomerList";
               }
               else if(response.code == 400)
               {
                  alert("파라미터 값이 올바르지 않습니다.");
               }
               else if(response.code == 404)
               {
                  alert("게시물을 찾을수 없습니다.");
                  location.href = "/admin/adminCustomerList";
               }
               else if(response.code == -999)
                 {
                    alert("답변 게시물이 존재하여 삭제할 수 없습니다.");
                 }
               else
               {
                  alert("게시물이 삭제중 오류가 발생하였습니다.");
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
   </c:otherwise>
</c:choose>   
});
</script>
</head>
<body>
<c:if test="${!empty admin}">
<%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>
<div class="container">
   <h2 class="list">게시물 보기</h2>
   <div class="row" style="margin-right:0; margin-left:0;">
      <table class="table">
         <thead>
            <tr class="table-active" style="color:#939597">
               <th scope="col" style="width:60%">
                  <c:out value="${admin.qnaHiBbsTitle}" /><br/>
                  <c:out value="${admin.userName}" />&nbsp;&nbsp;&nbsp;
                  <a href="mailto:${admin.userEmail}" style="color:#828282;">${admin.userEmail}</a>
<!--    <c:if test="${!empty qna.qnaHiBoardFile}">
                  &nbsp;&nbsp;&nbsp;<a href="/board/download?qnaHiBbsSeq=${admin.qnaHiBoardFile.qnaHiBbsSeq}" style="color:#000;">[첨부파일]</a>
    </c:if>  -->                
               </th>
               <th scope="col" style="width:40%" class="text-right">
                  조회 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${admin.qnaHiBbsReadCnt}" /><br/>
                  ${admin.regDate}
               </th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td colspan="2"><pre class="name1"><c:out value="${admin.qnaHiBbsContent}" /></pre></td>
            </tr>
         </tbody>
         <tfoot>
         <tr>
               <td colspan="2"></td>
           </tr>
         </tfoot>
      </table>
   </div>

   
   <!-- btn-group은 색상 -->
   <div class="btn-group2">
   <button type="button" id="btnList" class="btn btn-secondary">리스트</button>

   <button type="button" id="btnReply" class="btn btn-secondary">답변</button>
  
   <button type="button" id="btnDelete" class="btn btn-secondary">삭제</button>

   <br/>
   <br/>
</div>
</c:if>
</div>
<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="qnaHiBbsSeq" value="${qnaHiBbsSeq}" />
   <input type="hidden" name="searchType" value="${searchType}" />
   <input type="hidden" name="searchValue" value="${searchValue}" />
   <input type="hidden" name="curPage" value="${curPage}" />
</form>

</body>
</html>