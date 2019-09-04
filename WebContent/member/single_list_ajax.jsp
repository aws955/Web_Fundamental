<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>

<%
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
	int pageLength = 10;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage - 1) * length;
	MemberDao dao = MemberDao.getInstance();
	ArrayList<MemberDto> list = dao.select(start, length);

	int totalRows = dao.getRows();

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


<div class="table-responsive-md" id="ajaxlist">
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">이름</th>
									<th scope="col">아이디</th>
									<th scope="col">이메일</th>
									<th scope="col">핸드폰번호</th>
									<th scope="col">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											MemberDto dto = list.get(i);
											int seq = dto.getSeq();
											String name = dto.getName();
											String id = dto.getId();
											String email = dto.getEmail();
											String phone = dto.getPhone();
											String regdate = dto.getRegdate();
								%>
								<tr>
									<th scope="row"><%=seq%></th>
									<td><%=name%></td>
									<td><a href="view.jsp?seq=<%=seq%>&page=<%=cPage%>"><%=id%></a></td>
									<td><%=email%></td>
									<td><%=phone%></td>
									<td><%=regdate%></td>
								</tr>
								<%
									}
									} else {
								%>
								<tr>
									<td class="text-center" colspan="6">회원정보가 없습니다.</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>


						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">


								<%
									if (currentBlock != 1) {
								%>
								<li class="page-item"><a class="page-link"
									href="javascript:util.pageLoading('<%=startPage -1%>','<%=length%>');" tabindex="-1">&laquo;</a>
								</li>
								<%
									} else {
								%>
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&laquo;</a></li>
								<%
									}
								%>
								</li>

								<%
									for (int i = startPage; i <= endPage; i++) {
								%>
								<li class="page-item <%if(cPage==i){%>active<%}%>"><a class="page-link"
									href="javascript:util.pageLoading('<%=i%>','<%=length%>');"><%=i%></a></li>
								<%
									}
								%>


								<%
									if (currentBlock != totalBlock) {
								%>
								<li class="page-item"><a class="page-link"
									href="javascript:util.pageLoading('<%=endPage+1%>','<%=length%>');">&raquo;</a> 
								<%} else { %>
								<li class="page-item disabled"><a class="page-link"
									href="#">&raquo;</a> 
									<%	} %></li>
							</ul>
						</nav>

						<div class="text-right">
							<a href="register.jsp?page=<%=cPage %>" class="btn btn-outline-primary">등록</a>
						</div>

					</div>