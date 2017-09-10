<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/bootstrap-3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/jQuery/jquery-3.2.1.js"></script>
</head>
<body>
	<input type="hidden" name="realCode" value="${sessionScope.authCode}"/>
	<table class="table table-striped table-responsive table-bordered text-center" id="emailTable">
		<tr>
			<td><h1>이메일 인증하기</h1></td>
		</tr>
		<tr>
			<td>
				이메일 : <input type="email" name="email" value="${param.email}" readonly/>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-primary" name="acptBtn">인증코드 발송</button>
			</td>
		</tr>
	</table>
</body>
<script>
	
</script>
<script>
	$("button[type='button'][class='btn btn-primary'][name='acptBtn']").click(function(){
		alert("진입");
		$.ajax({
			url : "emailAcception.do",
			data : {
				email : $("input[type='email'][name='email']").val()
			},
			type : "post",
			dataType : "html",
			async : false,
			cache : false,
			success : function(data){
				$("#emailTable").html("");
				$("#emailTable").append("<tr><td><input type='text' name='acceptCode' placeholder='인증코드 입력'/></td></tr>");
				$("#emailTable").append("<tr><td><button type='button' class='btn btn-primary' name='acceptBtn'>인증하기</button></td></tr>");
			}
		});
	});
</script>

<script>
	$("button[type='button'][class='btn btn-primary'][name='acceptBtn']").click(function(){
		var realCode = '${realCode}';
		var authCode = '${acceptCode}';
		
		if(realCode==authCode){
			alert("이메일 인증 완료.");
			$(opener.document).find("input[type='hidden'][name='emailFlag']").val()=1;
			$(opener.document).find("#inputEmail").css({"background":"#0bc415", "color":"white"});
			$(opener.document).find("#inputEmail2").css({"background":"#0bc415", "color":"white"});
			self.close();
		}
	});
</script>
</html>