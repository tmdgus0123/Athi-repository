<%@page import="com.kosmo.athi.model.BoardDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('./resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />
	<div class="container">
		<div class="col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>포트폴리오 전시</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
				<div class="row">
					<div class="col-sm-12">
						<div style="float: right; margin-bottom:25px;">
							<c:choose>
								<c:when test="${user_id!=null}">
									<form action="portfolioWrite.do" method="get">
										<input type="hidden" name="boardName" value="${boardName}" /> 
										<input type="hidden" name="nowPage" value="${nowPage}" /> 
										<input type="hidden" name="id" value="${user_id}" />
										<div class="input-group">
											<button type="submit" class="btn btn-info">글쓰기</button>
										</div>
									</form>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<section id="portfolio">
					<div class="container">
						<div class="box">
							<!--/.center-->
							<ul class="portfolio-filter text-left">
								<li>
									<a class="btn btn-primary active" href="#" data-filter="*">All</a>
								</li>
								<li>
									<a class="btn btn-primary" href="#" data-filter=".bootstrap">Bootstrap</a>
								</li>
								<li>
									<a class="btn btn-primary" href="#" data-filter=".html">HTML</a>
								</li>
								<li>
									<a class="btn btn-primary" href="#" data-filter=".wordpress">Wordpress</a>
								</li>
							</ul>
							<!--/#portfolio-filter-->
							<ul class="row portfolio-items text-center">
								<li class="row portfolio-item bootstrap apps col-sm-4">
									<div class="item-inner">
										<div class="portfolio-image">
											<img src="./resources/xeon/images/portfolio/thumb/item1.jpg" alt="">
											<div class="overlay">
												<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item1.jpg">
													<i class="icon-eye-open"></i>
												</a>
											</div>
										</div>
										<h5>Lorem ipsum dolor sit amet</h5>
									</div>
								</li>
								<li class="row portfolio-item wordpress col-sm-4">
									<div class="item-inner">
										<div class="portfolio-image">
											<img src="./resources/xeon/images/portfolio/thumb/item1.jpg" alt="">
											<div class="overlay">
												<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item1.jpg">
													<i class="icon-eye-open"></i>
												</a>
											</div>
										</div>
										<h5>Lorem ipsum dolor sit amet</h5>
									</div>
								</li>
								<li class="row portfolio-item html col-sm-4">
									<div class="item-inner">
										<div class="portfolio-image">
											<img src="./resources/xeon/images/portfolio/thumb/item1.jpg" alt="">
											<div class="overlay">
												<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item1.jpg">
													<i class="icon-eye-open"></i>
												</a>
											</div>
										</div>
										<h5>Lorem ipsum dolor sit amet</h5>
									</div>
								</li>
								<li class="row portfolio-item html col-sm-4">
									<div class="item-inner">
										<div class="portfolio-image">
											<img src="./resources/xeon/images/portfolio/thumb/item1.jpg" alt="">
											<div class="overlay">
												<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item1.jpg">
													<i class="icon-eye-open"></i>
												</a>
											</div>
										</div>
										<h5>Lorem ipsum dolor sit amet</h5>
									</div>
								</li>
								<li class="row portfolio-item html col-sm-4">
									<div class="item-inner">
										<div class="portfolio-image">
											<img src="./resources/xeon/images/portfolio/thumb/item1.jpg" alt="">
											<div class="overlay">
												<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item1.jpg">
													<i class="icon-eye-open"></i>
												</a>
											</div>
										</div>
										<h5>Lorem ipsum dolor sit amet</h5>
									</div>
								</li>
								<li class="row portfolio-item html col-sm-4">
									<div class="item-inner">
										<div class="portfolio-image">
											<img src="./resources/xeon/images/portfolio/thumb/item1.jpg" alt="">
											<div class="overlay">
												<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item1.jpg">
													<i class="icon-eye-open"></i>
												</a>
											</div>
										</div>
										<h5>Lorem ipsum dolor sit amet</h5>
									</div>
								</li>
							</ul>
						</div>
						<!--/.box-->
					</div>
					<!--/.container-->
				</section>
				<!--/#portfolio-->
				<!-- 페이지 번호 -->
				<div class="row" style="margin-top: 15px; margin-bottom:20px;">
					<div class="col-sm-6">
						<div style="float: left;">
							<ul class="pagination">
								<li>${pagingImg }</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div style="float: right;">
							<form action="search.do" class="form-inline" name="searchFrm" method="get">
								<div class="form-group" style="margin-top: 18px;">
									<input type="hidden" name="boardName" value="${boardName }" /> <input type="hidden" name="nowPage" value="${nowPage }" /> <select name="searchColumn" class="form-control">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="id">작성자</option>
									</select>
									<div class="input-group">
										<input type="text" name="searchWord" class="form-control" placeholder="검색어 입력" />
										<div class="input-group-btn">
											<button class="btn btn-primary" type="submit">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fa fa-angle-up"></i>
	</a>

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
	<script src="./resources/xeon/js/jquery.js"></script>
	<script src="./resources/xeon/js/jquery.isotope.min.js"></script>
	<script src="./resources/xeon/js/jquery.prettyPhoto.js"></script>
	<script src="./resources/xeon/js/main.js"></script>

</body>
</html>