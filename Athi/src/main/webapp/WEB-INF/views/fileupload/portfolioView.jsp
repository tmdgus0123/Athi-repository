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
				<h1>상세보기</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-bottom: 10px; opacity: 0.85;">
				<div class="row" style="background-color: #f3f3f3; border-top-left-radius: 1em; border-top-right-radius: 1em; height: 50px;">
					<div class="col-sm-4 text-left" style="margin: auto;">인벤관리자</div>
					<div class="col-sm-4 text-center" style="margin: auto;">제목</div>
					<div class="col-sm-4 text-right" style="margin: auto;">조회 : 100 / 추천 : 100</div>
				</div>
				<div class="row">
					<div class="col-sm-6 text-left">[정보]</div>
					<div class="col-sm-6 text-right">2017-09-03 12:59:59</div>
				</div>
				<div>
					<div class="text-left" style="margin-top:50px; margin-bottom:50px;">
						<img src="./resources/images/${param.fileName }" style="width:500px; height:500px;"/>
					</div>
				</div>
				<div class="text-right" style="margin-top: 25px; margin-bottom: 25px;">
					<button type="button" class="btn btn-warning" onclick="history.back();">목록</button>
					<button type="submit" class="btn btn-success">답글</button>
					<c:choose>
						<c:when test="${user_id==viewRow.id}">
							<button type="button" class="btn btn-primary" onclick="location.href='board/modify.do?mode=modify&num=${param.num}&boardName=${param.boardName}'">수정</button>
							<button type="button" class="btn btn-danger" onclick="location.href='./editAction.do?mode=delete&num=${param.num}&boardName=${param.boardName}'">삭제</button>
						</c:when>
					</c:choose>
				</div>
				<div class="row" style="background-color: #f3f3f3; height: 50px">
					<div class="col-sm-1"></div>
					<div class="col-sm-10 text-left" style="margin: auto; padding-left: 30px;">댓글 수(0)</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="col-sm-12" style="background-color: white; border-radius: 1em; padding-bottom: 40px;">
					<div class="row" style="margin-top: 25px;">
						<div class="col-sm-1">
							<input type="checkbox" style="margin-top: 6.5px;" />
						</div>
						<div class="col-sm-9 text-left">
							<div>이름 / 작성일</div>
							<div style="margin-top: 25px; margin-bottom: 6.5px;">내용</div>
						</div>
						<div class="col-sm-1 text-right">
							<button class="btn btn-danger" style="margin-top: 13px;">삭제</button>
						</div>
						<div class="col-sm-1" style="margin-top: 25px;"></div>
					</div>
					<hr>
					<div class="row" style="margin-top: 50px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-9">
							<textarea name="text" rows="5" style="width: 100%;">텍스트</textarea>
						</div>
						<div class="col-sm-1">
							<button class="btn btn-default">답글</button>
						</div>
						<div class="col-sm-1"></div>
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
	<script src="./resources/sb-admin/vendor/datatables/jquery.dataTables.js"></script>
	<script src="./resources/sb-admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this sb-admin -->
	<script src="./resources/sb-admin/js/sb-admin.min.js"></script>
</body>
</html>