<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%
	String email = request.getParameter("email");
	GtsmDao gtsmdao = GtsmDao.getInstance();
	boolean isExisted = gtsmdao.isCheckEmail(email);
	
	if(isExisted){
%>
{"result" : "fail"}
<%}else{%>
{"result" : "ok"}
<%}%>

