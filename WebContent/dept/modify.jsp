<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding = "utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("_num"));
	String name = request.getParameter("name");
	String loc = request.getParameter("loc");
	
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = new DeptDto(num,name,loc);
	dto.setNum(num);
	boolean isSuccess = dao.update(dto);
	if(isSuccess){
		
%>
	<script>
		alert("성공");
		location.href="view.jsp?num=<%=num%>"
	</script>
<%}else{ %>
	<script>
		alert("실패");
		histroy.back(-1);
	</script>
<%} %>	

