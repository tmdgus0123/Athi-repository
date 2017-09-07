<%@page import="com.kosmo.athi.model.BoardDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String category = request.getAttribute("category").toString();
%>

<!-- Navigation -->
<jsp:include page="/common/topLeftNavbar.jsp" />

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
							<select id="category" name="category" class="form-control">
								<option value="" style="color:red;" <%if(category.equals(null)){%>selected<%}%>>--- 카테고리 ---</option>
								<option value="java" <%if(category.equals("java")){%>selected<%}%>>java</option>
								<option value="html"<%if(category.equals("html")){%>selected<%}%>>html</option>
								<option value="javascript"<%if(category.equals("javascript")){%>selected<%}%>>javascript</option>
								<option value="jQuery"<%if(category.equals("jQuery")){%>selected<%}%>>jQuery</option>
								<option value="spring"<%if(category.equals("spring")){%>selected<%}%>>spring</option>
								<option value="JSP"<%if(category.equals("JSP")){%>selected<%}%>>JSP</option>
								<option value="bootstrap"<%if(category.equals("bootstrap")){%>selected<%}%>>bootstrap</option>
								<option value="jqueryUI"<%if(category.equals("jqueryUI")){%>selected<%}%>>jqueryUI</option>
								<option value="css"<%if(category.equals("css")){%>selected<%}%>>css</option>
								<option value="servlet"<%if(category.equals("servlet")){%>selected<%}%>>servlet</option>
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
							<% if(request.getParameter("category")!=null){ %>
							<input type="hidden" name="category" value="<%=request.getParameter("category")%>" />
							<%} %>
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
<script>
	$(document).ready(function(){
		$("#category").click(function(){
			$("#category").change(function(){
				$.ajax({
					url : 'tipBoard.do',
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