<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="thisYmd" />

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
		$("select[name='emailChange']").change(function() {
			var str = "";
			$("#inputEmail2").val("");
			$("select[name='emailChange'] option:selected").each(function() {
				str = $(this).val();
			});
			$("#inputEmail2").val(str);
		}).change();

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

		$('input[type="checkbox"][name="inputGender"][id="inputGender"]').click(function() {
			if ($(this).prop('checked')) {
				$('input[type="checkbox"][name="inputGender"][id="inputGender"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});

		$('button[type="button"][name="idChk"]').on("click", function() {
			var f = document.signFrm;

			if (f.inputId.value == "") {
				alert("ID를 입력해주세요.");
				f.inputId.focus();
				return false;
			}

			window.open("./IDCheck.do?user_id="+ f.inputId.value, "", "width=500, height=300");
		});
					
		$('button[type="button"][class="btn btn-danger"][name="mainBtn"]').on("click", function(){
			var que = confirm("정말 취소하시겠습니까?");
			
			if(que){location.href="./";}
			else{}
		});

		$('input[type="password"][id="inputPasswordCheck"]').on("blur",function() {
			var val1 = $('input[type="password"][id="inputPassword"]').val();
			var val2 = $('input[type="password"][id="inputPasswordCheck"]').val();
			$('p[id="chkTxt"]').html("");
			
			if(val1.length<8 && val2.length<8){
				alert("비밀번호는 특수문자 및 한영, 숫자 포함 8자 이상입니다.");
				$('input[type="password"][id="inputPassword"]').val("");
				$('input[type="password"][id="inputPasswordCheck"]').val("");
				$('input[type="password"][id="inputPassword"]').focus();
				return false;
			}

			if (val1 == val2) {
				$('p[id="chkTxt"]').html("비밀번호가 일치합니다.");
				$('p[id="chkTxt"]').css({"fontWeight" : "bold", color : "blue"});
			} else if (val1 != val2) {
				$('p[id="chkTxt"]').html("비밀번호를 다시 확인해주세요.");
				$('p[id="chkTxt"]').css({"fontWeight" : "bold", color : "red"});
			}
		});

		$('button[class="btn btn-success"][type="submit"][name="signUpBtn"]').on("click", function() {

			if ($("#inputId").val() == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if ($("input[type='hidden'][name='overFlag']").val() == 0) {
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			if ($("#inputPassword").val() == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if ($("#inputPasswordCheck").val() == "") {
				alert("비밀번호를 확인해주세요.");
				return false;
			}
			if ($("#inputName").val() == "") {
				alert("이름을 입력해주세요.");
				return false;
			}
			if ($("#inputAddr").val() == "") {
				alert("주소를 입력해주세요.");
				return false;
			}
			if ($("#inputBirthday").val() == "") {
				alert("생년월일을 입력해주세요.");
				return false;
			}
			if ($("#inputGender").val() == "") {
				alert("성별을 입력해주세요.");
				return false;
			}
			if ($("#inputPhone").val() == "") {
				alert("휴대폰 번호를 입력해주세요.");
				return false;
			}
			if ($("#inputEmail").val() == "" || $("#inputEmail2").val() == "") {
				alert("이메일 혹은 도메인을 입력해주세요.");
				if ($("#inputEmail").val() == "") $("#inputEmail").focus();
				if ($("#inputEmail2").val() == "") $("#inputEmail2").focus();
				return false;
			}
			if($("input[type='hidden'][name='emailFlag']").val()==0){
				alert("이메일 인증이 완료되지 않았습니다.");
				$("#inputEmail").css({"background":"#c9106c", "color":"white"});
				$("#inputEmail2").css({"background":"#c9106c", "color":"white"});
				return false;
			}

			else {
				$('form[name="signFrm"][method="post"]').attr("action","./signUpAction.do");}
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
				<h1>회원 가입</h1>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
				<form name="signFrm" method="post">
					<input type="hidden" name="overFlag" value="0" />
					<input type="hidden" name="emailFlag" value="0" />
					<br /><br />
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<div class="col-sm-8 text-center" style="font-size:1.7em; font-family:Tahoma; color:green; font-weight:bold;">
							<span>아래 항목은 필수 입력 사항입니다.</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<br /><br />
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputId" style="font-weight:bold;">아이디</label>
						<div class="col-sm-6">
							<div class="input-group">
								<input type="text" class="form-control" name="inputId" id="inputId" placeholder="아이디" />
								<span class="input-group-btn">
									<button class="btn btn-primary" type="button" name="idChk">
										중복 확인 <i class="fa fa-mail-forward spaceLeft"></i>
									</button>
								</span>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputPassword" style="font-weight:bold;">비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" name="inputPassword" id="inputPassword" type="password" placeholder="비밀번호">
							<p class="help-block text-left" style="color:red;">숫자, 특수문자 포함 8자 이상</p>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputPasswordCheck" style="font-weight:bold;">비밀번호 확인</label>
						<div class="col-sm-6">
							<input class="form-control" name="inputPasswordCheck" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
							<p class="help-block text-left" id="chkTxt">비밀번호를 입력해주세요.</p>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputName" style="font-weight:bold;">이름</label>
						<div class="col-sm-6">
							<input class="form-control" name="inputName" id="inputName" type="text" placeholder="이름">
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputAddr" style="font-weight:bold;">주소</label>
						<div class="col-sm-6">
							<div class="input-group">
								<input type="text" class="form-control" name="inputAddr" id="inputAddr" placeholder="주소" />
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
						<label class="col-sm-2 control-label text-left" for="inputName" style="font-weight:bold;">생년월일</label>
						<div class="col-sm-6">
							<input class="form-control" name="inputBirthday" id="inputBirthday" type="date" max="${thisYmd}">
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" style="font-weight:bold;">성별</label>
						<div class="col-sm-6 text-left">
							<div class="btn btn-primary">
								<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" /> <i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
							</div>
							<div class="btn btn-primary">
								<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" /> <i class="fa fa-venus" aria-hidden="true"></i>여성
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputNumber" style="font-weight:bold;">휴대폰 번호</label>
						<div class="col-sm-6">
							<input type="tel" class="form-control" name="inputPhone" id="inputPhone" placeholder="- 없이 입력해 주세요" />
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<label class="col-sm-2 control-label text-left" for="inputEmail" style="font-weight:bold;">이메일</label>
						<div class="col-sm-6">
							<div class="input-group">
								<input type="text" class="form-control" name="inputEmail" id="inputEmail" placeholder="이메일" /> 
								<input type="text" class="form-control" name="inputEmail2" id="inputEmail2" placeholder="도메인 (기타입력은 기타 선택후 직접 작성)" /> 
								<select name="emailChange">
									<option value="">도메인</option>
									<option value="@naver.com">네이버</option>
									<option value="@nate.com">네이트</option>
									<option value="@hanmail.net">다음</option>
									<option value="@gmail.com">구글</option>
									<option value="@yahoo.com">야후</option>
									<option value="@hotmail.com">핫메일</option>
									<option value="">기타 입력</option>
								</select>
							</div>
						</div>
						<div class="col-sm-2" style="padding-top:-10px; margin-left:-15px;">
							<button type="button" class="btn btn-primary" name="emailBtn">이메일 인증</button>
						</div>
					</div>
					<br /><br />
					<div class="row form-group">
						<div class="col-sm-12 text-center" style="margin-top: 15px;">
							<button class="btn btn-success" type="submit" name="signUpBtn">
								<i class="fa fa-check spaceLeft"></i> 회원가입
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-danger" type="button" name="mainBtn">
								<i class="fa fa-times spaceLeft"></i> 가입취소
							</button>
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
		$("button[type='button'][name='emailBtn']").click(function(){
			
			if($("input[name='inputEmail'][type='text']").val()==""){alert("이메일 아이디가 비어있습니다."); return false;}
			if($("input[name='inputEmail2'][type='text']").val()==""){alert("도메인 입력후 인증 가능합니다."); return false;}
			
			var email = $("input[name='inputEmail'][type='text']").val() + $("input[name='inputEmail2'][type='text']").val();
			
			window.open("emailAccept.do?email="+email, "eMAIL 인증", "width=500px, height=500px");
		});
	</script>
</body>
</html>