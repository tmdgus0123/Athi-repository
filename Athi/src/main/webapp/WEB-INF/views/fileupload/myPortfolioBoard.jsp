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
				<section id="portfolio">
					<div class="container" style="margin-top: 5px;">
						<div class="box">
							<!--/.center-->
							<ul class="portfolio-filter text-left">
								<li>
									<a class="btn btn-primary active" href="#" data-filter="*">All</a>
								</li>
								<li>
									<a class="btn btn-primary" href="#" data-filter=".Web">웹</a>
								</li>
								<li>
									<a class="btn btn-primary" href="#" data-filter=".Game">게임</a>
								</li>
								<li>
									<a class="btn btn-primary" href="#" data-filter=".Application">어플리케이션</a>
								</li>
							</ul>
							<!--/#portfolio-filter-->
							<ul class="portfolio-items">
								<c:choose>
									<c:when test="${empty listRows}">
										<li class="portfolio-item bootstrap apps col-sm-12">
											<h5>등록된 글이 없습니다.</h5>
										</li>
									</c:when>
									<c:otherwise>
										<c:forEach items='${listRows}' var='row' varStatus='loop'>
											<li class="portfolio-item ${row.p_language } apps col-sm-6">
												<div class="item-inner">
													<div class="portfolio-image">
														<img src="./resources/images/${row.fileName }">
														<div class="overlay">
															<a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="./resources/images/${row.fileName }">
																<i class="icon-eye-open"></i>
															</a>
														</div>
													</div>
													<a href="portfolioView.do?num=${row.num }&nowPage=${nowPage }&rNum=${row.rNum }&fileName=${row.fileName }">${row.title }</a>
												</div>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!--/.box-->
					</div>
					<!--/.container-->
				</section>
				<!--/#portfolio-->
				<!-- 페이지 번호 -->
				<div class="row" style="margin-top: 10px; margin-bottom: -15px;">
					<div class="col-sm-6">
						<div style="float: left;">
							<ul class="pagination">
								<li>${pagingImg }</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div style="float: right;">
							<form action="portfolioSearch.do" class="form-inline" name="searchFrm" method="get">
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
	<script src="./resources/xeon/js/jquery.js"></script>
	<script src="./resources/xeon/js/jquery.isotope.min.js"></script>
	<script src="./resources/xeon/js/jquery.prettyPhoto.js"></script>
	<script src="./resources/xeon/js/main.js"></script>

</body>
</html>