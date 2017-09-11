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
<script src="./resources/jQuery/jquery-3.2.1.js"></script>

</head>
<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('./resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />
	<div class="container">
		<div class="col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>게시물 관리</h1>
			</div>
			<div class="col-sm-12" style="margin-top: 50px; height: 125px; opacity: 0.85;">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-4" style="height: 125px;">
							<div class="card text-white bg-primary o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-pencil"></i>
									</div>
									<div class="mr-5">오늘의 글 : ${newPostCnt} 개</div>
								</div>
								<a href="newPostList.do" onclick="window.open(this.href,'_blank','width=1200,height=600, scrollbars=yes');return false;" class="card-footer text-white clearfix small z-1">
									<span class="float-left">상세보기</span>
									<span class="float-right">
										<i class="fa fa-angle-right"></i>
									</span>
								</a>
							</div>
						</div>
						<div class="col-sm-4" style="height: 125px;">
							<div class="card text-white bg-warning o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-eraser"></i>
									</div>
									<div class="mr-5">오늘의 포트폴리오 : ${newPortfolioCnt} 개</div>
								</div>
								<a href="newPortfolioList.do" onclick="window.open(this.href,'_blank','width=1200,height=600, scrollbars=yes');return false;" class="card-footer text-white clearfix small z-1">
									<span class="float-left">상세보기</span>
									<span class="float-right">
										<i class="fa fa-angle-right"></i>
									</span>
								</a>
							</div>
						</div>
						<div class="col-sm-4" style="height: 125px;">
							<div class="card text-white bg-success o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon">
										<i class="fa fa-fw fa fa-user-plus"></i>
									</div>
									<div class="mr-5">오늘 가입한 회원 : ${newMemberCnt} 명 </div>
								</div>
								<a href="newMemberList.do" onclick="window.open(this.href,'_blank','width=800,height=600, scrollbars=yes');return false;" class="card-footer text-white clearfix small z-1">
									<span class="float-left">상세보기</span>
									<span class="float-right">
										<i class="fa fa-angle-right"></i>
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
				<form name="postList">
					<table class="table table-bordered" id="dataTable" cellspacing="0">
						<colgroup>
							<col width="7%" />
							<col width="8%" />
							<col width="*" />
							<col width="15%" />
							<col width="18%" />
							<col width="9%" />
							<col width="9%" />
						</colgroup>
						<thead>
						<tr class="btn-success">
							<th class="text-center">
								<a onclick="allCheck();">
									<input type="checkbox" />
								</a>
							</th>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
						</thead>
						<tbody>
							<!-- 반복문 시작 -->
							<c:choose>
								<c:when test="${empty boardRows }">
									<tr style="text-align: center;">
										<td colspan="7">등록된 글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items='${boardRows }' var='row' varStatus='loop'>
										<tr>
											<td class="text-center"><a>
													<input type="checkbox" name="listBox" value="${row.num }" />
												</a></td>
											<td>${row.num }</td>
											<td><a href="./view.do?num=${row.num }&nowPage=${nowPage }">${row.title } [${row.comm_cnt }]</a></td>
											<td>${row.id }</td>
											<td>${row.postdate }</td>
											<td>${row.visit_cnt }</td>
											<td>${row.recom_cnt }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<!-- 반복문 끝 -->
						</tbody>
						<c:choose>
							<c:when test="${not empty boardRows}">
								<tfoot>
									<tr>
										<td colspan="7" style="text-align: right;">
											<button type="button" class="btn btn-danger" name="postBtn">선택 게시물 삭제</button>
										</td>
									</tr>
								</tfoot>
							</c:when>
						</c:choose>
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
	<script>
	function allCheck(){
		var frm = document.postList;
		for (var i=0; i<frm.listBox.length; i++){
			if(frm.listBox[i].checked == false){
				frm.listBox[i].checked = true;
			}
			else if(frm.listBox[i].checked == true){
				frm.listBox[i].checked = false;
			}
		}
	}
	</script>
	<script>
		jQuery.ajaxSettings.traditional = true;
		
		$('button[type="button"][class="btn btn-danger"][name="postBtn"]').click(function(){
			var arr = new Array();
			
			$("input[name='listBox'][type='checkbox']:checked").each(function(idx){
				arr.push($("input[name='listBox'][type='checkbox']:checked").eq(idx).val());
			});
			
			$.ajax({
				url : "selectPostDelete.do",
				data : {
					'postNum' : arr
				},
				type : "post",
				success : function(data){
					alert("선택한 게시물 삭제를 정상적으로 처리하였습니다.");
					window.location.reload();
				},
				error : function(request, status, error) {
				    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				},
				async : true
			});	
		});
	</script>
</body>
</html>