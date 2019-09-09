<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dto.GtsmDto"%>
<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@ page pageEncoding="utf-8" %>

<%@ include file="../inc/header.jsp" %>

<%-- 
<%  //select하기 위한 자바 블록
	GtsmDao gtsmdao = GtsmDao.getInstance();
	GtsmDto gtsmdto = null;
	ArrayList<GtsmDto> list = gtsmdao.select(0, 100);
%>
--%>

<%  //Paging처리 된 select하기 위한 자바 블록
	GtsmDao gtsmdao = GtsmDao.getInstance();
	GtsmDto gtsmdto = null;
	
	String tempPage = request.getParameter("page");
	
	int cPage = 0;
	if (tempPage == null || tempPage.length()==0 ||tempPage.equals("0")) {
		tempPage = "1";
	}
	try {
		cPage = Integer.parseInt(tempPage);
	} catch (NumberFormatException e) {
		cPage = 1;
	}
	
	int length = 10;
	int start = (cPage - 1) * length;
	ArrayList<GtsmDto> list = gtsmdao.select(start, length);
%>

<%	//리스트 목록을 Paging하기 위한 자바 블록
	int pageLength = 10;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	
	int totalRows = gtsmdao.getRows();
	
	totalPage = totalRows % length == 0 ? totalRows / length : totalRows / length + 1;

	if (totalPage == 0) {
		totalPage = 1;
	}

	int currentBlock = cPage % pageLength == 0 ? cPage / pageLength : cPage / pageLength + 1;
	int totalBlock = totalPage % pageLength == 0 ? totalPage / pageLength : totalPage / pageLength + 1;

	startPage = 1 + (currentBlock - 1) * pageLength;

	endPage = pageLength + (currentBlock - 1) * pageLength;

	if (currentBlock == totalBlock) {
		endPage = totalPage;
	}
	
%>
<%
	int pageNum = 0;
	pageNum = totalRows + (cPage-1)*(-length);
%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">GTSM</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">GTSM List</h5>

					<div class="table-responsive-md">
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="35%" />
								<col width="35%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">가입날짜</th>
								</tr>
							</thead>
							
							<tbody>
							<%
								if(list.size()!=0){
									for(int i = 0; i<list.size(); i++){
										gtsmdto = list.get(i);
							%>
								<tr>
									<td scope="row"><%=pageNum-- %></td>
									<td>
										<a href="view.jsp?seq=<%=gtsmdto.getSeq()%>&page=<%=cPage%>"><%=gtsmdto.getName() %></a>
									</td>
									<td><%=gtsmdto.getEmail() %></td>
									<td><%=gtsmdto.getRegdate() %></td>
								</tr>
							<% }}else {%>
								<tr>
									<td class="text-center" colspan="4">등록된 GTSM이 없습니다</td>
								</tr>
							<%} %>
							</tbody>
							
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								
								<% if(currentBlock != 1){ %>
									<li class="page-item">
										<a class="page-link" href="list.jsp?page=<%=startPage-1 %>" tabindex="-1">&laquo;</a>
									</li>
								<% }else{ %>
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
								<% } %>
								
								<% for(int i = startPage ; i<=endPage ; i++){ %>
									<li class="page-item <%if(cPage==i){%> active <%}%>" >
										<a class="page-link" href="list.jsp?page=<%=i %>"><%=i %></a>
									</li>
								<%} %>
								
								<% if(currentBlock != totalBlock){ %>
									<li class="page-item">
										<a class="page-link" href="list.jsp?page=<%=endPage+1%>">&raquo;</a>
									</li>
								<% }else{ %>
									<li class="page-item disabled">
										<a class="page-link" href="#">&raquo;</a>
									</li>
								<% } %>
							</ul>
						</nav>

						<div class="text-right">
							<a href="register.jsp" class="btn btn-outline-primary">가입</a>
							<a href="login.jsp" class="btn btn-outline-primary">로그인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp" %>