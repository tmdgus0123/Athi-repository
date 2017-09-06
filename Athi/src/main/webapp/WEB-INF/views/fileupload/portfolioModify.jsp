<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<h1>글쓰기</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; margin-bottom: 25px; opacity: 0.85;">
				<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="portfolioModifyAction.do">
					<input type="hidden" name="nowPage" value="${param.nowPage }" readonly /> 
					<input type="hidden" name="id" value="${viewRow.id }" />
					<input type="hidden" name="num" value="${viewRow.num}" />
					
					<div class="row form-group">
						<div class="col-sm-2">
							<select class="form-control" name="portfolioLanguage">
								<option value="">카테고리</option>
								<option value="java">java</option>
								<option value="html">html</option>
								<option value="javascript">javascript</option>
								<option value="jQuery">jQuery</option>
								<option value="spring">spring</option>
								<option value="JSP">JSP</option>
								<option value="bootstrap">bootstrap</option>
								<option value="jqueryUI">jqueryUI</option>
								<option value="css">css</option>
								<option value="servlet">servlet</option>
							</select>
						</div>
						<div class="col-sm-1" style="margin: auto;">제목</div>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요." value="${viewRow.title }"/>
						</div>
					</div>
					<div class="row form-group" style="background-color: #e7adb7; height: 50px">
						<div class="col-sm-11 text-right" style="margin: auto;">글쓴이 : ${viewRow.id }</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-12">
							<textarea name="content" class="form-control" style="height: 400px;" placeholder="내용을 입력해주세요.">${viewRow.content }</textarea>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2" style="margin: auto;">
							<span class="btn-primary" style="border-radius: 1em; padding-left: 50px; padding-right: 50px; padding-top: 12.5px; padding-bottom: 12.5px;"> 첨부 파일 </span>
						</div>
						<div class="col-sm-10">
							<input type="file" class="form-control" name="file" id="file" />
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-12 text-right" style="margin-bottom: 15px;">
							<button type="submit" class="btn btn-success">등록하기</button>
						</div>
					</div>
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