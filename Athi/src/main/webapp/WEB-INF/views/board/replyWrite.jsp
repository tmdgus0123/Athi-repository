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

<script>
	function checkWriteFrm() {
		var f = document.writeFrm;
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
	}
</script>

</head>
<body class="fixed-nav sidenav-toggled" id="page-top" style="background-image: url('./resources/images/backGroundImage.jpg'); background-repeat: no-repeat; background-size: cover;">
	<!-- Navigation -->
	<jsp:include page="/common/topLeftNavbar.jsp" />
<<<<<<< HEAD
	 <div class="container">
      <div class="col-sm-12" style="margin-top: 50px;">
         <div class="col-sm-12 text-center" style="background-color:white; color:black; font-weight:bold; border-radius: 1em; padding-top: 25px; padding-bottom: 25px; opacity: 0.85;">
            <h1>답글 작성</h1>
         </div>
         <div>
            <div class="col-sm-12" style="margin-top: 50px;">
               <div class="col-sm-12 text-center" style="background-color: white; border-radius: 1em; padding-top: 25px; padding-bottom: 5px; margin-bottom: 25px; opacity: 0.85;">
                  <form name="writeFrm" action="writeAction.do" method="post" onsubmit="return checkWriteFrm();">
                    <input type="hidden" name="num" value="${dto.num }" />
					<input type="hidden" name="id" value="${user_id }" />
					<input type="hidden" name="nowPage" value="${nowPage }" />
					<input type="hidden" name="boardName" value="${dto.board_name }" />
                     <div class="form-group">
                        <table class="table" style="margin-top: 50px;">
                           <tr>
                              <td width="" style="padding-top: 50px; padding-bottom: 50px; text-align: center;">
                                 <h4>제목</h4>
                              </td>
                              <td colspan="3" width="90%" style="padding-top: 50px; padding-bottom: 50px;">
                              	<input type="text" class="form-control" name="title" style="width: 90%; border: 2px solid black; background-color:gray; color:white;" value="${dto.getTitle()}" />
                              </td>
=======
	<div class="content-wrapper py-3" style="background-color: #f2f4f7;">
		<div class="col-sm-12">
			<hr>
			<div class="text-center">
				<h1>답글쓰기</h1>
			</div>
			<hr>
			<div class="text-center">
				<form name="writeFrm" action="<c:url value='replyAction.do' />" method="post" onsubmit="return checkWriteFrm();">
					<input type="hid den" name="num" value="${dto.num }" />
					<input type="hid den" name="id" value="${user_id }" />
					<input type="hid den" name="nowPage" value="${nowPage }" />
					<input type="hid den" name="boardName" value="${dto.board_name }" />
>>>>>>> branch 'master' of https://github.com/jk7009ya/athi.git

                              <c:if test="${dto.board_name !='accident' and dto.board_name !='freeBoard' and dto.board_name !='notice' and dto.board_name !='suggestions'}">
                                 <td width="" style="padding-top: 50px; padding-bottom: 50px; text-align: center;">
                                    <h4>카테고리</h4>
                                 </td>
                                 <td colspan="3" width="90%" style="padding-top: 50px; padding-bottom: 50px;">
                                    <select name="pLang" class="form-control" name="title" style="width: 90%;" id="">
                                       <c:choose>
                                          <c:when test="${dto.board_name =='QnADesign'}">
                                             <option value="bootstrap">Bootstrap</option>
                                             <option value="css">CSS</option>
                                             <option value="jQueryUI">jQuery UI</option>
                                          </c:when>
                                          <c:when test="${dto.board_name =='QnADevelop'}">
                                             <option value="java">JAVA</option>
                                             <option value="javascript">javascript</option>
                                             <option value="html">HTML</option>
                                             <option value="jQueryAjax">jQuery&Ajax</option>
                                             <option value="jspServlet">JSP&Servlet</option>
                                             <option value="spring">SRPING</option>
                                          </c:when>
                                          <c:when test="${dto.board_name =='QnAProgram'}">
                                             <option value="software">소프트웨어</option>
                                             <option value="hardware">하드웨어</option>
                                             <option value="system">시스템</option>                                             
                                          </c:when>
                                       </c:choose>
                                    </select>
                                 </td>
                              </c:if>
                           </tr>
                           <tr>
                              <td style="padding-top: 50px; padding-bottom: 50px; text-align: center;"><br> <br> <br> <br>
                                 <h4>내용</h4></td>
                              <td colspan="3" style="padding-top: 50px; padding-bottom: 50px;">
                              	<textarea name="content" class="form-control" style="width: 90%; height: 200px; border: 2px solid black; background-color:gray; color:white;">
                              		${dto.getContent() }
                              	</textarea>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="text-align: center;">
								<button class="btn btn-success" type="submit">등록</button>
								<button class="btn btn-danger" type="button" onclick="history.back();">취소</button>
<<<<<<< HEAD
							  </td>	
                           </tr>
                        </table>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
	<jsp:include page="/common/modalLogin.jsp" />
=======
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
		<jsp:include page="/common/modalLogin.jsp" />
	</div>
>>>>>>> branch 'master' of https://github.com/jk7009ya/athi.git


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