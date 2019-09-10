<%@page import="kr.co.kic.dev1.dto.GtsmDto"%>
<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@ page pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	GtsmDao gtsmdao = GtsmDao.getInstance();
	GtsmDto gtsmdto = new GtsmDto(email,pwd);
	gtsmdto = gtsmdao.isMember(gtsmdto);
	
	if(gtsmdto != null){
%>
	<script>
		alert('로그인 성공');
		location.href="login.jsp";
	</script>
<%}else{%>
	<script>
		alert('로그인정보가 잘못되었습니다.');
		location.href="login.jsp";
	</script>
<%} %>	