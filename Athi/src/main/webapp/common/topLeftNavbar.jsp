<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	<a class="navbar-brand" href="<%=request.getContextPath()%>/">아 띠</a>
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav">
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
				<a class="nav-link" href="displayPortfolio.do">
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
				<c:when test="${user_id == 'athi'}">
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
						<a class="nav-link dropdown-toggle mr-lg-2" href="#" id="messagesDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-fw fa-envelope"></i>
							<span class="d-lg-none">
								Messages
								<span class="badge badge-pill badge-primary">12 New</span>
							</span>
							<span class="new-indicator text-primary d-none d-lg-block">
								<i class="fa fa-fw fa-circle"></i>
								<span class="number">숫자</span>
							</span>
						</a>
						<div class="dropdown-menu" aria-labelledby="messagesDropdown">
							<h6 class="dropdown-header">New Messages:</h6>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<strong>David Miller</strong>
								<span class="small float-right text-muted">11:21 AM</span>
								<div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<strong>Jane Smith</strong>
								<span class="small float-right text-muted">11:21 AM</span>
								<div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<strong>John Doe</strong>
								<span class="small float-right text-muted">11:21 AM</span>
								<div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item small" href="#"> View all messages </a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle mr-lg-2" href="#" id="alertsDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-fw fa-bell"></i>
							<span class="d-lg-none">
								Alerts
								<span class="badge badge-pill badge-warning">6 New</span>
							</span>
							<span class="new-indicator text-warning d-none d-lg-block">
								<i class="fa fa-fw fa-circle"></i>
								<span class="number">숫자</span>
							</span>
						</a>
						<div class="dropdown-menu" aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">New Alerts:</h6>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<span class="text-success">
									<strong> <i class="fa fa-long-arrow-up"></i> Status Update
									</strong>
								</span>
								<span class="small float-right text-muted">11:21 AM</span>
								<div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<span class="text-danger">
									<strong> <i class="fa fa-long-arrow-down"></i> Status Update
									</strong>
								</span>
								<span class="small float-right text-muted">11:21 AM</span>
								<div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<span class="text-success">
									<strong> <i class="fa fa-long-arrow-up"></i> Status Update
									</strong>
								</span>
								<span class="small float-right text-muted">11:21 AM</span>
								<div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item small" href="#"> View all alerts </a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle mr-lg-2" href="#" id="alertsDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-fw fa-bell"></i>마이페이지
						</a>
						<div class="dropdown-menu" aria-labelledby="alertsDropdown">
							<c:choose>							
								<c:when test="${user_id=='athi'}">
									<h6 class="dropdown-header" style="color:#131314; font-weight:bold; font-size:1.2em;">관리자님 안녕하세요.</h6>
								</c:when>
								<c:otherwise>
									<h6 class="dropdown-header" style="color:#131314; font-weight:bold; font-size:1.2em;">${user_id}님의 마이 페이지</h6>
								</c:otherwise>
							</c:choose>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="myPortfolio.do">
								<strong style="color:#1f9125;">나의 포트폴리오</strong>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="myPage.do">
								<strong style="color:#0796ba;">나의 활동내역</strong>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="editMember.do?user_id=${user_id}&user_pwd=${user_pwd}">
								<strong style="color:#0d5de8;">회원 정보수정</strong>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="window.open('withDraw.do?id=${user_id}', '', 'width=500px, height=500px, status=no, toolbar=no, menubar=no, scrollbars=no');">
								<strong style="color:red;">회원 탈퇴</strong>
							</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="logOutAction.do">
							<i class="fa fa-fw fa-user"></i> 로그아웃
						</a>
					</li>
				</c:when>
			</c:choose>
		</ul>
	</div>
</nav>
