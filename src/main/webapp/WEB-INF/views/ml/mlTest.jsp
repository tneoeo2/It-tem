<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script>
	document.title = "당신이 원하는 !t Tem";
</script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/tab.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/resources/vendor/simple-line-icons/css/simple-line-icons.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli"
	rel="stylesheet">
<!-- Plugin CSS -->
<link rel="stylesheet"
	href="/resources/device-mockups/device-mockups.min.css">

<!-- Custom styles for this template -->
<link href="/resources/css/new-age.min.css" rel="stylesheet">




<style type="text/css">
.mb-20 {
	font-size: 1em;
}

.section-heading button {
	margin-bottom: 2vw;
}

#result-wrap {
	display: flex;
	justify-content: space-around;
}

#webcam-wrap {
	display: flex;
	justify-content: center;
}

#webcam-container {
	width: 400px;
	height: 400px;
	border: solid gray;
	background-color: gray;
	opacity: 80%;
	transform: translateX(4.49vw);
}

#label-container {
	color: black;
	display: flex;
	text-align: left;
	flex-direction: column;
	justify-content: space-evenly;
	transform: translateX(16px);
}

#download {
	position: relative;
	min-height: 80vh;
	padding: 33px 0 160px 0;
}

.tab {
	list-style: none;
	padding: 0;
	overflow: hidden;
}

.tab li { /* 탭 왼쪽 정렬 */
	float: left;
}

.tab li a {
	display: inline-block;
	color: black;
	text-algin: center;
	text-decoratoin: none;
	padding: 14px 16px;
	font-size: 17px;
	trainsition: 0.3s;
}

.modelTest {
	display: none;
	border: solid 1px white;
	padding: 6px 12px;
	color: #0000;
}

ul.tab li.current {
	opacity: 90%;
	background-color: white;
}

.modelTest.current {
	display: block;
}

#image-container {
	width: 400px;
	height: 400px;
	margin-left: 10vw;
}

#testImg {
	width: 250px;
}

.result-btn, .result-btn2 {
	border: none;
	border-radius: 5px;
}

#tab_wrap {
	display: flex;
	flex-direction: column;
}

h5 {
	margin-top: 1vh;
}

.result {
	float: right;
}
</style>
<!-- model불러오기 -->
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/index"><img
				src="/resources/img/logo.png" style="width: 55%;"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#download">체험하기</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#features">이용안내</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">고객센터</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.userInfo}">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="/member/login">로그인</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="/member/join">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="/member/face">사진등록</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="/member/history">저장내역</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="/member/logout">로그아웃</a></li>
							<c:if test="${sessionScope.userInfo.userId eq 'admin'}">
								<li class="nav-item"><a class="nav-link js-scroll-trigger"
									href="/clothes/clothes">옷 등록하기</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead"
		style="height: auto; padding-top: 150px; min-height: 950px;">

		<section id="download">
			<div class="container" style="height: 400px;">
				<div class="row">
					<div class="col-md-8 mx-auto">
						<h2 class="section-heading">
							<h2 style="font-size: 50px;">체험하기</h2>
							<br>
							<div id='tab_wrap'>
								<ul class='tab' style="margin: 0">
									<li class="current" data-tab="tab1"><a href="#">웹캠으로
											검색</a></li>
									<li data-tab="tab2"><a href="#">사진으로 검색</a></li>
								</ul>
								<div id="tab1" class="modelTest current">
									<button type="button" onclick="init()" id='btn_name' value='on'>Start</button>
									<div id="result-wrap">
										<div id="webcam-wrap">
											<div id="webcam-container"></div>
										</div>
										<div id="label-container"></div>
									</div>
									<div id="result">

										<label id="link-lap"> <c:choose>
												<c:when test="${empty sessionScope.userInfo}">
													<h5>
														<script type="text/javascript">
														function error() {
															alert('피팅기능을 이용하려면 로그인이 필요합니다.');

														}
													</script>
														<input type="button" class="result-btn" value=""
															name="clothes" /> <a class="fitUrl" id="fitting1"
															href="/member/login" onclick="error()">피팅하러가기</a>
													</h5>
												</c:when>
												<c:otherwise>

													<h5>

														<input type="button" class="result-btn" value=""
															name="clothes" /> <a class="fitUrl" id="fitting2">피팅하러가기<input
															type="submit" value="" style="display: none;"
															name="newlabel"></a>
														<script>
																document.querySelector('#fitting2').addEventListener('click', (e)=>{
																	let param = document.querySelector('#fitting2 input').value;

																	location.href="/avatar/fitting?clothesCode=" + param;

																})
															</script>

													</h5>
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
								<script src="/resources/js/videoTest.js"></script>
								<script src="/resources/js/imageTest.js"></script>
								<div id="tab2" class="modelTest">
									<label><input type="file" id="testImg"
										class="fbtn btn-outline btn-xl js-scroll-trigger" name="img"
										onchange="setThumbnail(event);"
										style="border: none; border-radius: 5px"> </label>
									<script type="text/javascript">
									
								</script>
									<div id="result-wrap2">
										<div id="image-wrap">
											<div id="image-container"></div>
										</div>
										<div id="label-container2"></div>
									</div>
									<div id="result">
										<label id="link-lap"> <c:choose>
												<c:when test="${empty sessionScope.userInfo}">
													<h5>
														<script type="text/javascript">
															function error() {
																alert('피팅기능을 이용하려면 로그인이 필요합니다.');

															}
														</script>
														<input type="button" class="result-btn2" value=""
															name="clothes" /> <a class="fitUrl" id="fitting3"
															href="/member/login" onclick="error()">피팅하러가기</a>
													</h5>
												</c:when>
												<c:otherwise>
													<h5>
														-
															<input type="button" class="result-btn2" value=""
																name="clothes" /> <a class="fitUrl" id="fitting4">피팅하러가기<input
																type="submit" value="" style="display: none;"></a>
															<script>
																document.querySelector('#fitting4').addEventListener('click', (e)=>{
																	let param = document.querySelector('#fitting4 input').value;

																	location.href="/avatar/fitting?clothesCode=" + param;

																})
															</script>
													</h5>
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</section>
	</header>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/new-age.min.js"></script>
</html>