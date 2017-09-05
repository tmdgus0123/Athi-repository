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
	<div class="container" id="categoryView">
		<div class="col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>팁과 노하우 게시판</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-6">
						<div style="float: left;">
							<form action="" name="categoryFrm">
								<div class="form-group">
									<select id="category" class="form-control">
										<% if(request.getParameter("category")!=null){%>
										<option value="" style="color:red;" <%if(request.getAttribute("category").toString().equals(null)){%>selected<%}%>>--- 카테고리 ---</option>
										<option value="java" <%if(request.getAttribute("category").toString().equals("java")){%>selected<%}%>>java</option>
										<option value="html"<%if(request.getAttribute("category").toString().equals("html")){%>selected<%}%>>html</option>
										<option value="javascript"<%if(request.getAttribute("category").toString().equals("javascript")){%>selected<%}%>>javascript</option>
										<option value="jQuery"<%if(request.getAttribute("category").toString().equals("jQuery")){%>selected<%}%>>jQuery</option>
										<option value="spring"<%if(request.getAttribute("category").toString().equals("spring")){%>selected<%}%>>spring</option>
										<option value="JSP"<%if(request.getAttribute("category").toString().equals("JSP")){%>selected<%}%>>JSP</option>
										<option value="bootstrap"<%if(request.getAttribute("category").toString().equals("bootstrap")){%>selected<%}%>>bootstrap</option>
										<option value="jqueryUI"<%if(request.getAttribute("category").toString().equals("jqueryUI")){%>selected<%}%>>jqueryUI</option>
										<option value="css"<%if(request.getAttribute("category").toString().equals("css")){%>selected<%}%>>css</option>
										<option value="servlet"<%if(request.getAttribute("category").toString().equals("servlet")){%>selected<%}%>>servlet</option>
										<% } 
											else{
										%>
										<option value="" style="color:red;">--- 카테고리 ---</option>
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
										<%
											}
										%>
									</select>
								</div>
							</form>
						</div>
					</div>
					<div class="col-sm-6">
						<div style="float: right;">
						<c:choose>
							<c:when test="${user_id!=null}">
							<form action="write.do" method="get">
								<input type="hidden" name="boardName" value="${boardName}" />
								<input type="hidden" name="nowPage" value="${nowPage}" />
								<input type="hidden" name="id" value="${user_id}"/>
								<div class="input-group">
									<button type="submit" class="btn btn-info">글쓰기</button>
								</div>
							</form>
							</c:when>
						</c:choose>
						</div>
					</div>
				</div>
				<table class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="30%" />
						<col width="20%" />
						<col width="20%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr class="active">
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">글쓴이</th>
							<th class="text-center">등록일</th>
							<th class="text-center">조회수</th>
							<th class="text-center">추천</th>
						</tr>
					</thead>

					<tbody>
						<!-- 반복문 시작 -->
						<c:choose>
							<c:when test="${empty listRows}">
								<tr style="text-align: center;">
									<td colspan="6">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items='${listRows}' var='row' varStatus='loop'>
									<tr>
										<td style="text-align: center;">${row.rNum}</td>
										<td><a href="./view.do?num=${row.num }&nowPage=${nowPage}&rNum=${row.rNum}&boardName=${boardName}">${row.title}</a></td>
										<td style="text-align: center;">${row.id}</td>
										<td style="text-align: center;">${row.postdate}</td>
										<td style="text-align: center;">${row.visit_cnt}</td>
										<td style="text-align: center;">${row.comm_cnt}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<!-- 반복문 끝 -->
					</tbody>
				</table>
				<div class="row" style="margin-top: 15px;">
					<div class="col-sm-6">
						<div style="float: left;">
							<ul class="pagination">
								<li>${pagingImg }</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div style="float: right;">
							<form action="search.do" class="form-inline" name="searchFrm" method="get">
								<div class="form-group" style="margin-top:18px;">
									<input type="hidden" name="boardName" value="${boardName }" />
									<input type="hidden" name="nowPage" value="${nowPage }" />
									<select name="searchColumn" class="form-control">
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
		<script>
		$(document).ready(function(){
			$("#category").click(function(){
				$("#category").change(function(){
					$.ajax({
						url : 'tipcategory.do',
						type : "post",
						data : {
							boardName : "tipBoard",
							category : $(this).val()
						},
						success : function(data){
							$("#categoryView").html("");
							$("#categoryView").html(data);
						},
						async : true,
						cache : true
					});
				});
			});
		});
	</script>
</body>
</html>