<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 추천</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travel.css" type="text/css">
</head>
<body>
<!-- 상단 부 -->
<div class="top_wrap clearfix">
	<h2><a onclick="location.href='list.do'">여기서 놀자</a></h2>
	<div class="top_right_box">
		<img src="${pageContext.request.contextPath}/resources/image/menu.JPG">
	</div>
</div>
<div class="visu_wrap visusub_02"></div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<div class="nav_wrap" id="nav_wrap">
	<div class="guide">
		<ul class="navigation">
		<hr>
			<li><a><img src="${pageContext.request.contextPath}/resources/image/home.JPG" width="20px" height="20px" onclick="location.href='main.do'"></a></li>		
			<li>여행소 추천지</li>
				<ul>
					<li><a onclick="location.href='ex.do'">관광지</a></li>
					<li><a onclick="location.href='ex.do'">박물관</a></li>
					<li><a onclick="location.href='ex.do'">음식점</a></li>
				</ul>
		</ul>
		<ul>
			<li><a title="페이스북 공유 새창열기" href="#a" onclick="SnsShare.fbShare(document.location.href); return false;"><img src="${pageContext.request.contextPath}/resources/image/facebook.JPG" alt="페이스북 공유"></a></li>
			<li><a title="트위터 공유 새창열기" href="#a" onclick="SnsShare.twShare(document.location.href); return false;"><img src="${pageContext.request.contextPath}/resources/image/twitter.JPG" alt="트위터 공유"></a></li>
			<li><a title="카카오스토리 공유 새창열기" href="#a" onclick="SnsShare.storyShare(document.location.href); return false;"><img src="${pageContext.request.contextPath}/resources/image/kakaostory.JPG" alt="카카오스토리 공유"></a></li>
		</ul>
	</div>
</div>
<hr>
<div class="sub_tit">
	<h2>전쟁기념박물관</h2>
	<p>전쟁기념관은 대한민국 서울특별시 용산구 이태원로 29 에 위치한 기념관으로, 대한민국을 지켜온 항쟁과 전쟁에 대한 기록을 모으고 보존하는 곳이다.</p>
</div>
<div class="guide">
        <div class="sub_tab sub_tab2 clearfix">
        </div>
</div>
    
    <!-- 중간 부 -->
    <!--게시글 목록 -->
<div class="list_wrap">
	<div class="search_wrap">
		<p>Page<span> 1 / 1</span></p>
	</div>
	<div class="search_box">
		<div>
			<label for="key">제목</label>
            <input type="text" name="key" id="key" value="" placeholder="검색어를 입력하세요.">
		</div>
	</div>
	<div class="gall_board">
		<ul>
		<!-- 첫번째 게시글 -->
			<li>
				<a onclick="location.href='ex)page1.do'">
				<div class="img_box">
                     <div class="inner_box">
						<img src="${pageContext.request.contextPath}/resources/trv_image/warn.JPG"
							 width="400px" height="230px" alt="전쟁기념박물관">
                     </div>
                  </div>
                  <h3>전쟁기념박물관</h3>
                  <h5>한반도 최초의 인류가 살았던 연천 전곡리 유적에서 펼쳐지는 선사 체험 축제입니다.
                  	     우리는 연천 전곡리에서 구석기시대부터 살았던 인류를 “전곡리안”이라고 부릅니다
                                                  연천 전곡리 유적은 30만년전에 우리나라에 매우 똑똑한 구석기 사람 “전곡리안” 살았다는 증거인 주먹</h5>
                  <p><span>지역</span><b>연천</b></p>
               </a>
			</li>
		<!-- 두번째 게시글 -->
			<li>
				<a onclick="location.href='ex)page1.do'">
				<div class="img_box">
                     <div class="inner_box">
						<img src="${pageContext.request.contextPath}/resources/trv_image/warn.JPG"
							 width="400px" height="230px" alt="전쟁기념박물관">
                     </div>
                  </div>
                  <h3>전쟁기념박물관</h3>
                  <h5>한반도 최초의 인류가 살았던 연천 전곡리 유적에서 펼쳐지는 선사 체험 축제입니다.
                  	     우리는 연천 전곡리에서 구석기시대부터 살았던 인류를 “전곡리안”이라고 부릅니다
                                                  연천 전곡리 유적은 30만년전에 우리나라에 매우 똑똑한 구석기 사람 “전곡리안” 살았다는 증거인 주먹</h5>
                  <p><span>지역</span><b>연천</b></p>
               </a>
			</li>
		<!-- 
			.
			.
			.
			.
			.
			총 16번째 게시글 -->
		</ul>
	</div>
	<!-- 하단 부 -->
	<!-- 페이징 처리 -->
	<div class="paging_wrap">
		<div class="pageview">
      		<a title="처음" href="" class="page_btn prev"><i class="xi-angle-left-thin"></i><i class="xi-angle-left-thin"></i><span>처음</span></a>
      		<a title="이전" href="" class="page_btn"><i class="xi-angle-left-thin"></i><span>이전</span></a>
      		<a title="현재페이지" href="" class="active">1</a>
      		<a title="다음" href="" class="page_btn next"><i class="xi-angle-right-thin"></i><span>다음</span></a>
      		<a title="마지막" href="" class="page_btn finish"><i class="xi-angle-right-thin"></i><i class="xi-angle-right-thin"></i><span>마지막</span></a>
   		</div>
	</div>
</div>
</body>
</html>