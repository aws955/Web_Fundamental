<%@page import="kr.co.kic.dev1.dto.GtsmDto"%>
<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	GtsmDao gtsmdao = GtsmDao.getInstance();
	GtsmDto gtsmdto = new GtsmDto(name,email,pwd);
	boolean isSuccess = gtsmdao.insert(gtsmdto);
	if(isSuccess){
	
%>
	<script>
		alert('성공');
		location.href='list.jsp';
	</script>
<%}else{%>
	<script>
		alert('실패');
		history.back(-1);
	</script>
<%}%>

