<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 

<body class="report">
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>

<style>
.bold
{
   font-weight: bold;
}
.box01{

 <!-- border:0; -->
 background-size: 50px;
 width:50px;
 height:50px;
}

.best
{
font-weight: bold;
}

.red
{
   color:red;
}

</style>

  <main id="main">
    <section class="section">
      <div class="container">
        <div class="row mb-4 align-items-center">
          <div class="col-md-6" data-aos="fade-up">

            <h1>GAPYEONG</h1>
            <h5 class="bold">대한민국 가평</h5>
            <br />
         <p>해외여행을 꿈꿔 보지만 시간상-여건상 해외여행을 갈 수 없을 때, <br />
            국내에서 만나볼 수 있는 유럽테마 여행지입니다.</p>
          </div>
        </div>
      </div>

      <div class="site-section pb-0">
        <div class="container">
          <div class="row align-items-stretch">
            <div class="col-md-8" data-aos="fade-up">
              <img src="/resources/images/ga2.png" alt="Image" class="img-fluid">
              <img src="/resources/images/gapyeong.png" alt="Image" class="img-fluid">
            </div>
            <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
              <div class="sticky-content">
                <h5 class="bold">쁘띠프랑스</h5>
                <p class="mb-4"><span class="text-muted">※(오전 9:00 ~ 오후 6:00) 연중무휴</span></p>

                <div class="mb-5">
                  <p>전통가옥, 마리오네트쇼, '어린왕자' 갤러리가 있는 <br>
                  <h class="red">한국의 프랑스 마을 입니다.</h></p>
                </div>

                <h5 class="bold">TIP</h5>
                <ul class="list-unstyled list-line mb-5">
                  <li>'쁘띠프랑스' 내부의 다양한 포토존을 활용 해 보세요!</li>
                  <li>'쁘띠프랑스' 에서는 어린이들을 위한 퍼레이드와 함께 전통인형극이 열립니다.</li>
                  <li>작지만 걷다 보면 큰 장소입니다. 충분한 여유를 갖고 즐겨주세요.</li>
                </ul>
                
                
                <h5 class="bold">아침고요수목원</h5>
                <p class="mb-4"><span class="text-muted">※토요일, 공휴일 오전 11시 ~ 오후 11시</span></p>
            <p class="mb-4"><span class="text-muted">※평일, 일요일 오전 11시 ~ 오후 9시</span></p>
                <div class="mb-5">
                  <p><h class="red">사계절마다 열리는 축제.</h><br>
                 살면서 힘들었던 무거운 짐들은 잠시 비운 후,<br>
                 수목원을 천천히 걸어보세요.</p>
                </div>
                
                <h5 class="bold">TIP</h5>
                <ul class="list-unstyled list-line mb-5">
                  <li>메인 사진의 축제 이름은 '오색별빛정원전'입니다.</li>
                  <li>'오색별빛정원전'은 주로 동절기에 열립니다. (12월 ~ 3월)</li>
                  <li>실물이 훨씬 예쁩니다. 관리자가 장담합니다.</li>
                </ul>
                <p><a href="https://www.youtube.com/results?search_query=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD+%EA%B0%80%ED%8F%89+%EC%97%AC%ED%96%89" class="readmore">Visit YOUTUBE</a></p>
              </div>
            </div>
          </div>
        </div>
    </section>

  </main><!-- End #main -->

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
   
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/vendor/php-email-form/validate.js"></script>
  <script src="/resources/vendor/aos/aos.js"></script>
  <script src="/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>

  <!— Template Main JS File  —>
  <script src="/resources/js/main.js"></script>

</body>
</html>