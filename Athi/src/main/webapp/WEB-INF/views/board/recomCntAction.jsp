<%@page import="com.kosmo.athi.model.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosmo.athi.model.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="text-center" style="margin: auto; padding-left: 0px;">
	<button id="choiceBtn" type="button" style="border: 0; outline: 0; background-color: white;">
		<img src="resources/images/chu_up.png"><br>
		<font size="4"><b>추천수 : ${recomCnt}</b></font>
	</button>
	<button id="nRecomBtn" type="button" style="border: 0; outline: 0; background-color: white;">
		<img src="resources/images/chu_down.png"><br>
		<font size="4"><b>반대수 : ${nrecomCnt}</b></font>
	</button>
	<br>
</div>