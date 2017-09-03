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
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.7;">
				<h1>글쓰기</h1>
			</div>
			<div>
				<div class="col-sm-12" style="margin-top: 50px;">
					<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 5px; margin-bottom: 25px; opacity: 0.7;">
						<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="portfolioWriteAction.do">
							<table class="board_view table-bordered">
								<colgroup>
									<col width="15%">
									<col width="*" />
								</colgroup>
								<caption>게시글 작성</caption>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td><input type="text" id="title" name="title" class="wdp_90"></input></td>
									</tr>
									<tr>
										<td colspan="2" class="view_text"><textarea rows="20" cols="100" title="내용" id="contents" name="contents"></textarea></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2" class="view_text text-center">
											<input type="file" name="file" class="btn btn-primary">
										</td>
									</tr>
									<tr>
										<td colspan="2" class="view_text text-center">
											<input type="submit" value="파일업로드" class="btn btn-success"/>
											<button type="button" class="btn btn-danger">취소</button>
										</td>
									</tr>
								</tfoot>
							</table>
					
						</form>
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