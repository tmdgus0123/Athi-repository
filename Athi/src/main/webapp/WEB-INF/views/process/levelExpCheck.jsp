<%@ page import="com.kosmo.athi.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")!=null){
		String id = session.getAttribute("user_id").toString();
		
		BoardDAO dao = new BoardDAO();
		int chkCnt = dao.checkExp(id);
		
		if(chkCnt==1){
%>
		<script>
			alert("레벨업 되셨습니다. 축하합니다.");
			window.location.reload();
		</script>
<%
		}
		else{
%>
		<script>
			window.location.reload();
		</script>
<%
		}
	}
%>