<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 내용 시작 -->
	<!--================객실목록================== -->
    <section class="ftco-section bg-light">
			<div class="container-fluid px-md-0">
				<div class="row no-gutters justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>숙소 목록</h2>
          </div>
        </div>
				<div class="row no-gutters">
				<!-- 내용 시작 -->
				<c:forEach var="accommdation" items="${acc_list}" varStatus="status">
	    			<div class="col-lg-6">
	    				<div class="room-wrap d-md-flex">
	    					<!-- 이미지 -->
	    					<a href="../accommdation/acc_list/detail.do?acc_num=${accommdation.acc_num}" 
	    					<c:if test="${status.count<3}">class="img"</c:if>
	    					<c:if test="${status.count>=3}">class="img order-md-last"</c:if>
	    					>
	    						<img src="../accommdation/imageView.do?acc_num=${accommdation.acc_num}&acc_idx=1" style="width: 100%; height: 100%;">
	    					</a>
							<div class="half left-arrow d-flex align-items-center">
	    						<div class="text p-4 p-xl-5 text-center">
	    							<!-- 별점 -->
	    							<p class="star mb-0"><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span></p>
		    						<h3 class="mb-3"><a href="../accommdation/acc_list/detail.do?acc_num=${accommdation.acc_num}">${accommdation.acc_name}</a></h3>
		    						<ul class="list-accomodation">
		    							<li><span>카테고리</span> <c:if test="${accommdation.acc_category == 1}">
																	호텔
																</c:if>
																<c:if test="${accommdation.acc_category == 2}">
																	모텔
																</c:if>
																<c:if test="${accommdation.acc_category == 3}">
																	게스트하우스
																</c:if>
										</li>
		    							<li><span> 전화번호 </span> ${accommdation.acc_tel}</li>
		    							<li><span> 주소 </span> ${accommdation.acc_address}</li>
		    							<li><span> 최저가 </span> ${accommdation.acc_rowprice}</li>
		    						</ul>
		    						<p class="pt-1"><a href="../accommdation/acc_list/detail.do?acc_num=${accommdation.acc_num}" class="btn-custom px-3 py-2">View Room Details <span class="icon-long-arrow-right"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    				</div>
    			</div>
		</section>

	<!--================객실목록 끝================== -->
		<section style="height:80px;"></section>
	    <section class="ftco-section ftco-services">
    	<div class="container">
    		<div class="row">
          <div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate">
            <div class="d-block services-wrap text-center">
              <div class="img" style="background-image: url(../resources/template_res/images/services-1.jpg);"></div>
              <div class="media-body py-4 px-3">
                <h3 class="heading">Map Direction</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
                <p><a href="#" class="btn btn-primary">Read more</a></p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate">
            <div class="d-block services-wrap text-center">
              <div class="img" style="background-image: url(../resources/template_res/images/services-2.jpg);"></div>
              <div class="media-body py-4 px-3">
                <h3 class="heading">Accomodation Services</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
                <p><a href="#" class="btn btn-primary">Read more</a></p>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate">
            <div class="d-block services-wrap text-center">
              <div class="img" style="background-image: url(../resources/template_res/images/services-3.jpg);"></div>
              <div class="media-body py-4 px-3">
                <h3 class="heading">Great Experience</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
                <p><a href="#" class="btn btn-primary">Read more</a></p>
              </div>
            </div>      
          </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>Happy Clients &amp; Feedbacks</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
							<div class="item">
                <div class="testimony-wrap d-flex">
                  <div class="user-img" style="background-image: url(../resources/template_res/images/person_1.jpg)">
                  </div>
                  <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Racky Henderson</p>
                    <span class="position">Father</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap d-flex">
                  <div class="user-img" style="background-image: url(../resources/template_res/images/person_2.jpg)">
                  </div>
                  <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Henry Dee</p>
                    <span class="position">Businesswoman</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap d-flex">
                  <div class="user-img" style="background-image: url(../resources/template_res/images/person_3.jpg)">
                  </div>
                  <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Mark Huff</p>
                    <span class="position">Businesswoman</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap d-flex">
                  <div class="user-img" style="background-image: url(../resources/template_res/images/person_4.jpg)">
                  </div>
                  <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Rodel Golez</p>
                    <span class="position">Businesswoman</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap d-flex">
                  <div class="user-img" style="background-image: url(../resources/template_res/images/person_1.jpg)">
                  </div>
                  <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Ken Bosh</p>
                    <span class="position">Businesswoman</span>
                  </div>
                </div>
              </div>
						</div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-6 wrap-about">
						<div class="img img-2 mb-4" style="background-image: url(../resources/template_res/images/about.jpg);">
						</div>
						<h2>The most recommended vacation rental</h2>
						<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					</div>
					<div class="col-md-6 wrap-about ftco-animate">
	          <div class="heading-section">
	          	<div class="pl-md-5">
		            <h2 class="mb-2">What we offer</h2>
	            </div>
	          </div>
	          <div class="pl-md-5">
							<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
							<div class="row">
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-diet"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Tea Coffee</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div> 
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-workout"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Hot Showers</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div>
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-diet-1"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Laundry</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div>      
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-first"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Air Conditioning</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div>
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-first"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Free Wifi</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div> 
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-first"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Kitchen</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div> 
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-first"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Ironing</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div> 
		            <div class="services-2 col-lg-6 d-flex w-100">
		              <div class="icon d-flex justify-content-center align-items-center">
		            		<span class="flaticon-first"></span>
		              </div>
		              <div class="media-body pl-3">
		                <h3 class="heading">Lovkers</h3>
		                <p>A small river named Duden flows by their place and supplies it with the necessary</p>
		              </div>
		            </div>
		          </div>  
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="ftco-intro" style="background-image: url(../resources/template_res/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9 text-center">
						<h2>Ready to get started</h2>
						<p class="mb-4">Itâs safe to book online with us! Get your dream stay in clicks or drop us a line with your questions.</p>
						<p class="mb-0"><a href="#" class="btn btn-primary px-4 py-3">Book now</a> <a href="#" class="btn btn-white px-4 py-3">Contact us</a></p>
					</div>
				</div>
			</div>
		</section>

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>Latest news from our blog</h2>
            <span class="subheading">News &amp; Blog</span>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20 rounded" style="background-image: url('../resources/template_res/images/image_1.jpg');">
              </a>
              <div class="text p-4 text-center">
                <h3 class="heading"><a href="#">Work Hard, Party Hard in a Luxury Chalet in the Alps</a></h3>
                <div class="meta mb-2">
                  <div><a href="#">January 30, 2020</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                </div>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20 rounded" style="background-image: url('../resources/template_res/images/image_2.jpg');">
              </a>
              <div class="text p-4 text-center">
                <h3 class="heading"><a href="#">Work Hard, Party Hard in a Luxury Chalet in the Alps</a></h3>
                <div class="meta mb-2">
                  <div><a href="#">January 30, 2020</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                </div>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="blog-single.html" class="block-20 rounded" style="background-image: url('../resources/template_res/images/image_3.jpg');">
              </a>
              <div class="text p-4 text-center">
                <h3 class="heading"><a href="#">Work Hard, Party Hard in a Luxury Chalet in the Alps</a></h3>
                <div class="meta mb-2">
                  <div><a href="#">January 30, 2020</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                </div>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- 중앙 내용 끝 -->