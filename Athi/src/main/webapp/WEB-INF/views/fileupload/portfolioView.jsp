<%@page import="com.kosmo.athi.model.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosmo.athi.model.CommentsDAO"%>
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
				<h1>상세보기</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-bottom: 10px; opacity: 0.85;">
				<div class="row" style="background-color: #f3f3f3; border-top-left-radius: 1em; border-top-right-radius: 1em; height: 50px;">
					<div class="col-sm-4 text-left" style="margin: auto;">글쓴이 : ${viewRow.id }</div>
					<div class="col-sm-4 text-center" style="margin: auto;">${viewRow.title }</div>
					<div class="col-sm-4 text-right" style="margin: auto;">조회수 : ${viewRow.visit_cnt }</div>
				</div>
				<div class="row">
					<div class="col-sm-6 text-left">${viewRow.num }</div>
					<div class="col-sm-6 text-right">${viewRow.postdate }</div>
				</div>
				<div>
					<div class="text-left" style="margin-top: 50px; margin-bottom: 50px;">
						<c:choose>
							<c:when test="${viewRow.nrecom_cnt >= 10}">
								<b>블라인드 된 게시글 입니다.</b>
							</c:when>
							<c:otherwise>
								<img src="./resources/images/${param.fileName }" />
								<br>
								<br>
								<br> ${viewRow.content }
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="text-right" style="margin-top: 25px; margin-bottom: 25px;">
					<button type="button" class="btn btn-warning" onclick="history.back();">목록</button>
					<c:choose>
						<c:when test="${user_id!=null}">
							<button type="button" class="btn btn-success" onclick="location.href='reply.do?num=${viewRow.num}&nowPage=${nowPage }'">답글</button>
						</c:when>
						<c:when test="${user_id==viewRow.id or user_grade==0}">
							<button type="button" class="btn btn-primary" onclick="location.href='./portfolioModify.do?num=${param.num}'">수정</button>
							<button type="button" class="btn btn-danger" onclick="location.href='./portfolioDeleteAction.do?num=${param.num}'">삭제</button>
						</c:when>
					</c:choose>
				</div>
				<div class="row" style="background-color: #f3f3f3; height: 50px;">
					<div class="col-sm-1"></div>
					<div class="col-sm-10 text-left" style="margin: auto; padding-left: 30px;">댓글 수(${viewRow.comm_cnt })</div>
					<div class="col-sm-1"></div>
				</div>
				<div class="col-sm-12" style="background-color: white; border-radius: 1em; padding-bottom: 40px;">
					<div class="col-sm-12">
						<ul id="comments" style="list-style: none;">
							<!-- DB에서 댓글 꺼내오기 반복문 시작 -->
							<c:forEach items='${comments}' var='dto' varStatus='loop'>
								<li id="li_${dto.num }">
									<div class="row">
										<div class="col-sm-1">
										<c:choose >
											<c:when test="${user_id == 'athi' }">
												<input type="checkbox" name="replyChk" style="margin-top: 6.5px;" />
											</c:when>
										</c:choose>
										</div>
										<div class="col-sm-9 text-left">
											<div>
												<strong>${dto.id }</strong>/
												<span>(${dto.postdate })</span>
											</div>
											<div style="margin-top: 25px; margin-bottom: 6.5px;">${dto.content }</div>
										</div>
										<c:choose>
											<c:when test="${user_id==dto.id or user_id=='athi'}">
												<div class="col-sm-1 text-right">
													<button class="btn btn-danger" style="margin-top: 13px;" onclick="deleteComments(${dto.num})">삭제</button>
												</div>
											</c:when>
										</c:choose>
										<div class="col-sm-1" style="margin-top: 25px;"></div>
									</div>
								</li>
							</c:forEach>
							<!-- 반복문 끝 -->
						</ul>
					</div>
					<hr>
					<div class="col-sm-12">
						<form name="commentsForm">
							<input type="hidden" id="num" value="${viewRow.num }" />
							<div class="row" style="margin-top: 50px; background-color: #f3f3f3; padding: 10px;">
								<div class="col-sm-2">
									<br /> <strong>${user_id }</strong>
									<input type="hidden" id="id" value="${user_id }" />
								</div>
								<div class="col-sm-8">
									<textarea id="content" rows="3" style="width: 100%;" <%if (session.getAttribute("user_id") == null) {%> placeholder="비회원은 로그인 후 댓글 작성이 가능합니다." readonly <%} else {%> placeholder="내용을 입력하세요." <%}%>></textarea>
								</div>
								<c:if test="${user_id ne null}">
									<div class="col-sm-1">
										<input type="button" class="btn btn-success" id="enrollBtn" value="등록" />
									</div>
								</c:if>
								<div class="col-sm-1"></div>
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
	<script src="./resources/sb-admin/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/sb-admin/vendor/popper/popper.min.js"></script>
	<script src="./resources/sb-admin/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./resources/sb-admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="./resources/sb-admin/vendor/datatables/jquery.dataTables.js"></script>
	<script src="./resources/sb-admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this sb-admin -->
	<script src="./resources/sb-admin/js/sb-admin.min.js"></script>

	<!-- 댓글 추가 -->
	<script>
		$('#enrollBtn').click(function() {
			
			if($('#content').val()==""){alert("댓글 내용이 비어있습니다."); $('#content').focus(); return false;}
			
			$.ajax({
				url : 'proj_comments.do', //form : action
				type : 'post', // form : method
				dataType : 'html',
				data : { // form : input 's
					num : $('#num').val(),
					id : $('#id').val(),
					content : $('#content').val()
				},
				success : function(data) {
					$('#comments').append(data);
				}
			});

			$('#content').val("");
		});
	
		function deleteComments(idx) {
			$.ajax({
				url : 'proj_deleteComments.do',
				type : 'post',
				dataType : 'html',
				data : {
					num : idx,
				},
				success : function(data) {
					$('#li_'+idx).remove();
				}
			})
		}
	</script>

	<!-- 추천/반대 -->
	<script>
	// 추천 추가
		$('#choiceBtn').click(function() {
			if(<%=session.getAttribute("user_id") != null%>){
				alert("추천하셨습니다.");
				$.ajax({
						url : 'commChoice.do', //form : action
						type : 'post', // form : method 
						dataType : 'html',
						data :{ // form : input 's			
								num : $('#num').val()
						},
					success : function(data){
						$('#chuBtn').html("");
						$('#chuBtn').append(data);
					}
				});	
			}
			else{
				alert("로그인 후 추천 할 수 있습니다.");
			}	
		});

	// 반대 추가
		$('#nRecomBtn').click(function() {
			if(<%=session.getAttribute("user_id") != null%>){
			alert("비추천하셨습니다.");
		
			$.ajax({
					url : 'nRecom.do', //form : action
					type : 'post', // form : method 
					dataType : 'html',
					data :{ // form : input 's			
							num : $('#num').val()
					},
				success : function(data){
					$('#chuBtn').html("");
					$('#chuBtn').append(data);
				}
			});	
		}
		else{
			alert("로그인 후 비추천 할 수 있습니다.");
		}	
	});
	</script>
</body>
</html>