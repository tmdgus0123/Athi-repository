<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

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

<style>
#title {
	font-weight: bold;
	font-size: 1.2em;
	font-family: Tahoma;
	text-align: right;
}
</style>

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
	    		$('p[id="chkTxt"]').css({"fontWeight":"bold", color:"blue", "fontSize":"0.8em;"});
	    	}
	    	else if(val1 != val2){
	    		$('p[id="chkTxt"]').html("비밀번호를 다시 확인해주세요.");
	    		$('p[id="chkTxt"]').css({"fontWeight":"bold", color:"red", "fontSize":"0.8em"});
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
<body class="fixed-nav" id="page-top">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />

	<div class="content-wrapper py-3" align="center" style="background-color: #e8eaed;">
		<!-- 회원가입 S -->
		<div class="col-md-12">
			<hr>
			<div class="row col-sm-12" style="width: 100%; height: 300px; background-image: url('./resources/images/like.gif'); background-size: 100% 900px; background-repeat: no-repeat;">
				<p style="color: black; font-size: 1.5em; font-weight: bold;">&copy; Hello ATHI.</p>
			</div>
			<hr>
			<div class="page-header text-center" style="background-color: #b25e93; color: white;">
				<span style="font-weight: bold; font-size: 1.5em;">회원 정보 수정</span><br />
			</div>
			<hr />
			<form class="form-horizontal" name="modifyFrm" method="post">
				<input type="hidden" name="mode" value="modify" />
				<c:choose>
					<c:when test="${not empty memberInfo}">
						<c:forEach items="${memberInfo}" var="memberInfo">
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputId"><span id="title">아이디</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-4">
									<input type="text" class="form-control" name="inputId" id="inputId" placeholder="ID" style="width: 200px;" value="${memberInfo.id}" readonly />
									&nbsp;&nbsp;&nbsp;
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputPassword"><span id="title">비밀번호</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-5">
									<input class="form-control" name="inputPassword" id="inputPassword" type="password" placeholder="비밀번호" value="${memberInfo.pass}">
									&nbsp;&nbsp;
								</div>
							</div>
							<br />
							<div class="col-md-10" style="text-align: left; margin-left: 31%;">
								<p class="help-block" style="color: red; font-size: 0.8em;">숫자, 특수문자 포함 8자 이상</p>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputPasswordCheck"><span id="title">비밀번호 확인</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-5">
									<input class="form-control" name="inputPasswordCheck" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" value="${memberInfo.pass}">
								</div>
								<div class="col-md-10 text-center">
									<p class="help-block">
										<!-- EL식 -->
									</p>
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline">
								<span style="font-size: 0.8em; color: red;"> <!-- EL식 -->
								</span>
							</div>
						</div>
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputName"><span id="title">이름</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-3">
									<input class="form-control" name="inputName" id="inputName" type="text" placeholder="이름" size="5" value="${memberInfo.name}" readonly>
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputAddr"><span id="title">주소</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="inputAddr" id="inputAddr" placeholder="주소" size="65" value="${memberInfo.address}" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="input-group-btn" style="margin-left: 14px;"> <!-- 다음 API 삽입 -->
										<button type="button" id="postBtn" class="btn btn-success">
											주소 입력<i class="fa fa-mail-forward spaceLeft"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputEmail"><span id="title">이메일</span></label> &nbsp;&nbsp;&nbsp;
								<div class="col-md-7 input-group">
									<input class="form-control col-md-3" name="inputEmail" id="inputEmail" type="text" placeholder="이메일 아이디" value="${fn:substringBefore(memberInfo.email, '@')}">
									&nbsp;&nbsp;&nbsp;
									<input class="form-control col-md-4" name="inputEmail2" id="inputEmail2" type="text" placeholder="도메인" value="<%="@"%>${fn:substringAfter(memberInfo.email, '@')}">
									<select name="emailChange">
										<option value="">도메인</option>
										<option value="@naver.com">NAVER</option>
										<option value="@nate.com">NATE</option>
										<option value="@hanmail.net">DAUM</option>
										<option value="@gmail.com">GOOGLE</option>
									</select>
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputEmail"><span id="title">생년월일</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-2">
									<input class="form-control" name="inputBirthday" id="inputBirthday" type="date" style="width: 200px; height: 30px;" value="${fn:substring(memberInfo.birthday, 0, 10)}">
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputGender"><span id="title">성별</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-7">
								<c:choose>
									<c:when test="${memberInfo.gender == '남'}">
									<div class="btn btn-success">
										<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" checked/>
										<i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="btn btn-success">
										<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" />
										<i class="fa fa-venus" aria-hidden="true"></i>여성
									</div>
									</c:when>
									<c:when test="${memberInfo.gender == '여'}">
									<div class="btn btn-success">
										<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" />
										<i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="btn btn-success">
										<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" checked/>
										<i class="fa fa-venus" aria-hidden="true"></i>여성
									</div>
									</c:when>
								</c:choose>
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group" style="margin-left: 15%;">
							<div class="col-md-10 form-inline text-center">
								<label class="col-md-3 control-label" for="inputPhone"><span id="title">휴대전화</span></label> &nbsp;&nbsp;&nbsp;
								<div class="input-group col-md-3">
									<input class="form-control" name="inputPhone" id="inputPhone" type="text" placeholder="휴대폰번호" value="${memberInfo.phone}">
								</div>
							</div>
						</div>
						<hr />
						<div class="form-group">
							<div class="col-md-12 text-center">
								<button class="btn btn-success" type="submit" name="modifyBtn"> 
									<i class="fa fa-check spaceLeft"></i>&nbsp; 정보 수정
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- redirect 태그 삽입 -->
								<button class="btn btn-danger" type="button" name="mainBtn">
									<i class="fa fa-times spaceLeft"></i>&nbsp; 홈으로
								</button>
							</div>
						</div>
						<hr />
						</c:forEach>
					</c:when>
				</c:choose>
			</form>
			<hr>
		</div>
		<jsp:include page="/common/modalLogin.jsp"/>
	</div>
	<!-- 회원가입 E -->

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
