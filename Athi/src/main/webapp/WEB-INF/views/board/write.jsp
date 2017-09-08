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
				<h1>글쓰기</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; margin-bottom: 25px; opacity: 0.85;">
				<form name="writeFrm" action="writeAction.do" method="post" onsubmit="return checkWriteFrm();">
					<input type="hidden" name="boardName" value="${param.boardName}" readonly />
					<input type="hidden" name="nowPage" value="${param.nowPage}" readonly />
					<input type="hidden" name="id" value="${param.id}" />
					<div class="row form-group">
						<c:choose>
							<c:when test="${param.boardName=='QnABoard' or param.boardName=='tipBoard'}">
								<div class="col-sm-2">
									<select class="form-control" name="pLang">
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
								<div class="col-sm-1" style="margin: auto;">
									<h6>제목</h6>
								</div>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요." />
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-sm-2 text-center" style="margin: auto;">
									<h6>제목</h6>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요." />
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="row form-group" style="background-color: #e7adb7; height: 50px">
						<div class="col-sm-6 text-left">
							<input type="button" id="java" value="JAVA" />
							<input type="button" id="css" value="CSS" />
						</div>
						<div class="col-sm-6 text-right" style="margin: auto;">글쓴이 : ${param.id }</div>
					</div>
					<div class="row form-group">
						<c:choose>
							<c:when test="${param.boardName=='QnABoard' or param.boardName=='tipBoard'}">
								<div class="col-sm-12">
									<textarea name="content" class="form-control" style="height: 400px;" placeholder="내용을 입력해주세요."></textarea>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-sm-2 text-center">
									<h6>내용</h6>
								</div>
								<div class="col-sm-10">
									<textarea name="content" class="form-control" style="height: 400px;" placeholder="내용을 입력해주세요."></textarea>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="row form-group">
						<div class="col-sm-12 text-right" style="margin-bottom: 15px;">
							<button type="submit" class="btn btn-success">등록</button>
							<button type="button" class="btn btn-danger" onclick="history.back();">취소</button>
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

	<script>
		$("#java").click(function() {
			$.ajax({
				url : "syntax.do", // form : action
				data : { // form : input 's
					text : $("textarea[name='content']").val()
				},
				dataType : 'script',
				type : "post", // form : method
				success : function(data) { // 다시 돌아옴
					$("textarea[name='content']").val(data);
				}
			});			
		});

		$("#css").click(function() {
			$.ajax({
				url : "syntax.do", // form : action
				data : { // form : input 's
					text : $("textarea[name='content']").val()
				},
				dataType : 'script',
				type : "post", // form : method
				success : function(data) { // 다시 돌아옴
					$("textarea[name='content']").val(data);
				}
			});			
		});
	</script>
</body>
</html>