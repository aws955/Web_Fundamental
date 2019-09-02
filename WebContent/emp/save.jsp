<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding = "utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	int mgr = Integer.parseInt(request.getParameter("mgr"));
	String date = request.getParameter("date");
	int sal = Integer.parseInt(request.getParameter("sal"));
	int comm = Integer.parseInt(request.getParameter("comm"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = new EmpDto(num,name,job,mgr,date,sal,comm,deptno);
	boolean isSuccess = dao.insert(dto);
	if(isSuccess){
		
%>
	<script>
		alert("성공");
		location.href="list.jsp"
	</script>
<%}else{ %>
	<script>
		alert("실패");
		histroy.back(-1);
	</script>
<%} %>	

