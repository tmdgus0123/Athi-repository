<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>ATHI</title>
<meta charset="UTF-8">
<meta name="vieport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/bootstrap-3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/jQuery/jquery-3.2.1.js"></script>
</head>

<body style="background-image: url('./resources/images/bgimage.png'); background-repeat: no-repeat; background-size: cover;">
	<div>
		<form name="wdFrm" method="post">
			<div class="row form-group" style="margin-top:150px;">
				<div class="col-sm-2"></div>
				<div class="col-sm-6">
					<h2 class="btn btn-info" style="font-size:1.5em;">&lt; ${mList.id}님의 회원 정보 &gt;</h2>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="user_id">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="user_id" id="user_id" value="${mList.id}" readonly />
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="inputPassword">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputPassword" id="inputPassword" type="password" value="${mList.pass}" readonly />
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputName" id="inputName" type="text" value="${mList.name}" readonly>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="inputAddr">주소</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" name="inputAddr" id="inputAddr" value="${mList.address}" readonly />
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="inputName">생년월일</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputBirthday" id="inputBirthday" type="date" value="${fn:substring(mList.birthday, 0, 10)}" readonly>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary">성별</label>
				<div class="col-sm-6 text-left">
					<c:choose>
						<c:when test="${mList.gender == '남'}">
							<div class="btn btn-success">
								<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" checked readonly />
								<i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
							</div>

							<div class="btn btn-success">
								<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" readonly />
								<i class="fa fa-venus" aria-hidden="true"></i>여성
							</div>
						</c:when>
						<c:when test="${mList.gender == '여'}">
							<div class="btn btn-success">
								<input type="checkbox" name="inputGender" class="" id="inputGender" value="남" readonly />
								<i class="fa fa-mars-stroke-v" aria-hidden="true"></i>남성
							</div>

							<div class="btn btn-success">
								<input type="checkbox" name="inputGender" class="" id="inputGender" value="여" checked readonly />
								<i class="fa fa-venus" aria-hidden="true"></i>여성
							</div>
						</c:when>
					</c:choose>
				</div>

				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="inputNumber">휴대폰 번호</label>
				<div class="col-sm-6">
					<input type="tel" class="form-control" name="inputNumber" id="inputNumber" value="${mList.phone}" readonly />
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="inputEmail">이메일</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" name="inputEmail" id="inputEmail" value="${mList.email}" readonly />
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="memberGrade">회원 등급</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" name="memberGrade" id="memberGrade" value="${mList.grade}" readonly />
						<button type="button" class="btn btn-info" id="gradeBtn">등급 조정</button>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label text-left btn-primary" for="memberExp">경험치</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" name="memberExp" id="memberExp" value="${mList.exp}" readonly />
						<button type="button" class="btn btn-danger" id="expBtn">경험치 조정</button>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<br /><br />
			<div class="form-group text-center">
				<button type="button" class="btn btn-danger" id="closeBtn">닫기</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-success" id="reloadBtn">새로고침</button>
			</div>
		</form>
	</div>
	
	<script>
		$("#gradeBtn").click(function(){
			var grade = prompt("조정할 등급은?(1~10)");
			var id = $("#user_id").val();
			
			$.ajax({
				url : "gradeEdit.do",
				data : {
					grade : grade,
					id : id
				},
				dataType : "script",
				type : "post",
				cache : false,
				success : function(data) {
					window.location.reload();
				}
			});
		});
		
		$("#expBtn").click(function(){
			var exp = prompt("삭감 또는 증감할 경험치?");
			var id = $("#user_id").val();
			
			$.ajax({
				url : "expEdit.do",
				data : {
					exp : exp,
					id : id
				},
				dataType : "script",
				type : "post",
				cache : false,
				success : function(data) {
					window.location.reload();
				}
			});
		});
		
		$("#closeBtn").click(function() {
			self.close();
			opener.location.reload();
		})
		
		$("#reloadBtn").click(function(){
			window.location.reload();
		});
	</script>
</body>
</html>