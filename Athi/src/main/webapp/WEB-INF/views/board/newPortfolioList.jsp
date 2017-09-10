<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<body style="background: white;">
	<div class="row col-sm-12">
		<h1 class="text-center">&lt; New 포트폴리오 리스트 &gt;</h1>
	</div>
	<table class="table table-bordered table-striped table-responsive" id="dataTable" cellspacing="0">
		<colgroup>
			<col width="5%" />
			<col width="15%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr class="btn-primary">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>카테고리</th>
			</tr>
		</thead>
		<tbody>
			<!-- 반복문 시작 -->
			<c:choose>
				<c:when test="${empty newPortfolioList }">
					<tr style="text-align: center;">
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items='${newPortfolioList }' var='list' varStatus='loop'>
						<tr>
							<td>${list.num }</td>
							<td>${list.title }</td>
							<td>
								<c:choose>
									<c:when test="${list.id ge null }">
										탈퇴한 회원입니다.
									</c:when>
									<c:otherwise>
										${list.id}
									</c:otherwise>
								</c:choose>
							</td>
							<td>${list.p_language }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<!-- 반복문 끝 -->
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" style="text-align: right;">
					<button type="button" class="btn btn-danger" name="postBtn" onclick="self.close();">닫기</button>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>