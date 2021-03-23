<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib2.jsp" %>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>게시물 답변</title>
<script type="text/javascript">
$(document).ready(function() {
<c:choose>
   <c:when test="${empty admin}">
   
   alert("답변할 게시물이 존재하지 않습니다.");
   location.href = "/admin/adminCustomerList";
   
   </c:when>
   <c:otherwise>
      
   
   $("#qnaHiBbsTitle").focus();
   
   
   $("#btnReply").on("click", function() {
      
      $("#btnReply").prop("disabled", true);  // 답변 버튼 활성화
      
      if($.trim($("#qnaHiBbsTitle").val()).length <= 0)
      {
         alert("제목을 입력하세요.");
         $("#hiBbsTitle").val("");
         $("#hiBbsTitle").focus();
         return;
      }
      
      if($.trim($("#qnaHiBbsContent").val()).length <= 0)
      {
         alert("내용을 입력하세요.");
         $("#qnaHiBbsContent").val("");
         $("#qnaHiBbsContent").focus();
         return;
      }
      
      var form = $("#adminReplyForm")[0];
      var formData = new FormData(form);
      
      $.ajax({
           type: "POST",
           enctype: 'multipart/form-data',
           url: "/admin/adminReplyProc",
           data: formData,
           processData: false,
           contentType: false,
           cache: false,
           timeout: 600000,
           beforeSend : function(xhr) 
           {
               xhr.setRequestHeader("AJAX", "true");
           },
           success: function (response) 
           {
              if(response.code == 0)
              {
                 alert("답변이 완료되었습니다.");                 
                 //location.href = "/admin/view?qnaHiBbsSeq=" + document.adminReplyForm.qnaHiBbsSeq.value;   // 얘는 get방식
                 document.bbsForm.action = "/admin/adminCustomerList";   // 얘는 post방식이라서 submit을 쓸때는 action을 반드시 해줘야함
                 document.bbsForm.submit();
              }
              else if(response.code == 400)
              {
                 alert("파라미터 값이 올바르지 않습니다.");   
                 $("#btnReply").prop("disabled", false);  // 수정 버튼 활성화
              }
              else if(response.code == 404)
              {
                 alert("게시물을 찾을수 없습니다.");
                 location.href = "/admin/adminCustomerList";
              }
              else
              {
                 alert("게시물 답변중 오류가 발생하였습니다.");
                 $("#btnReply").prop("disabled", false);  // 수정 버튼 활성화
              }
           },
           error: function (error) 
           {
              icia.common.error(error);
              alert("게시물 답변중 오류가 발생하였습니다.");
              $("#btnReply").prop("disabled", false);  // 수정 버튼 활성화
           }
       });
   });
   
   $("#btnList").on("click", function() {
      document.bbsForm.action = "/admin/adminCustomerList";
      document.bbsForm.submit();
   });
   </c:otherwise>
</c:choose>
});
</script>

<body>
<c:if test="${!empty admin}">
<%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>
<div class="container">
   <h2 class="list">게시물 답변</h2>
   <form name="adminReplyForm" id="adminReplyForm" method="post" enctype="multipart/form-data">
      <input type="text" name="qnaHiBbsTitle" id="qnaHiBbsTitle" maxlength="100" style="ime-mode:active;" value="" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
      <div class="form-group">
         <textarea class="form-control" rows="10" name="qnaHiBbsContent" id="qnaHiBbsContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required></textarea>
      </div>
      <input type="file" name="qnaHiBbsFile" id="qnaHiBbsFile" class="form-control mb-2" placeholder="파일을 선택하세요." required />
      <input type="hidden" name="qnaHiBbsSeq" id="qnaHiBbsSeq" value="${admin.qnaHiBbsSeq}" />
      <input type="hidden" name="searchType" value="${serachType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>
   
   <div class="btn-group2">
      <div class="col-sm-12">
         <button type="button" id="btnReply" class="btn btn-primary" title="답변">답변</button>
         <button type="button" id="btnList" class="btn btn-secondary" title="리스트">리스트</button>
      </div>
   </div>
</div>
<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="qnaHiBbsSeq" value="${admin.qnaHiBbsSeq}" />
   <input type="hidden" name="searchType" value="${serachType}" />
   <input type="hidden" name="searchValue" value="${searchValue}" />
   <input type="hidden" name="curPage" value="${curPage}" />
</form>
</c:if>
</body>
</html>