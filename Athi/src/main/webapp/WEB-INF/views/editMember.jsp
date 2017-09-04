<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>

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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$("select[name='emailChange']").on("change", function() {
											
			$("select[name='emailChange'] option:selected").each(function(){
				str = $(this).val();
				$("#inputEmail2").val(str);
			});
											
		});

		$("button[type='button'][id='postBtn']").on("click", function() {
			// 다음 우편번호 API 기능 이용.
			new daum.Postcode({
				oncomplete : function(data) {
					var fn = document.signFrm;

					fn.inputAddr.value = data.zonecode
							+ " " + data.address;
					fn.inputAddr.focus();
				}
			}).open();
		});

		$('input[type="checkbox"][name="gender"][id="inputGender"]').click(
		function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="gender"][id="inputGender"]').prop('checked', false);
					$(this).prop('checked', true);
			}
		});
		
	    $('input[type="password"][id="inputPasswordCheck"]').on("keyup", function(){
	    	var val1 = $('input[type="password"][id="inputPassword"]').val();
	    	var val2 = $('input[type="password"][id="inputPasswordCheck"]').val();
	    	$('p[id="chkTxt"]').html("");
	    	
	    	if(val1 == val2){
	    		$('p[id="chkTxt"]').html("비밀번호가 일치합니다.");
	    		$('p[id="chkTxt"]').css({"fontWeight":"bold", color:"blue"});
	    	}
	    	else if(val1 != val2){
	    		$('p[id="chkTxt"]').html("비밀번호를 다시 확인해주세요.");
	    		$('p[id="chkTxt"]').css({"fontWeight":"bold", color:"red"});
	    	}
	    });
	    
	    $('button[class="btn btn-success"][type="submit"][name="modifyBtn"]').on("click", function(){
	    
	    	if($("#inputId").val()==""){alert("아이디를 입력해주세요."); return false;}
	    	if($("#inputPassword").val()==""){alert("패스워드를 입력해주세요."); return false;}
	    	if($("#inputPasswordCheck").val()==""){alert("패스워드 확인이 되지 않았습니다."); return false;}
	    	if($("#inputName").val()==""){alert("이름을 입력해주세요."); return false;}
	    	if($("#inputAddr").val()==""){alert("주소를 입력해주세요."); return false;}
	    	if($("#inputEmail").val()=="" || $("#inputEmail2").val()==""){alert("이메일 혹은 도메인을 입력해주세요."); return false;}
	    	if($("#inputBirthday").val()==""){alert("생년월일을 입력해주세요."); return false;}
	    	if($("#inputGender").val()==""){alert("성별을 입력해주세요."); return false;}
	    	if($("#inputPhone").val()==""){alert("휴대폰 번호를 입력해주세요."); return false;}
	    	
	    	else{$('form[name="modifyFrm"][method="post"]').attr("action", "./modifyAction.do");}
	    });
	    
	    $('button[class="btn btn-danger"][type="button"][name="mainBtn"]').on("click", function(){
	    	location.href="./";
	    });
	});
</script>
</head>
<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('./resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />
	<div class="container">
		<div class="col-sm-12" style="margin-top: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
				<h1>회원 정보 수정</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
				<form name="modifyFrm" method="post">
					<input type="hidden" name="mode" value="modify" />
					<c:choose>
						<c:when test="${not empty memberInfo}">
							<c:forEach items="${memberInfo}" var="memberInfo">
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputId">아이디</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="inputId" id="inputId" value="${memberInfo.id}" readonly />
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputPassword">비밀번호</label>
									<div class="col-sm-6">
										<input class="form-control" name="inputPassword" id="inputPassword" type="password" value="${memberInfo.pass}" />
										<p class="help-block text-left">숫자, 특수문자 포함 8자 이상</p>
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputPasswordCheck">비밀번호 확인</label>
									<div class="col-sm-6">
										<input class="form-control" name="inputPasswordCheck" id="inputPasswordCheck" type="password" value="${memberInfo.pass}" />
										<p class="help-block text-left" id="chkTxt">비밀번호를 입력해주세요.</p>
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputName">이름</label>
									<div class="col-sm-6">
										<input class="form-control" name="inputName" id="inputName" type="text" value="${memberInfo.name}">
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputAddr">주소</label>
									<div class="col-sm-6">
										<div class="input-group">
											<input type="text" class="form-control" name="inputAddr" id="inputAddr" id="inputId" value="${memberInfo.address}" />
											<span class="input-group-btn">
												<button type="button" id="postBtn" class="btn btn-primary">
													주소 입력<i class="fa fa-mail-forward spaceLeft"></i>
												</button>
											</span>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputName">생년월일</label>
									<div class="col-sm-6">
										<input class="form-control" name="inputBirthday" id="inputBirthday" type="date" value="${fn:substring(memberInfo.birthday, 0, 10)}">
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left">성별</label>
									<div class="col-sm-6 text-left">
										<c:choose>
											<c:when test="${memberInfo.gender == '남'}">
												<div class="btn btn-primary">
													<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" checked /> <i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
												</div>

												<div class="btn btn-primary">
													<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" /> <i class="fa fa-venus" aria-hidden="true"></i>여성
												</div>
											</c:when>
											<c:when test="${memberInfo.gender == '여'}">
												<div class="btn btn-primary">
													<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" /> <i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
												</div>

												<div class="btn btn-primary">
													<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" checked /> <i class="fa fa-venus" aria-hidden="true"></i>여성
												</div>
											</c:when>
										</c:choose>
									</div>

									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputNumber">휴대폰 번호</label>
									<div class="col-sm-6">
										<input type="tel" class="form-control" name="inputPhone" id="inputPhone" value="${memberInfo.phone}" />
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-2"></div>
									<label class="col-sm-2 control-label text-left" for="inputEmail">이메일</label>
									<div class="col-sm-6">
										<div class="input-group">
											<input type="text" class="form-control" name="inputEmail" id="inputEmail" value="${fn:substringBefore(memberInfo.email, '@')}" /> <input class="form-control col-md-4" name="inputEmail2" id="inputEmail2" type="text"
												value="<%="@"%>${fn:substringAfter(memberInfo.email, '@')}"> <select name="emailChange">
												<option value="">도메인</option>
												<option value="@naver.com">@naver.com</option>
												<option value="@nate.com">@nate.com</option>
												<option value="@hanmail.net">@hanmail.net</option>
												<option value="@gmail.com">@gmail.com</option>
											</select>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
								<div class="row form-group">
									<div class="col-sm-12 text-center" style="margin-top: 15px;">
										<button class="btn btn-success" type="submit" name="modifyBtn">
											<i class="fa fa-check spaceLeft"></i>정보수정
										</button>
										&nbsp;&nbsp;&nbsp;
										<button class="btn btn-danger" type="button" name="mainBtn">
											<i class="fa fa-times spaceLeft"></i>이전으로
										</button>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
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

</body>
</html>
