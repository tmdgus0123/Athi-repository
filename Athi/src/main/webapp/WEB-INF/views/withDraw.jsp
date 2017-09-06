<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
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
<script>
	$(document).ready(function(){
		$("button[type='submit'][class='btn btn-danger'][name='dBtn']").on("click", function(){
			
			if($('input[type="password"][name="user_pwd"]').val()==""){
				alert("비밀번호를 입력해주세요.");
				$('input[type="password"][name="user_pwd"]').focus();
				return false;
			}
			
			if($('input[type="text"][name="pwdtxt"]').val()!="탈퇴"){
				alert("문장을 잘못 입력하였습니다.");
				$('input[type="text"][name="pwdtxt"]').val("");
				return false;
			}
			
			else{$('form[name="wdFrm"][method="post"]').attr("action", "./deleteAction.do")}
		});
	});
</script>
</head>
<body style="background-image: url('./resources/images/withDraw.gif'); background-repeat: no-repeat; background-size: cover;">
	<div style="position: relative;">
		<div class="row">
			<form name="wdFrm" method="post">
				<div style="position: absolute; left: 125px; top: 135px;">
					<input type="hidden" name="user_id" value="${user_id}" />
					<table style="text-align: center;">
						<tr>
							<td>
								<div class="form-group">
									<input type="password" class="form-control" name="user_pwd" placeholder="PASSWORD"  />
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="pwdtxt" placeholder='"탈퇴"를 입력하세요.' />
									<span style="color: red;">"탈퇴"를 입력하시면 탈퇴가 완료됩니다.</span>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div style="position: absolute; left: 208px; top: 418px;">
					<button type="submit" class="btn btn-danger" name="dBtn">회원탈퇴</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>