<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@page import="kr.co.kic.dev1.dto.GtsmDto"%>
<%@ page pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String regdate = request.getParameter("regdate");
	GtsmDto gtsmdto = new GtsmDto(seq,name,email,regdate);
	GtsmDao gtsmdao = GtsmDao.getInstance();
	boolean isSuccess = gtsmdao.update(gtsmdto);
	
	if(isSuccess){
%>
	<script>
		alert('수정성공');
		location.href="view.jsp?seq=<%=seq%>&page=<%=cPage%>";
	</script>
<%}else{%>
	<script>
		alert('수정실패');
		history.back(-1);
	</script>
<%}%>