<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(name,id,email,pwd,phone);
	boolean isSuccess = dao.insert(dto);
	if(isSuccess){
	
%>
	<script>
		alert('성공');
		location.href='list.jsp';
	</script>
<%}else{%>
	<script>
		alert('성공');
		history.back(-1);
	</script>
<%}%>