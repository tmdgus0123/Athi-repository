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
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">로그인</h5>
			</div>
			<div class="modal-body">
				<form name="modalFrm" class="form-hofizontal" method="post" action="LoginProcess.do" onsubmit="return isTrimCheck();">
					<div class="form-group">
						<input type="text" class="form-control" name="user_id" placeholder="Id" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="user_pwd" placeholder="Password" />
					</div>
					<div style="text-align: center;">
						<input type="submit" class="btn btn-info" value="로그인">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>