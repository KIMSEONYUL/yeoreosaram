<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<!DOCTYPE html>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>드라이브 코스!</title>

<body>
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>

   <div id="banner" class="container" data-aos="fade-up">
      <img class="bannerItem" src="/resources/images/driveBanner.jpg" class="image image-full" />
   </div>

 <!-- ======= Main Start ======= -->
  <main id="main">
    <section>
      <div class="container">
        <div class="row mb-4 align-items-center">
          <div class="col-md-6" data-aos="fade-up">
            <h2 class="aa">당일치기 드라이브 코스 4</h2>
            <p>기분전환이 필요하지만 멀리 가긴 부담스럽다면 드라이브가 최고입니다!</p>
            <p>답답한 마음은 그 곳에 두고 올 수 있도록 재충전의 시간이 어떨까요?</p>
            <p>국내의 다채로운 드라이브 코스 4 곳을 소개합니다!</p>
          </div>
       </div>
      </div>

     <div class="container">
       <div class="row align-items-stretch">
         <div class="col-md-8" data-aos="fade-up">
           <img src="/resources/images/drive1.jpg" alt="Image" class="img-fluid">
           <img src="/resources/images/drive2.jpg" alt="Image" class="img-fluid">
           <img src="/resources/images/drive3.jpg" alt="Image" class="img-fluid">
           <img src="/resources/images/drive4.jpg" alt="Image" class="img-fluid">
         </div>
         <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
           <div class="sticky-content">
             <h3 class="aa">인천 '인천대교'</h3>
             <p class="mb-4"><span class="text-muted">추천드라이브 코스<br>
             ▶ 영종대교 - 을왕리 해수욕장 - 영종도 마시안 해변 - 인천대교</span></p>

             <div class="mb-5">
               <p>[드라이브 하며 가볼만한 곳]<br>
               을왕리 해수욕장 : 아름다운 서해를 조망할 수 있습니다.<br><br>
               영종도 마시안 해변 : 갯벌과 하얀 모래시장이 공존하는 독특한 풍경을 자랑합니다.<br></p>
             </div>

             <h4 class="h4 mb-3">주변 맛집 & 카페</h4>
             <ul class="list-unstyled list-line mb-5">
               <li>황해 해물 칼국수 1호점</li>
               <li>어부 신광호 2호점</li>
               <li>마시랑 카페</li>
             </ul>
             
             
             <h3 class="aa">인천 '송도 센트럴 파크'</h3>
              <p class="mb-4"><span class="text-muted">추천드라이브 코스<br>
             ▶ 솔찬공원 - 송도센트럴파크</span></p>
             <div class="mb-5">
               <p>[드라이브 하며 가볼만한 곳]<br>
               송도센트럴파크 : 인천의 대표 야경 명소 입니다.<br><br>
               솔찬 공원 : 해변을 따라 산책하기 좋아 일몰도 함께 구경할 수 있습니다.<br></p>
             </div>

             <h4 class="h4 mb-3">주변 맛집 & 카페</h4>
             <ul class="list-unstyled list-line mb-5">
               <li>오크우드 프리미어 인천 오크 레스토랑</li>
               <li>카페 꼼마</li>
               <li>카페드라페</li>
             </ul>
             
             <h3 class="aa">양평 '두물머리'</h3>
             <p class="mb-4"><span class="text-muted">추천드라이브 코스<br>
             ▶ 두물머리 - 팔당유원지</span></p>

             <div class="mb-5">
               <p>[드라이브 하며 가볼만한 곳]<br>
               두물머리 : 한강 1경으로 손꼽히는 곳 입니다.<br><br>
               세미원 : 두물머리를 가기 전 둘러봐야 할 필수 코스, 분수대 연못 등 포토존이 가득합니다.<br></p>
             </div>

             <h4 class="h4 mb-3">주변 맛집 & 카페</h4>
             <ul class="list-unstyled list-line mb-5">
               <li>연핫도그</li>
               <li>한강민물장어</li>
               <li>고당</li>
             </ul>
             
             <h3 class="aa">가평 '가평75번 국도'</h3>
             <p class="mb-4"><span class="text-muted">추천드라이브 코스<br>
             ▶ 청평호 - 남이섬 - 자라섬 - 가평천</span></p>

             <div class="mb-5">
               <p>[드라이브 하며 가볼만한 곳]<br>
               남이섬 : 가평에서 배를 타고 들어갈 수 있는 섬이며 산책을 즐기기 좋고 다양한 포토존이 있습니다.<br><br>
               자라섬 : 동물, 공룡, 조형물 등 흥미를 자극하는것이 다양해 아이들과 함께 방문하기 좋습니다.<br></p>
             </div>

             <h4 class="h4 mb-3">주변 맛집 & 카페</h4>
             <ul class="list-unstyled list-line mb-5">
               <li>도선재</li>
               <li>유명숙 춘천닭갈비</li>
               <li>코미호미</li>
             </ul>
            <p><a href="/mainHome" class="readmore">HOME</a></p>
           </div>
        </div>
       </div>
     </div>
    </section>
  </main>
 <!-- ======= Main End ======= -->

 <!-- ======= Footer ======= -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright Travel 2021</p>
          <div class="credits">
            Made by <a href="/admin/adminHome">여러사람</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>
  <!—위로가기  링크 연결 —>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
 <!— ======= Footer End ======= —>
</body>
</html>