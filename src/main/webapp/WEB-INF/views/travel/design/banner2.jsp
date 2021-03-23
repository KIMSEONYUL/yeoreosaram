<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>수도권과 가까운 한옥 숙소</title>

<body class="report">
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>

   <div id="banner" class="container" data-aos="fade-up">
      <img class="bannerItem" src="/resources/images/hanBanner.jpg" class="image image-full" />
   </div>
   
 <!-- ======= Main Start ======= -->
  <main id="main">
    <section>
      <div class="container">
        <div class="row mb-4 align-items-center">
          <div class="col-md-6" data-aos="fade-up">
            <h2 class="aa">감성한옥, 서울 근처에도 있어요!</h2>
            <p>전주나 경주 같은 역사 도시로 떠나지 않더라도, 수도권과 가까운 곳에 낭만적인 시간을 보낼 수 있는 한옥 숙소가 많아요.</p>
            <p>하루쯤 머물면서, 여유로운 힐링 시간을 보낼 수 있는 예쁜 한옥을 여러사람이 소개합니다!</p>
          </div>
       </div>
      </div>

        <div class="container">
          <div class="row align-items-stretch">
            <div class="col-md-8" data-aos="fade-up">
              <img src="/resources/images/han1.jpg" alt="Image" class="img-fluid">
              <img src="/resources/images/han2.jpg" alt="Image" class="img-fluid">
              <img src="/resources/images/han3.jpg" alt="Image" class="img-fluid">
            </div>
            <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
              <div class="sticky-content">
                <h3 class="aa">송도 '경원재 앰배서더 인천'</h3>
                <p class="mb-4"><span class="text-muted">럭셔리한 한옥에서의 하룻밤</span></p>

                <div class="mb-5">
                  <p>송도 센트럴 파크에 자리한 5성급 호텔.<br>
                  디럭스 스위트 룸의 경우 드라마 [도깨비] 촬영지로 우명하며, 한식당 '수라' 에서는 궁중 요리를 맛볼 수 있습니다.</p>
                </div>

                <h4 class="h4 mb-3">숙박정보</h4>
                <ul class="list-unstyled list-line mb-5">
                  <li>위치 : 인천시 연수구</li>
                  <li>가격 : 평일 2인기준 디럭스 20만원대 중반</li>
                  <li>한복 & 전통 놀이 체험, 조식으로 한식 제공</li>
                </ul>
                
                
                 <h3 class="aa">양평 '천년초 한옥 펜션'</h3>
                <p class="mb-4"><span class="text-muted">즐길 거리가 다양한 한옥 펜션</span></p>

                <div class="mb-5">
                  <p>최소 2인, 최대 15인 규모의 객실을 보유해 커플부터 가족까지 이용하기에 좋습니다.</p>
                </div>

                <h4 class="h4 mb-3">숙박정보</h4>
                <ul class="list-unstyled list-line mb-5">
                  <li>위치 : 양평군 서종면</li>
                  <li>가격 : 평일 2인기준 온돌방 9만원대</li>
                  <li>야외 수영장, 미니 골프장, 족구장 이용 가능</li>
                </ul>
                
                 <h3 class="aa">대부도 '종이 미술관 한옥 펜션'</h3>
                <p class="mb-4"><span class="text-muted">가족 여행자에게 제격</span></p>

                <div class="mb-5">
                  <p>미술관과 함께 펜션을 운영 중.<br>
                  40 ~ 50 평의 넓은 규모를 자랑해 대가족 여행자들에게 인기입니다.</p>
                </div>

                <h4 class="h4 mb-3">숙박정보</h4>
                <ul class="list-unstyled list-line mb-5">
                  <li>위치 : 안산시 단원구</li>
                  <li>가격 : 평일 10인기준 일연재 30만원대 중반</li>
                  <li>종이 미술관 무료 관람, 전통놀이 체험 가능</li>
                </ul>  
               <p><a href="/mainHome" class="readmore">mainHome</a></p>
              </div>
           </div>
          </div>
        </div>
    </section>
  </main>
   <!— ======= Main End ======= —>

<!— ======= Footer ======= —>
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
  <!— 위로가기 링크 연결 —>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
 <!— ======= Footer End ======= —>
</body>
</html>