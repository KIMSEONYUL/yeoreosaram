<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icia.common.util.StringUtil"%>
<%@ page import="com.icia.web.util.HttpUtil"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %> 

<body>
<%@ include file="/WEB-INF/views/include/teamNavigation.jsp" %>

    <!-- ======= Our Portfolio Section ======= -->
    <section id="portfolio" class="portfolio section-bg">
      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="section-title">
          <h2>JEJU</h2>
          <p>세계7대 자연경관을 자랑하는, 대한민국의 가장 큰 섬</p>
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
              <img src="/resources/images/jeju8.jpg" class="img-fluid" alt="">
              <div class="text">
              유채꽃밭
              </div>
            </div>  
              <div class="portfolio-info">
                <h4>유채꽃밭</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju8.jpg" data-gall="portfolioGallery" class="venobox" title="App 1"><i class="icofont-eye"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju-gogi.jpg" class="img-fluid" alt="">
              <div class="text">
              흑돼지
              </div>
            </div>
              <div class="portfolio-info">
                <h4>Web 3</h4>
                <p>Web</p>
                <div class="portfolio-links">
                  <a href="/resources/images/pig.jpg" data-gall="portfolioGallery" class="venobox" title="Web 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju1.jpg" class="img-fluid" alt="">
              <div class="text">
              한라산
              </div>
            </div>
              <div class="portfolio-info">
                <h4>App 2</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju1.jpg" data-gall="portfolioGallery" class="venobox" title="App 2"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju-miro.jpg" class="img-fluid" alt="">
              <div class="text">
              김녕 미로공원
              </div>
            </div>
              <div class="portfolio-info">
                <h4>입장료</h4>
                <p>성인 : 6,600<br>
                청소년 : 5,500 <br>
                어린이 : 4,400 <br>
                노인 : 5,500</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju-miro.jpg" data-gall="portfolioGallery" class="venobox" title="Card 2"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju-umu.png" class="img-fluid" alt="">
              <div class="text">
              우무
              </div>
            </div>>
              <div class="portfolio-info">
                <h4>Web 2</h4>
                <p>Web</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju-umu.png" data-gall="portfolioGallery" class="venobox" title="Web 2"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju2.jpg" class="img-fluid" alt="">
              <div class="text">
              사려니숲길
              </div>
            </div>
              <div class="portfolio-info">
                <h4>App 3</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju2.jpg" data-gall="portfolioGallery" class="venobox" title="App 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/aqua.jpg" class="img-fluid" alt="">
              <div class="text">
              아쿠아플라넷
              </div>
            </div>
              <div class="portfolio-info">
                <h4>입장료</h4>
                <p>성인 : 38,400<br>
                청소년 : 36,700 <br>
                어린이 : 34,900 <br>
                노인 : 36,700</p>
                <div class="portfolio-links">
                  <a href="/resources/images/aqua.jpg" data-gall="portfolioGallery" class="venobox" title="Card 1"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju-bae.png" class="img-fluid" alt="">
              <div class="text">
              투명카약체험
              </div>
            </div>
              <div class="portfolio-info">
                <h4>Card 3</h4>
                <p>Card</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju-bae.png" data-gall="portfolioGallery" class="venobox" title="Card 3"><i class="icofont-eye"></i></a>

                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
            <div class="image1">
              <img src="/resources/images/jeju-godeung.jpg" class="img-fluid" alt="">
              <div class="text">
              고등어회
              </div>
            </div>
              <div class="portfolio-info">
                <h4>Web 3</h4>
                <p>Web</p>
                <div class="portfolio-links">
                  <a href="/resources/images/jeju-godeung.jpg" data-gall="portfolioGallery" class="venobox" title="Web 3"><i class="icofont-eye"></i></a>

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