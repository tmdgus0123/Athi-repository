<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm:ss" var="thisYmd" />

<!DOCTYPE html>
<html>
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>ATHI</title>
<link href="./resources/xeon/css/font-awesome.min.css" rel="stylesheet">
<link href="./resources/xeon/css/prettyPhoto.css" rel="stylesheet">
<link href="./resources/xeon/css/main.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="./resources/sb-admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this sb-admin -->
<link href="./resources/sb-admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Plugin CSS -->
<link href="./resources/sb-admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this sb-admin -->
<link href="./resources/sb-admin/css/sb-admin.css" rel="stylesheet">

</head>
<body class="fixed-nav sidenav-toggled" id="page-top">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />

	<div class="content-wrapper py-3" style="background-color: #f2f4f7;">
		<!-- 배너 시작 -->
		<div class="row cycle-slideshow" style="margin-top: -16px;">
			<img src="./resources/images/baner1.jpg" width=100% height="200px" /> <img src="./resources/images/baner2.jpg" width=100% height="200px" /> <img src="./resources/images/baner3.jpg" width=100% height="200px" /> <img
				src="./resources/images/baner4.jpg" width=100% height="200px" />
		</div>
		<!-- 배너 끝 -->
		<!-- 소개글 시작 -->
		<div class="col-sm-12">
			<div class="jumbotron text-center" style="background:#4ea8ad; margin-top:15px;">
				<h1 style="color:red; font-size:1.8em; font-weight:bold;">아띠 코딩</h1>
				<p style="font-size:1.3em; color:white;">
					코딩 관련 커뮤니티 사이트 아띠에 방문하여 주신 것을 진심으로 환영합니다. <br />
					저희 아띠 사이트는 이전에 국내에서 없었던 프로젝트 공유 및 체계적인 회원 관리를 하고 있습니다. <br />
					방문해주셔서 감사드리며, 좋은 정보를 얻어가셨으면 좋겠습니다. <br />
					사이트 내에 부족한 점은 건의사항 게시판에 건의하여 주시면, 검토 후 적극적으로 반영하겠습니다. <br /> 
					또한, 본 사이트 운영자들도 원활한 커뮤니티가 이뤄질 수 있도록 노력하겠습니다. <br />
				</p>
			</div>
		</div>
		<!-- 소개글 종료 -->
		<!-- 순위 시작 -->
		<div class="col-sm-12">
			<div class="card mb-3">
				<div class="card-header" style="background-color: #9155e5; color: white;">
					<i class="fa fa-fw fa-user"></i> 아띠 회원 랭킹
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-sm-4">
							<div class="card mb-3">
								<div class="card-header">
									<img src="./resources/images/miniSilverMedal.png"> 2 등
								</div>
								<div class="card-body text-center" style="background-color: silver; color: #f3f3f3;">
									<img src="./resources/images/silverLaurel.jpg" class="rounded-circle" width="100" height="100">
									<h1>ID : ${secondId}</h1>
									<h3>등급 : ${secondGrade}</h3>
								</div>
								<div class="card-footer small text-muted">가입일 : ${secondrDate}</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="card mb-3">
								<div class="card-header">
									<img src="./resources/images/miniGoldMedal.png"> 1 등
								</div>
								<div class="card-body text-center" style="background-color: gold; color: #f3f3f3;">
									<img src="./resources/images/goldLaurel.jpg" class="rounded-circle" width="100" height="100">
									<h1>ID : ${firstId}</h1>
									<h3>등급 : ${firstGrade}</h3>
								</div>
								<div class="card-footer small text-muted">가입일 : ${firstrDate}</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="card mb-3">
								<div class="card-header">
									<img src="./resources/images/miniBronzeMedal.png"> 3 등
								</div>
								<div class="card-body text-center" style="background-color: peru; color: #f3f3f3;">
									<img src="./resources/images/bronzeLaurel.jpg" class="rounded-circle" width="100" height="100">
									<h1>ID : ${thirdId}</h1>
									<h3>등급 : ${thirdGrade}</h3>
								</div>
								<div class="card-footer small text-muted">가입일 : ${thirdrDate}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer small text-muted"><a class="fa fa-check" style="cursor:pointer;" onclick="window.location.reload();"></a>&nbsp;Update 시간 : ${thisYmd}</div>
			</div>
		</div>
		<!-- 순위 끝 -->
		<!-- 차트 시작 -->
		<div class="col-sm-12">
			<div class="card mb-3" id="div1">
				<div class="card-header" style="background-color: blue; color: white;">
					<i class="fa fa-area-chart"></i> 방문자수 그래프
				</div>
				<div class="card-body">
					<canvas id="chart" width="100%" height="30"></canvas>
				</div>
				<div class="card-footer small text-muted"><a class="fa fa-check" style="cursor:pointer;" onclick="window.location.reload();"></a>&nbsp;Update 시간 : ${thisYmd}</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
	<!-- /.content-wrapper -->
	<!-- Scroll to Top Button -->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fa fa-angle-up"></i>
	</a>

	<c:set var="total" value="${sessionScope.totalCnt}" />
	<c:set var="today" value="${sessionScope.todayCnt}" />

	<jsp:include page="/common/modalLogin.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/sb-admin/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/sb-admin/vendor/popper/popper.min.js"></script>
	<script src="./resources/sb-admin/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./resources/sb-admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="./resources/sb-admin/vendor/chart.js/Chart.min.js"></script>
	<script src="./resources/sb-admin/vendor/datatables/jquery.dataTables.js"></script>
	<script src="./resources/sb-admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this sb-admin -->
	<script src="./resources/sb-admin/js/sb-admin.min.js"></script>
	<script>
		var ctx = document.getElementById("chart");
		var total = '<c:out value="${total}"/>';
		var today = '<c:out value="${today}"/>';
		
		var myLineChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ "Total", "08.30", "08.31", "09.01", "09.02", "09.03", "09.04" ],
				datasets : [ {
					label : "방문자수",
					lineTension : 0.3,
					backgroundColor : "rgba(2,117,216,0.2)",
					borderColor : "rgba(2,117,216,1)",
					pointRadius : 5,
					pointBackgroundColor : "rgba(2,117,216,1)",
					pointBorderColor : "rgba(255,255,255,0.8)",
					pointHoverRadius : 5,
					pointHoverBackgroundColor : "rgba(2,117,216,1)",
					pointHitRadius : 20,
					pointBorderWidth : 2,
					data : [ total, "23" , "31", "58", "21", "25", today ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 1000,
							maxTicksLimit : 5
						},
						gridLines : {
							color : "rgba(0, 0, 0, .125)",
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>

	<script src="./resources/xeon/js/jquery.js"></script>
	<script src="./resources/xeon/js/jquery.isotope.min.js"></script>
	<script src="./resources/xeon/js/jquery.prettyPhoto.js"></script>
	<script src="./resources/xeon/js/main.js"></script>
</body>
</html>