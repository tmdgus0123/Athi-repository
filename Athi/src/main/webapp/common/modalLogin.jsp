<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>

<script>
	function isTrimCheck(){
		var f = document.modalFrm;

		if(f.user_id.value==""){alert("아이디를 입력해주세요."); f.user_id.focus(); return false;}
		if(f.user_pwd.value==""){alert("비밀번호를 입력해주세요."); f.user_pwd.focus(); return false;}
	}
</script>

<!-- Login Modal -->
<div class="modal fade" id="Login" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="background-color:#3F3F3F; box-shadow:5px 5px 0px 0px; border-radius:2em;">
			<br />
			<div class="text-center">
				<h5 class="modal-title" style="font-family:휴먼편지체; color:white; font-size:2.0em;">ATHI'S LOG-IN</h5>
			</div>
			<div class="modal-header"></div>
			<div class="modal-body">
				<form name="modalFrm" class="form-hofizontal" method="post" action="LoginProcess.do" onsubmit="return isTrimCheck();">
					<div class="form-group">
						<input type="text" class="form-control" name="user_id" placeholder="ID" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="user_pwd" placeholder="PASSWORD" />
					</div>
					<div style="text-align: center;">
						<input type="submit" class="btn btn" value="로그인">
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
