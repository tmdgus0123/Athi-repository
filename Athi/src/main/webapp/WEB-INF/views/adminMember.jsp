<%@page import="com.kosmo.athi.model.BoardDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>ATHI</title>

<!-- Bootstrap core CSS -->
<link href="./resources/sb-admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this sb-admin -->
<link href="./resources/sb-admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Plugin CSS -->
<link href="./resources/sb-admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this sb-admin -->
<link href="./resources/sb-admin/css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('./resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />
	<div class="container">
		<div class="col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>회원 관리</h1>
			</div>
			<div class="col-sm-12" style="margin-top: 50px; height: 125px; opacity: 0.85;">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-3" style="height: 125px;">
							<div class="card text-white bg-primary o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-pencil"></i>
									</div>
									<div class="mr-5">26 New Messages!</div>
								</div>
								<a href="#" class="card-footer text-white clearfix small z-1">
									<span class="float-left">View Details</span> <span class="float-right"> <i class="fa fa-angle-right"></i>
									</span>
								</a>
							</div>
						</div>
						<div class="col-sm-3" style="height: 125px;">
							<div class="card text-white bg-warning o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-eraser"></i>
									</div>
									<div class="mr-5">11 New Tasks!</div>
								</div>
								<a href="#" class="card-footer text-white clearfix small z-1">
									<span class="float-left">View Details</span> <span class="float-right"> <i class="fa fa-angle-right"></i>
									</span>
								</a>
							</div>
						</div>
						<div class="col-sm-3" style="height: 125px;">
							<div class="card text-white bg-success o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-user-plus"></i>
									</div>
									<div class="mr-5">123 New Orders!</div>
								</div>
								<a href="#" class="card-footer text-white clearfix small z-1">
									<span class="float-left">View Details</span> <span class="float-right"> <i class="fa fa-angle-right"></i>
									</span>
								</a>
							</div>
						</div>
						<div class="col-sm-3" style="height: 125px;">
							<div class="card text-white bg-danger o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-user-times"></i>
									</div>
									<div class="mr-5">13 New Tickets!</div>
								</div>
								<a href="#" class="card-footer text-white clearfix small z-1">
									<span class="float-left">View Details</span> <span class="float-right"> <i class="fa fa-angle-right"></i>
									</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
				<form action="">
					<table class="table table-bordered" id="dataTable" cellspacing="0">
						<thead>
							<tr class="btn-primary">
								<th class="text-center"><input type="checkbox" />
								<th>등급</th>
								<th>경험치</th>
								<th>아이디</th>
								<th>이름</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
							<!-- 반복문 시작 -->
							<c:choose>
								<c:when test="${empty memberRows}">
									<tr style="text-align: center;">
										<td colspan="6">등록된 회원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items='${memberRows}' var='row' varStatus='loop'>
										<tr>
											<td class="text-center"><input type="checkbox" /></td>
											<td><input type="hidden" style="border: none;" value="${row.grade}" />${row.grade}</td>
											<td><input type="hidden" style="border: none;" value="${row.exp}" />${row.exp}</td>
											<td><input type="hidden" style="border: none;" value="${row.id}" />${row.id}</td>
											<td><input type="hidden" style="border: none;" value="${row.name}" />${row.name}</td>
											<td><input type="hidden" style="border: none;" value="${row.regidate}" />${row.regidate}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<!-- 반복문 끝 -->
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6">
									<button type="button" class="btn btn-danger" name="memberBtn">선택 회원 삭제</button>
									&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-info" name="gradeBtn">회원 등급 조정</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
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
	<script src="./resources/sb-admin/vendor/datatables/jquery.dataTables.js"></script>
	<script src="./resources/sb-admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this sb-admin -->
	<script src="./resources/sb-admin/js/sb-admin.min.js"></script>
</body>
</html>