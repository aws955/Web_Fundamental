<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String tempNum =request.getParameter("num");
	int num = 0;
	try{
		num = Integer.parseInt(tempNum);
		
	}catch(NumberFormatException e){
		num = 0;
	}
	
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = dao.select(num);
	
	if(dto != null){
		int _num = dto.getNum();
		String name= dto.getName();
		String job = dto.getJob();
		int mgr = dto.getMgr();
		String date = dto.getDate();
		int sal = dto.getSal();
		int comm = dto.getComm();
		int deptno = dto.getDeptno();
		
%>
<%@ include file="../inc/header.jsp" %>

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
						<h5 class="card-title">사원 상세</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for=num">사원 번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="num" id="num" value="<%=_num %>" placeholder="사원번호를 입력해 주세요" readonly>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">사원 이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" id="name" value="<%=name %>" placeholder="사원 이름을 입력해 주세요" >
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="job">직책</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="job" id="job" placeholder="직책을 입력해 주세요" ><%=job %></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">매니저</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="mgr" id="mgr" placeholder="매니저를 입력해 주세요" ><%=mgr %></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="date">입사일</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="date" id="date" placeholder="입사일을 입력해 주세요" ><%=date %></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">급여</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="sal" id="sal" placeholder="급여를 입력해 주세요" ><%=sal %></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">보너스</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="comm" id="comm" placeholder="보너스를 입력해 주세요" ><%=comm %></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="deptno">부서번호</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="deptno" id="deptno" placeholder="부서번호를 입력해 주세요" ><%=deptno %></textarea>
								</div>
							</div>
						</form>

						<div class="text-right">
							<a href="" id="modifyEmp" class="btn btn-outline-primary">수정</a>
							<a href="" id="deleteEmp" class="btn btn-outline-danger">삭제</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function(){
								$("#modifyEmp").on('click',function(event){
									event.preventDefault();
									//유효성 검사
									let num = $("#num").val();
									let name = $("#name").val();
									let job = $("#job").val();
									let mgr = $("#mgr").val();
									let date = $("#date").val();
									let sal = $("#sal").val();
									let comm = $("#comm").val();
									let deptno = $("#deptno").val();
									
									if(!num){
										alert("작성해주세요..");
										$("#num").focus();
									}else if(!name){								
										alert("작성해주세요..");
										$("#name").focus();										
									}else if(!job){
										alert("작성해주세요..");
										$("#job").focus();
									}else if(!mgr){
										alert("작성해주세요..");
										$("#mgr").focus();
									}else if(!date){
										alert("작성해주세요..");
										$("#date").focus();
									}else if(!sal){
										alert("작성해주세요..");
										$("#sal").focus();
									}else if(!comm){
										alert("작성해주세요..");
										$("#comm").focus();
									}else if(!deptno){
										alert("작성해주세요..");
										$("#deptno").focus();
									}else{
										f.action="modify.jsp";
										f.submit();	
									}
								});
								$("#deleteEmp").on('click',function(event){
									event.preventDefault();
									//유효성 검사 필요 없음.
									f.action="delete.jsp"
									f.submit();
								});
							});
						</script>
					</div>
				</div>
			</div>

		</div>
	</div>
<%@ include file="../inc/footer.jsp" %>
<%}else{%>

<script>
	alert("없는 글입니다");
	history.back(-1);
</script>

<%} %>