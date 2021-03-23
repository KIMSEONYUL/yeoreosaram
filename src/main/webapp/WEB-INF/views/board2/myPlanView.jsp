<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib2.jsp"%>

<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>

<!DOCTYPE html>
<html>
<%
	int pNoSeq2 = HttpUtil.get(request, "pNoSeq2", 0);	
%>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<title>나의 일정</title>
	<script type="text/javascript">
	$(document).ready(function() 
	{
	   $("#planDelete").on("click", function()
	   {
	      if(confirm("일정을 삭제 하시겠습니까?") == true)
	       {
	
	            $.ajax({
	               type : "POST",
	               url : "/board2/planDelete",
	               data : {
	                  //hiBbsSeq : <c:out value="${hiBoard.hiBbsSeq}" />
	                  pNoSeq2 : document.getElementById("pNoSeq2").value
	               },
	               datatype : "JSON",
	               beforeSend : function(xhr){
	                     xhr.setRequestHeader("AJAX", "true");
	                 },
	               success : function(response) {
	                  // var data = JSON.parse(obj);
	
	                  if(response.code == 0)
	                  {
	                     alert("일정이 삭제되었습니다.");
	                     location.href = "/board2/myPlan";
	                     setTimeout('location.reload()',1000); 
	                  }
	                  else if(response.code == 400)
	                  {
	                     alert("파라미터 값이 올바르지 않습니다.");
	                  }
	                  else if(response.code == 404)
	                  {
	                     alert("일정을 찾을수 없습니다.");
	                     location.href = "/board2/myPlan";
	                  }
	                  else if(response.code == -999)
	                    {
	                       alert("오류로 인해 삭제할 수 없습니다.");
	                    }
	                  else
	                  {
	                     alert("일정 삭제중 오류가 발생하였습니다.");
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
	   
	   /****************************일정 공유하기****************************/
	   $("#shareForm").on("click",function(){
		  document.planList.action = "/board/writeForm";
		  document.planList.submit();
	   });
	   
	});
	</script>
</head>
<body>
<!-- navigation -->
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp"%>
   <div class="container">
         <h2 align='center' style="color:black;"><c:out value="${pTitle}" /> </h2>
	<table id="myPlanViewT">
		<thead>
		 <tr style="background-color: #F5dF4D;"> <!-- #f5ecae -->
		 <c:if test="${!empty list}">
		          <th scope="col" class="text-center" >장소</th>
		          <th scope="col" class="text-center">날짜</th>
		 </tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}" varStatus="status"> 
			<tr>
			  <td><c:out value="${list.pPlace}" /></td> 
			  <td><c:out value="${list.pDay}" /></td>        
			</tr>
			</c:forEach>
			</c:if>
		</tbody>
   </table>
   <br/><br/>
   
   <div class="btn-group">
      <button id="shareForm" name="shareForm">일정 공유하기</button>
   </div>
   
   <div class="btn-group">
      <button id="writeForm" name="writeForm"
         onclick="location.href='/board2/myPlan'">나의 일정</button>     
   </div>
   
   <div class="btn-group">
      <button id="planDelete" name="planDelete">일정 삭제</button>
   </div>

</div>

	<form id="planList" name="planList" method="post" >
   		<input type="hidden" id="pNoSeq2" name="pNoSeq2" value="${pNoSeq2}"/>
	</form>

</body>
</html>