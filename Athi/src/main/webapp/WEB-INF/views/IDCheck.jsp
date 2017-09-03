<%@ page import="com.kosmo.athi.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getParameter("UTF-8");

	String id = request.getParameter("user_id");
	
	System.out.println(id);
	
	MemberDAO dao = new MemberDAO();
	
	boolean check = dao.isMember(id);
	
	dao.close();
	
	if(check==false){
%>
	<script>
		alert("사용가능한 아이디 입니다.");
		self.close();
	</script>
<%
	}
	else{
%>
	<script>
		alert("중복된 아이디 입니다.");
		opener.signFrm.inputId.value="";
		opener.signFrm.inputId.focus();
		self.close();
	</script>
<%
	}
%>