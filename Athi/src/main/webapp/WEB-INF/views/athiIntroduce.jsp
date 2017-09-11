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
		<div class="row col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center btn-primary" style="color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>&lt; 아띠의 소개 &gt;</h1>
			</div>
		</div>
		<div class="row col-sm-12" style="margin-top: 50px; margin-bottom: 50px; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
			<div class="col-sm-12 text-center btn-success" style="color: white;">
				<h1>포트폴리오</h1>
			</div>
			<br />
			<div class="col-sm-12 text-center" style="background-color: white;">
				<p style="font-size:1.3em;">
					아띠 프로젝트는 여러분의 포트폴리오를 공유하고, <br /> 
					다른 회원 간의 정보를 주고 받을 수 있습니다. <br />
				</p>
			</div>
		</div>
		<div class="row col-sm-12" style="margin-top: 50px; margin-bottom: 50px; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;"">
			<div class="col-sm-12 text-center btn-primary">
				<h1>등급 제도</h1>
			</div>
			<br />
			<div class="col-sm-12 text-center" style="background-color: white;">
				<p style="font-size:1.3em;">
					등급 별로 나누어서, 체계적인 회원 관리를 할 수 있도록 등급 제도를 실시합니다. <br />
					일정 이상 등급이 되면, 프로젝트 팀을 꾸리고, 스터디 그룹을 모집할 수도 있습니다. <br />
				</p>
			</div>
		</div>
		<div class="row col-sm-12" style="margin-top: 50px; margin-bottom: 50px; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
			<div class="col-sm-12 text-center btn-info" style="color: white;">
				<h1 class="">이용 관련 사항</h1>
			</div>
			<br />
			<div class="col-sm-12 text-center" style="background-color: white;">
				<p style="font-size:1.3em;">
					홈페이지 활동은 회원 가입 후에 가능하며, 비회원은 글 읽기만 가능합니다. <br />
					또한, 포트폴리오 역시 회원만 제공되는 기능이므로, 활동을 원하시는 분은 가입하신 후, <br />
					활동해주시면 감사하겠습니다.
				</p>
			</div>
		</div>
	</div>
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fa fa-angle-up"></i>
	</a>

	<jsp:include page="/common/modalLogin.jsp"/>
	
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