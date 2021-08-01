<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="resources/assets/css/templatemo-space-dynamic.css">
<link rel="stylesheet" href="resources/assets/css/animated.css">
<link rel="stylesheet" href="resources/assets/css/owl.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function popupCenter(href, w, h) {
		var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
		var yPos = (document.body.offsetHeight/2) - (h/2);
		window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
	}
</script>
<script type="text/javascript">
$(function() {
	//var floatPosition = parseInt($("quick_menu").css('top'));
	$(window).scroll(function () {  //브라우저에 스크롤이 발생하는 순간부터
        var curpos = $(window).scrollTop()+200; //스크롤바의 상단 위치값+20 보관
        $(".quick_menu").stop().animate({"top":curpos}); //스카이메뉴의 상단위치값 애니
     }); 
});
</script>
<!--  CSS style sheet -->
<style type="text/css">

.quick_menu{
background: white;
position:absolute;
width:100px;
top:150px;   /* window start -side bar position */
right:10px;
z-index : 9999; /* 해당 요소 맨앞으로 가져오기  */
}
 </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<jsp:include page="header.jsp" />
	<!-- ***** Header Area End ***** -->
	
	
	<div class="main-banner wow fadeIn" id="top" data-wow-duration="1s"
		data-wow-delay="0.5s">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-6 align-self-center">
							<div class="left-content header-text wow fadeInLeft"
								data-wow-duration="1s" data-wow-delay="1s">
								<h6>BONAPPETIT 여름학기</h6>
								<h2>
									온라인 클래스로 <br>
									<em>한식부터</em> <span>홈베이킹까지</span> <br>준비된 강의
								</h2>
								<p>요리를 위한 재료를 준비하고 레시피를 만드는 것 부터 수업을 준비하는 과정입니다. 모두가 즐거운 요리를
									경험하는 시간, 한 그릇의 음식이 주는 특별한 행복을 전달해드립니다.</p>
								<form id="search" action="#" method="GET">
									<fieldset>
										<input type="search" name="text" class="email"
											placeholder="오늘 뭐 먹지?" autocomplete="on" required>
									</fieldset>
									<fieldset>
										<button type="submit" class="main-button">검색</button>
									</fieldset>
								</form>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="right-image wow fadeInRight" data-wow-duration="1s"
								data-wow-delay="0.5s">
								<div class="container mt-3">
									<h2>NEW!</h2>
									<div id="myCarousel" class="carousel_slide"
										data-ride="carousel">
										<!-- Indicators -->
										<ul class="carousel-indicators">
											<li data-target="#myCarousel" data-slide-to="0"
												class="active"></li>
											<li data-target="#myCarousel" data-slide-to="1"></li>
											<li data-target="#myCarousel" data-slide-to="2"></li>
										</ul>
										<!-- The slideshow -->
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img src="resources/assets/images/main001.png" alt=""
													width="1100" height="500">
											</div>
											<div class="carousel-item">
												<img src="resources/assets/images/main002.png" alt=""
													width="1100" height="500">
											</div>
											<div class="carousel-item">
												<img src="resources/assets/images/main003.png" alt=""
													width="1100" height="500">
											</div>
										</div>
										<!-- Left and right controls -->
										<a class="carousel-control-prev" href="#myCarousel"
											data-slide="prev"> <span
											class="carousel-control-prev-icon"></span>
										</a> <a class="carousel-control-next" href="#myCarousel"
											data-slide="next"> <span
											class="carousel-control-next-icon"></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!--  sidebar -quick -menu ******************* -->
	<div style="height:800px; right-padding:20%" class="quick_menu">
		<ul>  <!--  class="bi bi-headphones"  alt="headphones" style="font-size: 2rem;"  : 글자가 같이 커짐-->
			<li width="60" height="60" ><a href="chatlogin.do"><img src="resources/assets/images/sidebar1.png" width="100" alt=""></a></li> <br>
			<li><a href="kitchenmap.do"><img src="resources/assets/images/sidebar2.png" width="100" alt=""></a></li><br>
			<li><a href="#" onclick="popupCenter('recipe.do', '620', '680')"><br><img src="resources/assets/images/sidebar3.png" width="100" alt=""></a></li><br>
			<li><a href="machine.do"><img src="resources/assets/images/sidebar4.png" width="100" alt=""></a></li>
		</ul>
	</div>




	<div id="portfolio" class="our-portfolio section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-heading  wow bounceIn" data-wow-duration="1s"
						data-wow-delay="0.2s">
						<h2>
							BONAPPETIT의 자신감<br> <em>스타강사</em> 1:1 <span>프리미엄 클래스</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<a href="">
						<div class="item wow bounceInUp" data-wow-duration="1s"
							data-wow-delay="0.3s">
							<div class="hidden-content">
								<h4>한식 전문가</h4>
								<p>갓 지은 밥, 보글보글 찌개, 고소한 나물 등 반상차림 하나로 한식의 매력을 알려드립니다!</p>
							</div>
							<div class="showed-content">
								<img src="resources/assets/images/portfolio-image1.png" alt="">
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-sm-6">
					<a href="">
						<div class="item wow bounceInUp" data-wow-duration="1s"
							data-wow-delay="0.5s">
							<div class="hidden-content">
								<h4>Performance Tests</h4>
								<p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
							</div>
							<div class="showed-content">
								<img src="resources/assets/images/portfolio-image2.png" alt="">
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-sm-6">
					<a href="">
						<div class="item wow bounceInUp" data-wow-duration="1s"
							data-wow-delay="0.6s">
							<div class="hidden-content">
								<h4>Data Analysis</h4>
								<p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
							</div>
							<div class="showed-content">
								<img src="resources/assets/images/portfolio-image3.png" alt="">
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-sm-6">
					<a href="">
						<div class="item wow bounceInUp" data-wow-duration="1s"
							data-wow-delay="0.6s">
							<div class="hidden-content">
								<h4>Data Analysis</h4>
								<p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p>
							</div>
							<div class="showed-content">
								<img src="resources/assets/images/portfolio-image4.png" alt="">
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 
	<div id="about" class="about-us section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="left-image wow fadeIn" data-wow-duration="1s"
						data-wow-delay="0.2s">
						<img src="resources/assets/images/about-left-image.png"
							alt="person graphic">
					</div>
				</div>
				<div class="col-lg-8 align-self-center">
					<div class="services">
						<div class="row">
							<div class="col-lg-6">
								<div class="item wow fadeIn" data-wow-duration="1s"
									data-wow-delay="0.5s">
									<div class="icon">
										<img src="resources/assets/images/service-icon-01.png"
											alt="reporting">
									</div>
									<div class="right-text">
										<h4>Data Analysis</h4>
										<p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing
											eliter</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="item wow fadeIn" data-wow-duration="1s"
									data-wow-delay="0.7s">
									<div class="icon">
										<img src="resources/assets/images/service-icon-02.png" alt="">
									</div>
									<div class="right-text">
										<h4>Data Reporting</h4>
										<p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing
											eliter</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="item wow fadeIn" data-wow-duration="1s"
									data-wow-delay="0.9s">
									<div class="icon">
										<img src="resources/assets/images/service-icon-03.png" alt="">
									</div>
									<div class="right-text">
										<h4>Web Analytics</h4>
										<p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing
											eliter</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="item wow fadeIn" data-wow-duration="1s"
									data-wow-delay="1.1s">
									<div class="icon">
										<img src="resources/assets/images/service-icon-04.png" alt="">
									</div>
									<div class="right-text">
										<h4>SEO Suggestions</h4>
										<p>Lorem ipsum dolor sit amet, ctetur aoi adipiscing
											eliter</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="services" class="our-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 align-self-center  wow fadeInLeft"
					data-wow-duration="1s" data-wow-delay="0.2s">
					<div class="left-image">
						<img src="resources/assets/images/services-left-image.png" alt="">
					</div>
				</div>
				<div class="col-lg-6 wow fadeInRight" data-wow-duration="1s"
					data-wow-delay="0.2s">
					<div class="section-heading">
						<h2>
							Grow your website with our <em>SEO</em> service &amp; <span>Project</span>
							Ideas
						</h2>
						<p>Space Dynamic HTML5 template is free to use for your
							website projects. However, you are not permitted to redistribute
							the template ZIP file on any CSS template collection websites.
							Please contact us for more information. Thank you for your kind
							cooperation.</p>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="first-bar progress-skill-bar">
								<h4>Website Analysis</h4>
								<span>84%</span>
								<div class="filled-bar"></div>
								<div class="full-bar"></div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="second-bar progress-skill-bar">
								<h4>SEO Reports</h4>
								<span>88%</span>
								<div class="filled-bar"></div>
								<div class="full-bar"></div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="third-bar progress-skill-bar">
								<h4>Page Optimizations</h4>
								<span>94%</span>
								<div class="filled-bar"></div>
								<div class="full-bar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div id="blog" class="our-blog section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 wow fadeInDown" data-wow-duration="1s"
					data-wow-delay="0.25s">
					<div class="section-heading">
						<h2>
							Check Out What Is <em>Trending</em> In Our Latest <span>News</span>
						</h2>
					</div>
				</div>
				<div class="col-lg-6 wow fadeInDown" data-wow-duration="1s"
					data-wow-delay="0.25s">
					<div class="top-dec">
						<img src="resources/assets/images/blog-dec.png" alt="">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 wow fadeInUp" data-wow-duration="1s"
					data-wow-delay="0.25s">
					<div class="left-image">
						<a href="#"><img
							src="resources/assets/images/big-blog-thumb.jpg"
							alt="Workspace Desktop"></a>
						<div class="info">
							<div class="inner-content">
								<ul>
									<li><i class="fa fa-calendar"></i> 24 Mar 2021</li>
									<li><i class="fa fa-users"></i> TemplateMo</li>
									<li><i class="fa fa-folder"></i> Branding</li>
								</ul>
								<a href="#"><h4>SEO Agency &amp; Digital Marketing</h4></a>
								<p>Lorem ipsum dolor sit amet, consectetur and sed doer ket
									eismod tempor incididunt ut labore et dolore magna...</p>
								<div class="main-blue-button">
									<a href="#">Discover More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 wow fadeInUp" data-wow-duration="1s"
					data-wow-delay="0.25s">
					<div class="right-list">
						<ul>
							<li>
								<div class="left-content align-self-center">
									<span><i class="fa fa-calendar"></i> 18 Mar 2021</span> <a
										href="#"><h4>New Websites &amp; Backlinks</h4></a>
									<p>Lorem ipsum dolor sit amsecteturii and sed doer ket
										eismod...</p>
								</div>
								<div class="right-image">
									<a href="#"><img
										src="resources/assets/images/blog-thumb-01.jpg" alt=""></a>
								</div>
							</li>
							<li>
								<div class="left-content align-self-center">
									<span><i class="fa fa-calendar"></i> 14 Mar 2021</span> <a
										href="#"><h4>SEO Analysis &amp; Content Ideas</h4></a>
									<p>Lorem ipsum dolor sit amsecteturii and sed doer ket
										eismod...</p>
								</div>
								<div class="right-image">
									<a href="#"><img
										src="resources/assets/images/blog-thumb-01.jpg" alt=""></a>
								</div>
							</li>
							<li>
								<div class="left-content align-self-center">
									<span><i class="fa fa-calendar"></i> 06 Mar 2021</span> <a
										href="#"><h4>SEO Tips &amp; Digital Marketing</h4></a>
									<p>Lorem ipsum dolor sit amsecteturii and sed doer ket
										eismod...</p>
								</div>
								<div class="right-image">
									<a href="#"><img
										src="resources/assets/images/blog-thumb-01.jpg" alt=""></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	 
  <div id="contact" class="contact-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center wow fadeInLeft" data-wow-duration="0.5s" data-wow-delay="0.25s">
          <div class="section-heading">
            <h2>Feel Free To Send Us a Message About Your Website Needs</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doer ket eismod tempor incididunt ut labore et dolores</p>
            <div class="phone-info">
              <h4>For any enquiry, Call Us: <span><i class="fa fa-phone"></i> <a href="#">010-020-0340</a></span></h4>
            </div>
          </div>
        </div>
        <div class="col-lg-6 wow fadeInRight" data-wow-duration="0.5s" data-wow-delay="0.25s">
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-lg-6">
                <fieldset>
                  <input type="name" name="name" id="name" placeholder="Name" autocomplete="on" required>
                </fieldset>
              </div>
              <div class="col-lg-6">
                <fieldset>
                  <input type="surname" name="surname" id="surname" placeholder="Surname" autocomplete="on" required>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email" required="">
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <textarea name="message" type="text" class="form-control" id="message" placeholder="Message" required=""></textarea>  
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="main-button ">Send Message</button>
                </fieldset>
              </div>
            </div>
            <div class="contact-dec">
              <img src="resources/assets/images/contact-decoration.png" alt="">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
-->

<jsp:include page="footer.jsp" />


	<!-- Scripts -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/js/owl-carousel.js"></script>
	<script src="resources/assets/js/animation.js"></script>
	<script src="resources/assets/js/imagesloaded.js"></script>
	<script src="resources/assets/js/templatemo-custom.js"></script>
	
   
   

</body>
</html>