<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 내용 시작 -->
	<!--================객실목록================== -->
    <section class="ftco-section bg-light">
			<div class="container-fluid px-md-0">
				<div class="row no-gutters justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">

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
		<section style="height:30px;"></section>
		<!--================여행목록 시작================== -->
	    <section class="ftco-section ftco-services">
    	<div class="container">
    		<div class="row">
          <c:forEach var="trvboard" items="${trv_list}">
          <div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate">
            <div class="d-block services-wrap text-center">
              <div class="img" style="background-image: url(../travel/imageView.do?trv_num=${trvboard.trv_num}&trv_idx=1);"></div>
              <div class="media-body py-4 px-3">
                <h3 class="heading">${trvboard.trv_title}</h3>
                <p>
				<c:if test="${fn:length(trvboard.trv_intro)>40}">
					${fn:substring(trvboard.trv_intro,0,40)}...
				</c:if>
				</p>
                <p><a href="${pageContext.request.contextPath}/travel/detail.do?board_num=${trvboard.trv_num}" class="btn btn-primary">Read more</a></p>
              </div>
            </div>      
          </div>
          </c:forEach>
        </div>
    	</div>
    </section>
	<!--================여행목록 끝================== -->
    <section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 style="font-family:Malgun Gothic">공 지 사 항</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
			   <c:forEach var="notice" items="${notice_list}">
			   <div class="item">
                <div class="testimony-wrap d-flex">
                  <div class="user-img" style="background-image: url(../resources/template_res/images/face1.jpg)">
                  </div>
                  <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                    <p><a href="${pageContext.request.contextPath}/notice/detail.do?not_num=${notice.not_num}">
                    <c:if test="${fn:length(notice.not_content)>150}">
						<span style="color:gray;">${fn:substring(notice.not_content,0,150)}...</span>
					</c:if>
                    </a></p>
                    <p class="name"><a href="${pageContext.request.contextPath}/notice/detail.do?not_num=${notice.not_num}">${notice.not_title}</a></p>
                    <span class="position">
                    <c:if test="${notice.not_type == 1}">이벤트공지</c:if>
					<c:if test="${notice.not_type == 2}">이벤트발표</c:if>
					<c:if test="${notice.not_type == 3}">점검</c:if>
					<c:if test="${notice.not_type == 4}">고객공지</c:if>
                    </span>
                  </div>
                </div>
              </div>
              </c:forEach>
			</div>
          </div>
        </div>
      </div>
    </section>

<!-- 중앙 내용 끝 -->