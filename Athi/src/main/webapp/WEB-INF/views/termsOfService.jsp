<%@page import="com.kosmo.athi.model.BoardDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script>
	function allCheck(){
		var frm = document.frm;
		for (var i=0; i<frm.accept.length; i++){
		   if(frm.accept[i].checked == false){
		      frm.accept[i].checked = true;
		   }
		}	
	}
   function trimCheck() {
      var frm = document.frm;
      var count = 0;
      for (var i = 0; i < frm.accept.length; i++) {
         if (frm.accept[i].checked == true) {
            count++;
         }
      }
      if (count < frm.accept.length) {
         alert("약관 동의 후 진행해주세요.");
         return false;
      }
      if (count == 2) {
         location.href = './signUp.do';
      }
   }
</script>

</head>

<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('./resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
   <!-- Navigation -->
   <jsp:include page="/common/topLeftNavbar.jsp" />
   <div class="container">
      <form name="frm">
         <div class="col-sm-12" style="margin-top: 50px;">
            <div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
               <h1>회원가입 약정</h1>
            </div>
         </div>
         <div class="row" style="margin-top: 50px;">
            <div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
               <div class="form-group">
                  <h3>개인정보 수집 및 이용에 대한 안내</h3>
                  <textarea class="form-control" style="background-color: #f3f3f3; margin-top: 50px;" rows="10" id="comment">
                  <%@ include file="/resources/termsOfService/termsOfService2.txt"%>
                  </textarea>
                  <label for="a1" class="btn btn-primary" style="float: right; margin-top: 50px;"> 
                     <input type="checkbox" id="a1" name="accept" /> 동의
                  </label>
               </div>
            </div>
         </div>
         <div class="row" style="margin-top: 50px;">
            <div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 10px; opacity: 0.85;">
               <div class="form-group">
                  <h3>아띠 이용약관 동의</h3>
                  <textarea class="form-control" style="background-color: #f3f3f3; margin-top: 50px;" rows="10" id="comment">
                     <%@ include file="/resources/termsOfService/termsOfService1.txt"%>   
                  </textarea>
                  <label for="a2" class="btn btn-primary" style="float: right; margin-top: 50px;"> 
                     <input type="checkbox" id="a2" name="accept" /> 동의
                  </label>
               </div>
            </div>
         </div>
      </form>
      <div class="text-center" style="margin-top: 50px;">
         <button type="button" class="btn btn-primary" name="acceptAll" onclick="allCheck();">전체 동의하기</button>
      </div>
      <div class="text-center" style="margin-top: 50px; margin-bottom: 50px;">
         <button type="button" class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/'">이전으로</button>
         <button type="submit" class="btn btn-success" onclick="return trimCheck();">다음으로</button>
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