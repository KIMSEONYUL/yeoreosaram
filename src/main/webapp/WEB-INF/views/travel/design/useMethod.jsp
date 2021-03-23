<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 
<title>이용방법</title>
<body class="report">
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>

  <main id="main">
    <section class="section">
      <div class="container">
        <div class="row mb-4 align-items-center">
          <div class="col-md-6" data-aos="fade-up">
            <h2 class="aa">이용방법</h2>
            <p>나의 여행을 쉽게 만들어 보세요!</p>
            <p>STEP 과정을 따라서 쉽게 사용법 익히기~</p>
          </div>
        </div>
      </div>

      <div class="site-section pb-0">
        <div class="container">
          <div class="row align-items-stretch">
            <div class="col-md-8" data-aos="fade-up">
              <p><h3 class="aa">step1</h3></p>
              <p class="aa">------------------------------------------------------------------------------------</p>
              <br>
              <img src="/resources/images/step1.png" alt="Image" class="img-fluid"><br><br><br><br><br><br>
              <p><h3 class="aa">step2</h3></p>
              <p class="aa">------------------------------------------------------------------------------------</p>
              <br>
              <img src="/resources/images/step2.png" alt="Image" class="img-fluid">
              <p><h3 class="aa">step3</h3></p>
              <p class="aa">------------------------------------------------------------------------------------</p>
              <br>
           
              <img src="/resources/images/step3.png" alt="Image" class="img-fluid"><br><br>
              <p><h3 class="aa">step4</h3></p>
              <p class="aa">------------------------------------------------------------------------------------</p>
              <br>
              <img src="/resources/images/step4.png" alt="Image" class="img-fluid"><br><br>
              <p><h3 class="aa">step5</h3></p>
              <p class="aa">------------------------------------------------------------------------------------</p>
              <br>
              <img src="/resources/images/step5.png" alt="Image" class="img-fluid"><br><br>
              <p><h3 class="aa">step6</h3></p>
              <p class="aa">------------------------------------------------------------------------------------</p>
              <br>
              <img src="/resources/images/step6.png" alt="Image" class="img-fluid"><br><br>
            </div>
            <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
             
                <br><br>
                
                <div class="mb-5">
                  <p><h3 class="aa">STEP 1 여행계획짜기</h3></p>
                  <p>일정만들기를 클릭 후 날짜를 선택해보세요!</p>
                </div>
<br><br><br><br><br><br><br><br>
                <div class="mb-5">
                  <p><h3 class="aa">STEP 2 날짜선택</h3></p>
                  <p>내가 가고 싶은 날짜를 선택해보세요!</p>
                  <p style="text-decoration:underline">(최대 10일까지 선택가능합니다.)</p>
                </div>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>                
                <div class="mb-5">
                  <p><h3 class="aa">STEP 3 여행장소선택</h3></p>
                  <p>내가 가고싶은 날을(1번) 선택 후 
                     가고싶은 장소(2번)를 선택해주세요.</p>
                  <p>가고싶은 날짜에 장소를 선택하셨다면
                     나의 일정을 저장(3번)해보세요!</p>
                </div>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <div class="mb-5">
                  <p><h3 class="aa">STEP 4 나의일정확인</h3></p>
                  <p>내가 선택한 날짜와 일정을 확인해보세요.</p>
                  <p>일정을 공유하고 싶다면 1번을 클릭하여 여러사람과 공유해보세요!</p>
                </div>
 <br><br><br><br><br>
                <div class="mb-5">
                  <p><h3 class="aa">STEP 5 일정공유</h3></p>
                  <p>일정게시물을 등록하여 공유해보세요.</p>
                </div>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>               
                <div class="mb-5">
                  <p><h3 class="aa">STEP 6 최종</h3></p>
                  <p>공유한 나의 일정에 대하여 다른사람의 생각을 들어보아요!</p>
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

  <!— Template Main JS File —> 
  <script src="/resources/js/main.js"></script>

</body>
</html>