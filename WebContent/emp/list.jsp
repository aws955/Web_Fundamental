<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../inc/header.jsp"%>
<%	
	EmpDao dao = EmpDao.getInstance();

	
	
	
	ArrayList<EmpDto> list = dao.select(0, 100);
%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Emp</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">사원 정보</h5>
					<div class="table-responsive-md">
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="30%"  >
							</colgroup>
							<thead>
								<tr>
									<th scope="col">사원 번호</th>
									<th scope="col">사원 이름</th>
									<th scope="col">직책</th>
									<th scope="col">매니저</th>
									<th scope="col">입사일</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for(int i = 0; i<list.size();i++){
											EmpDto dto = list.get(i);
											int num = dto.getNum();
											String name = dto.getName();
											String job = dto.getJob();
											int mgr = dto.getMgr();
											String date = dto.getDate();
								%>
									<tr>
									<td scope="row"><%=num %></td>
									<td><a href="view.jsp?num=<%=num%>"><%=name %></a></td>
									<td><%=job %></td>
									<td><%=mgr %></td>
									<td><%=date %></td>
									</tr>

								<%}} else {%>
									<tr>
										<td class="text-center" colspan="4" scope="row">등록된 사원이 없습니다.</td>
									</tr>
								<%}	%>
							</tbody>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&laquo;</a></li>
								
								
								<%
									for(int i = 0 ; i<list.size() ; i++){
								%>								
								<li class="page-item"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i%></a></li>

								<%} %>
								
								<li class="page-item"><a class="page-link" href="#">&raquo;</a>
								</li>
							</ul>
						</nav>

						<div class="text-right">
							<a href="write.jsp" class="btn btn-outline-primary">사원등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>