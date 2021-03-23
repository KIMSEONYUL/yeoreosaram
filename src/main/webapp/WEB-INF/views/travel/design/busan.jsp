<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 
<title>대한민국 제주</title>
<body>
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>

    <!-- ======= Our Portfolio Section ======= -->
    <section id="portfolio" class="portfolio section-bg">
      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="section-title">
             <h1 class="bold" style="color:black">BUSAN</h1>
            <h5 class="bold" style="color:black">대한민국 부산</h5>
          <p>대한민국 최대의 항구 도시로 2번째로 큰 도시, <br>
            다양한 풍경과 관광지가 많은 도시, <br>
            사투리-음식 등 독특한 개성과 야구-영화와 같은 대중문화에 열광하는 도시</p>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">볼거리</li>
              <li data-filter=".filter-card">놀거리</li>
              <li data-filter=".filter-web">먹거리</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
            
            <div class="image1">
              <img src="/resources/images/bu1.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp해동용궁사
              </div>
            </div>  
              <div class="portfolio-info">
                <h4>해동용궁사</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bu11.png" data-gall="portfolioGallery" class="venobox" title="App 1"><i class="icofont-eye"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bub1.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp&nbsp&nbsp&nbsp돼지국밥
              </div>
            </div>
              <div class="portfolio-info">
                <h4>돼지국밥</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bub11.png" data-gall="portfolioGallery" class="venobox" title="Web 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bu2.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp&nbsp더베이101
              </div>
            </div>
              <div class="portfolio-info">
                <h4>더베이101</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bu22.png" data-gall="portfolioGallery" class="venobox" title="App 2"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bum1.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp전포 카페거리
              </div>
            </div>
              <div class="portfolio-info">
                <h4>전포 카페거리</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bum11.png" data-gall="portfolioGallery" class="venobox" title="App 2"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bub2.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp&nbsp&nbsp조개구이
              </div>
            </div>>
              <div class="portfolio-info">
                <h4>조개구이</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bub22.png" data-gall="portfolioGallery" class="venobox" title="Web 2"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bu3.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp&nbsp감천문화마을
              </div>
            </div>
              <div class="portfolio-info">
                <h4>감천문화마을</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bu33.png" data-gall="portfolioGallery" class="venobox" title="App 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bum2.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp문화공감 수정
              </div>
            </div>
              <div class="portfolio-info">
                <h4>문화공감 수정</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bum22.png" data-gall="portfolioGallery" class="venobox" title="App 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bum3.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp아난티코브
              </div>
            </div>
              <div class="portfolio-info">
                <h4>아난티코브</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bum33.png" data-gall="portfolioGallery" class="venobox" title="Card 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/bub3.png" class="img-fluid" alt="">
              <div class="text">
              &nbsp&nbsp&nbsp&nbsp꼼장어구이
              </div>
            </div>
              <div class="portfolio-info">
                <h4>꼼장어구이</h4>
                <p></p>
                <div class="portfolio-links">
                  <a href="/resources/images/bub33.png" data-gall="portfolioGallery" class="venobox" title="Web 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Our Portfolio Section -->


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

  <!-- Template Main JS File -->
  <script src="/resources/hiassets/js/main.js"></script>
</body>
</html>