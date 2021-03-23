<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<% %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 
<title>여러사람</title>
<body>
   <%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>
<!-- ======= Main Start ======= -->
   <main class="main">
   <div class="name">
<!-- ======= 목차 Start======= -->
    <section class="section">
      <div class="container">
        <div class="row mb-50 align-items-center">
          <div class="col-md-12 text-center" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="#" data-filter="*" class="active">여러사람</a>
              <a href="#" data-filter=".travel">추천여행지</a>
              <a href="#" data-filter=".use">사용방법</a>
            </div>
          </div>
        </div>
      <hr/>
      
<!-- ======= 목차 End======= --> 
     
<!-- ======= 지역 card Start ======= -->
<%
   if(com.icia.web.util.CookieUtil.getCookie(request, (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)
   {
%>
<div class="text-center">
   <h4 style="color: black; display : inline-block;"><c:out value="${user2.userName2}" /></h4>
   <h4 style="display : inline-block;">님 어디로 떠나볼까요?</h4>
   <br/>
</div>
 <%
   }else {
 %>
 <div class="text-center"><h3>환영합니다! 로그인 후 여러사람과 함께 여행을 시작해보세요!</h3></div>
 <%
}
 %>
      <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">  
          <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/jeju" class="item-wrap fancybox">
              <div class="work-info">
                <h3>제주</h3>
                <span>#JEJU</span>
              </div>
              <img class="img-fluid" src="/resources/images/jeju.png">
            </a>
          </div>
          
          <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/busan" class="item-wrap fancybox">
              <div class="work-info">
                <h3>부산</h3>
                <span>#BUSAN</span>
              </div>
              <img class="img-fluid" src="/resources/images/busan.png">
            </a>
          </div>
         
          
          <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/gapyeong" class="item-wrap fancybox">
              <div class="work-info">
                <h3>가평</h3>
                <span>#GAPYEOG</span>
              </div>
              <img class="img-fluid" src="/resources/images/gapyeong.png">
            </a>
          </div>
          
                    <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/incheon" class="item-wrap fancybox">
              <div class="work-info">
                <h3>인천</h3>
                <span>#INCHEON</span>
              </div>
              <img class="img-fluid" src="/resources/images/incheon.png">
            </a>
          </div>

          <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/gyeongju" class="item-wrap fancybox">
              <div class="work-info">
                <h3>경주</h3>
                <span>#GYEONGJU</span>
              </div>
              <img class="img-fluid" src="/resources/images/gyeongju.png">
            </a>
          </div>
          
         <div class="item travel col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/seoul" class="item-wrap fancybox">
              <div class="work-info">
                <h3>서울</h3>
                <span>#SEOUL</span>
              </div>
              <img class="img-fluid" src="/resources/images/seoul.png">
            </a>
          </div>
<!-- ======= 지역 card End ======= -->

<!-- ======= 사이트 이용방법 Start ======= -->
          <div class="item use col-sm-6 col-md-4 col-lg-4 mb-4">
            <a class="item-wrap fancybox">
              <div class="work-info">
                <h3>발견</h3>
                <br>
                <span>#가고 싶은 여행장소들을 발견해 보세요.</span>
                <br/>
                <span>TIP: 나만의 여행지 </span>
              </div>
              <p class="imgp"><img class="img-fluid" src="/resources/images/aa.png" width="200" height="200"></p>
            </a>
            </div>
            
            <div class="item use col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/travel/design/useMethod" class="item-wrap fancybox">
             <div class="work-info">
                <h3>이용방법</h3>
                <br>
                <span>#처음오신분들을 위한 자세한 설명</span><br>
             </div>
             <p class="imgp"><img class="img-fluid" src="/resources/images/bb.png" width="200" height="200"></p>
            </a>
            </div>
            
            <div class="item use col-sm-6 col-md-4 col-lg-4 mb-4">
              <a class="item-wrap fancybox">
             <div class="work-info">
                <h3>지도보기</h3>
                <br>
                <span>#나만의 여행 장소들을 확인해보세요.</span><br>
             </div>
             <p class="imgp"><img class="img-fluid" src="/resources/images/cc.png" width="200" height="200"></p>
            </a>
          </div>
        </div>
      </div>
    </section>
<!-- ======= 사이트 이용방법 End ======= -->

<!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="container">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">
        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url('/resources/images/hanBanner.jpg');">
            <div class="carousel-container">
              <div class="carousel-content container">
                <h2 class="animate__animated animate__fadeInDown"><span>서울 근처 감성 한옥</span></h2>
                <p class="animate__animated animate__fadeInUp">수도권에서 가까운 한옥 숙소 모음</p>
                <a href="/travel/design/banner2" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url('/resources/images/driveBanner.jpg');">
            <div class="carousel-container">
              <div class="carousel-content container">
                <h2 class="animate__animated animate__fadeInDown">쉬는 날 가기 좋은 당일치기 드라이브 코스 <span>4</span></h2>
                <p class="animate__animated animate__fadeInUp">수도권에서 멀지 않은 곳들만 모았어요. <br/>국내의 다채로운 드라이브 코스를 소개합니다!</p>
                <a href="/travel/design/banner1" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon icofont-rounded-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon icofont-rounded-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>  
      </div>
    </div>
  </section>
<!-- ======= Hero End ======= -->
  </div>
  </main>
<!-- ======= Main End ======= -->
   
<!-- ======= Footer ======= -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright travel 2021</p>
          <div class="credits">
            Designed by <a href="/admin/adminHome">yeoreosaram</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>
<!-- 위로가기 링크 연결 -->  
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
<!-- ======= Footer End ======= -->

  <!-- Vendor JS Files -->
  <script src="/resources/hiassets/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/hiassets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/hiassets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/hiassets/vendor/php-email-form/validate.js"></script>
  <script src="/resources/hiassets/vendor/jquery-sticky/jquery.sticky.js"></script>
  <script src="/resources/hiassets/vendor/venobox/venobox.min.js"></script>
  <script src="/resources/hiassets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/resources/hiassets/vendor/counterup/counterup.min.js"></script>
  <script src="/resources/hiassets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/resources/hiassets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/hiassets/vendor/aos/aos.js"></script>

  <!— Template Main JS File —>
  <script src="/resources/hiassets/js/main.js"></script>
</body>
</html>