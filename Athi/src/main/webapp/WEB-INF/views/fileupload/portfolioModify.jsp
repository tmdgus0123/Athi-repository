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
<link href="../resources/sb-admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this sb-admin -->
<link href="../resources/sb-admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Plugin CSS -->
<link href="../resources/sb-admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this sb-admin -->
<link href="../resources/sb-admin/css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('../resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />
	<div class="container">
		<div class="col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>Post in Modify</h1>
			</div>
			<div>
				<div class="col-sm-12" style="margin-top: 50px;">
					<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 5px; margin-bottom: 25px; opacity: 0.85;">
						<form name="modifyFrm" action="pModifyAction.do" method="post" onsubmit="return checkModifyFrm();">
							<input type="hidden" name="boardName" value="${param.boardName}" readonly />
							<input type="hidden" name="nowPage" value="${param.nowPage}" readonly />
							<input type="hidden" name="id" value="${user_id}" readonly />
							<input type="hidden" name="mode" value="${param.mode}" readonly />
							<input type="hidden" name="num" value="${param.num}" readonly />
							<div class="form-group">
								<table class="table" style="margin-top: 50px;">
									<tr>
										<td width="" style="padding-top: 50px; padding-bottom: 50px; text-align: center;">
											<h4>제목</h4>
										</td>
										<td colspan="3" width="50%" style="padding-top: 50px; padding-bottom: 50px;">
											<input type="text" class="form-control" name="title" style="width: 90%; border: 2px solid black;" value="${postInfo.title}" />
										</td>
										<c:if test="${param.boardName!='accident' and param.boardName!='freeBoard' and param.boardName!='notice' and param.boardName!='suggestions'}">
											<td width="50%" style="padding-top: 50px; padding-bottom: 50px; text-align: center;">
												<h4>카테고리</h4>
											</td>
											<td colspan="3" width="90%" style="padding-top: 50px; padding-bottom: 50px;">
												<select name="pLang" class="form-control" name="title" style="width: 90%; border: 2px solid black;" id="">
													<option value="JAVA">JAVA</option>
													<option value="SPRING">SPRING</option>
													<option value="jQueryAjax">jQueryAjax</option>
													<option value="JSPServlet">JSP&Servlet</option>
													<option value=""></option>
												</select>
											</td>
										</c:if>
									</tr>
									<tr>
										<td style="padding-top: 50px; padding-bottom: 50px; text-align: center;"><br> <br> <br> <br>
											<h4>내용</h4></td>
										<td colspan="3" style="padding-top: 50px; padding-bottom: 50px;">
											<textarea name="content" class="form-control" style="width: 90%; height: 200px; border: 2px solid black;">
												${postInfo.content}
											</textarea>
										</td>
									</tr>
									<tr>
										<td colspan="4" style="text-align: center;"><br>
											<button type="submit" class="btn btn-success">수정</button>
										</td>
									</tr>
								</table>
							</div>
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
	<script src="../resources/sb-admin/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/sb-admin/vendor/popper/popper.min.js"></script>
	<script src="../resources/sb-admin/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="../resources/sb-admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="../resources/sb-admin/vendor/datatables/jquery.dataTables.js"></script>
	<script src="../resources/sb-admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this sb-admin -->
	<script src="../resources/sb-admin/js/sb-admin.min.js"></script>
</body>
</html>