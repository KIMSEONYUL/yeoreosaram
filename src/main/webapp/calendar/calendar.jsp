<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.web.util.HttpUtil" %>
<%! 
String pStart = null;
String pEnd = null;
%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 
<meta charset="UTF-8" />
<title>일정 선택하기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<%
int pEnd1 = HttpUtil.get(request, "pEnd" , 0);
int pStart1 = HttpUtil.get(request, "pStart", 0);

if((pEnd1 - pStart1) + 1 > 10)
{
%>
   alert("x");
<%
}
%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
   $(document).ready(function() {
   
        //오늘 날짜를 출력
        $("#today").text(new Date().toLocaleDateString());

        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        
        // 시작일(pStart)은 종료일(pEnd) 이후 날짜 선택 불가
        // 종료일(pEnd)은 시작일(pStart) 이전 날짜 선택 불가

        //시작일
        $('#pStart').datepicker({
            showOn: "both",                          // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "/resources/images/cal.png", 
            buttonImageOnly : true,                
            buttonText: "날짜선택",            //지금 사용은 안함
            dateFormat: "yymmdd",             
            changeMonth: true,                  //월을 이동하기 위한 선택상자 표시여부
            minDate: 0,                               //오늘 이전 날짜 선택 불가
           
            onClose: function( selectedDate ) {    
                // 시작일(pStart) datepicker가 닫힐때
                // 종료일(pEnd)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#pEnd").datepicker( "option", "minDate", selectedDate );
            }                
        });

        //종료일
        $('#pEnd').datepicker({
            showOn: "both", 
            buttonImage: "/resources/images/cal.png", 
            buttonImageOnly : true,
            buttonText: "날짜선택",         //지금 사용은 안함
            dateFormat: "yymmdd",
            changeMonth: true,
            minDate: 0,
            onClose: function( selectedDate ) {
                $("#pStart").datepicker( "option", "maxDate", selectedDate );
            }                
        });
        
      //계획짜기 버튼을 클릭했을 경우,
      $("#btnCalendar").on("click", function(){   
         if(($("#pEnd").val() - $("#pStart").val()) + 1 <= 10)
            { //종료일 - 시작일 +1 값이 10일 이하일 경우에
                 //값이 채워지지 않을경우,
                 if(($("#pStart").val() == 0)){
                   alert("여행 시작일을 선택해주세요.");
                   document.location.reload();   //reload
               }else if(($("#pEnd").val() == 0)) {
                  alert("여행 종료일을 선택해주세요.");
                  document.location.reload();   //reload
               }else {
                     document.plan.action = "/travel/join3";
                     document.plan.submit();
                     window.open("about:blank","_self").close();//자기자신 창닫기
               }
       }else {
              alert("여행 날짜는 최대 10일 입니다.");
              document.location.reload();
          }
   }); //click button > btnCalendar
      
    //창닫기 버튼을 클릭 했을 경우,
      $("#btnClose").on('click',function(){
         window.open("about:blank","_self").close();//자기자신 창닫기
      }); //click button > btnClose
});
</script>

<body>
   <form name="plan" id="plan" class="plan" method="post" target="_blank">
         <div class="title_box">
            <h5>여행날짜 선택</h5>
         </div>
         
         <div class="popup_content">
               <p>여행 제목  <input type="text" name="pTitle" id="pTitle" size="15"></p>
            <label for="pStart">출발일</label>
            <input type="text" name="pStart" id="pStart" size="10">
            <br/>
             <label for="pEnd">종료일</label>
             <input type="text" name="pEnd" id="pEnd" size="10">
          </div>
          
         <div class="popup_footer">
            <div class="fr" style="margin-right:20px;">
               <button id="btnCalendar" name="btnCalendar">계획짜기</button>
               <button id="btnClose" name="btnClose">창닫기</button>
          </div>
       </div>
   </form>
</body>
</html>