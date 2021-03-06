<%@page import="java.util.ArrayList"%>
<%@page import="com.kosmo.athi.model.MemberDTO"%>
<%@page import="com.kosmo.athi.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String id = (String)session.getAttribute("user_id"); 
if(id != null) {
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMember(id);
	session.setAttribute("user_exp", dto.getExp());
	dao.close();
}
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	<a class="navbar-brand" href="<%=request.getContextPath()%>/" style="margin-left:15px;" ><i class="fa fa-handshake-o"></i> 아 띠</a>
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav">
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="아띠 소개">
				<a class="nav-link" href="athiIntroduce.do">
					<i class="fa fa-commenting"></i>
					<span class="nav-link-text"> 아띠 소개 </span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="공지사항">
				<a class="nav-link" href="notice.do?boardName=notice">
					<i class="fa fa-fw fa-bullhorn"></i>
					<span class="nav-link-text"> 공지사항 </span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="자유게시판">
				<a class="nav-link" href="freeBoard.do?boardName=freeBoard">
					<i class="fa fa-fw fa-keyboard-o"></i>
					<span class="nav-link-text"> 자유 게시판 </span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="강의자료실">
				<a class="nav-link" href="javaMaterial.do?boardName=javaMaterial">
					<i class="fa fa-fw fa fa-database" aria-hidden="true"></i>
					<span class="nav-link-text"> 강의자료실 </span>
				</a>
			</li>
			
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="포트폴리오 전시">
				<a class="nav-link" href="portfolioBoard.do">
					<i class="fa fa-fw fa fa fa-picture-o"></i>
					<span class="nav-link-text"> 포트폴리오 전시 </span>
				</a>
			</li>
			
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="질문과 답변">
				<a class="nav-link" href="QnABoard.do?boardName=QnABoard">
					<i class="fa fa-fw fa fa fa-question"></i>
					<span class="nav-link-text"> 질문과 답변 </span>
				</a>
			</li>
			
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="팁과 노하우">
				<a class="nav-link" href="tipBoard.do?boardName=tipBoard">
					<i class="fa fa-fw fa fa fa-lightbulb-o"></i>
					<span class="nav-link-text"> 팁과 노하우 </span>
				</a>
			</li>
			
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="프로젝트 팀원 모집">
				<a class="nav-link" href="recruitProject.do?boardName=recruitProject">
					<i class="fa fa-fw fa-group"></i>
					<span class="nav-link-text"> 프로젝트 팀원 모집 </span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="스터디 그룹 팀원 모집">
				<a class="nav-link" href="recruitStudy.do?boardName=recruitStudy">
					<i class="fa fa-fw fa-graduation-cap"></i>
					<span class="nav-link-text"> 스터디 그룹 모집 </span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="사건 / 사고 게시판">
				<a class="nav-link" href="accident.do?boardName=accident">
					<i class="fa fa-fw fa-bomb"></i>
					<span class="nav-link-text"> 사건 / 사고 게시판</span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="건의사항">
				<a class="nav-link" href="suggestions.do?boardName=suggestions">
					<i class="fa fa-fw fa-comment"></i>
					<span class="nav-link-text"> 건의사항</span>
				</a>
			</li>
			<!-- 관리자모드 S -->
			<c:choose>
				<c:when test="${user_grade == 0}">
					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="관리자 모드">
						<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents4">
							<i class="fa fa-fw fa-gears"></i>
							<span class="nav-link-text">관리자 모드</span>
						</a>
						<ul class="sidenav-second-level collapse" id="collapseComponents4">
							<li>
								<a href="adminBoard.do?">게시판 관리</a>
							</li>
							<li>
								<a href="adminMember.do?">회원 관리</a>
							</li>
							<li>
								<a href="adminProject.do?">포트폴리오 관리</a>
							</li>
						</ul>
					</li>
				</c:when>
			</c:choose>
			<!-- 관리자모드 E -->
		</ul>
		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item">
				<a class="nav-link text-center" id="sidenavToggler">
					<i class="fa fa-fw fa-angle-left"></i>
				</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${user_id==null}">
					<li class="nav-item">
						<a class="nav-link" data-toggle="modal" data-target="#Login">
							<i class="fa fa-fw fa-sign-in"></i> 로그인
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="termsOfService.do">
							<i class="fa fa-fw fa-user"></i> 회원가입
						</a>
					</li>
				</c:when>
				<c:when test="${user_id!=null}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle mr-lg-2" href="#" id="alertsDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-fw fa-bell"></i>마이페이지
						</a>
						<div class="dropdown-menu" aria-labelledby="alertsDropdown">
							<c:choose>							
								<c:when test="${user_grade==0}">
									<h6 class="dropdown-header" style="color:#131314; font-weight:bold; font-size:1.2em;">
										<span style="color:blue;">관리자</span>님 안녕하세요.
									</h6>
								</c:when>
								<c:otherwise>
									<h6 class="dropdown-header" style="color:#131314; font-weight:bold; font-size:1.2em;">
										<span style="color:blue;">${user_id}</span>님의 마이 페이지<br /><br />
										grade : ${user_grade} / exp : ${user_exp}
									</h6>
								</c:otherwise>
							</c:choose>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="myPortfolioBoard.do" style="cursor:pointer;">
								<strong style="color:#acc800;">나의 포트폴리오</strong>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="myPage.do" style="cursor:pointer;">
								<strong style="color:#fdbc00;">나의 활동내역</strong>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="editMember.do?user_id=${user_id}&user_pwd=${user_pwd}" style="cursor:pointer;">
								<strong style="color:#608ffb;">회원 정보수정</strong>
							</a>
							<div class="dropdown-divider"></div>
							<c:if test="${user_id!='athi' }">
							<a class="dropdown-item" onclick="window.open('withDraw.do?id=${user_id}', '', 'width=500px, height=500px, status=no, toolbar=no, menubar=no, resize=no');" style="cursor:pointer;">
								<strong style="color:#f1685e;">회원 탈퇴</strong>
							</a>
							</c:if>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="confirmChk();">
							<i class="fa fa-fw fa-user"></i> 로그아웃
						</a>
					</li>
				</c:when>
			</c:choose>
		</ul>
	</div>
	
	<script>
		function confirmChk(){
			var con = confirm("로그아웃 하시겠습니까?");
			
			if(con){
				window.location.href='logOutAction.do';
			}
			else{
				
			}
		}
	</script>
</nav>
