<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib2.jsp"%>
<%!int i = 1;%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<title>나의 일정</title>
<script type="text/javascript">
function fn_view(pNoSeq2,pTitle)
	{
	   document.myPlanForm.pNoSeq2.value = pNoSeq2;
	   document.myPlanForm.pTitle.value = pTitle;
	   document.myPlanForm.action = "/board2/myPlanView";
	   document.myPlanForm.submit();
	}
</script>

<body>
<!-- navigation -->
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp"%>
<section class="section">
	<div class="container">
		<div class="form-group"><h1 align="center">나의 일정</h1></div>
		<div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
	         <c:if test="${!empty planlist2}">
	            <c:forEach var="planMake" items="${planlist2}"   varStatus="status">
	               <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
	                  <a href="javascript:void(0)" onclick="fn_view(${planMake.pNoSeq2},'${planMake.pTitle}')" class="item-wrap fancybox">
	                     <div class="work-info"><br><h2>${planMake.pTitle}</h2><p>상세보기</p></div> 
	                     <img class="img-fluid" src="/resources/images/globe.png">
	                  </a>
	               </div>         
	            </c:forEach>
	         </c:if>
	      </div>
      </div>
   </section>
<form name="myPlanForm" id="myPlanForm" method="post">
	<input type="hidden" name="pNoSeq2" value="" />
	<input type="hidden" name="pTitle" value="" />
</form>
</body>
</html>