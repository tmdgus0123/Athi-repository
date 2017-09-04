<%@page import="com.kosmo.athi.model.CommentsDTO"%>
<%@page import="com.kosmo.athi.model.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<li>
	<div class="row" style="margin-top: 25px;">
		<div class="col-sm-1">
			<input type="checkbox" style="margin-top: 6.5px;" />
		</div>
		<div class="col-sm-9 text-left">
			<div id="comm_${dto.num }">${dto.id }/(${dto.postdate })</div>
			<div style="margin-top: 25px; margin-bottom: 6.5px;">${dto.content }</div>
		</div>
		<div class="col-sm-1 text-right">
			<button class="btn btn-danger" style="margin-top: 13px;">삭제</button>
		</div>
		<div class="col-sm-1" style="margin-top: 25px;"></div>
	</div>
</li>