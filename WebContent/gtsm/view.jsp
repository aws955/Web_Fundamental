<%@page import="kr.co.kic.dev1.dto.GtsmDto"%>
<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@ page pageEncoding="utf-8" %>
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
	
	String tempSeq = request.getParameter("seq");
	int seq = 0;
	try {
		seq = Integer.parseInt(tempSeq);
	} catch (NumberFormatException e) {
		seq = 0;
	}
	
	GtsmDao gtsmdao = GtsmDao.getInstance();
	GtsmDto gtsmdto = gtsmdao.select(seq);

	if (gtsmdto != null) {
		String name = gtsmdto.getName();
		String email = gtsmdto.getEmail();
		String regdate = gtsmdto.getRegdate();
%>
<%@ include file="../inc/header.jsp" %>
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
            <h5 class="card-title">GTSM View</h5>
            
            <input type="hidden" name ="checkEmail" id="checkEmail" value="no">
            <form class="form-horizontal" role="form" name="f" method="post" action="">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" value=<%=name%> placeholder="이름을 입력해 주세요">
              	<div id = "nameMessage"></div>
              </div>
              <div class="form-group">
                <label class="col-form-label" for="email">이메일</label>
                <input type="email" class="form-control" name="email" id="email" value=<%=email%> placeholder="이메일을 입력해 주세요">
              	<div id = "emailMessage"></div>
              </div>
              <div class="form-group">
                <label for="regdate">최종 수정일</label>
                <input type="text" class="form-control" name="regdate" id="regdate" value=<%=regdate%> disabled>
              </div>
              <input type="hidden" name="seq" value="<%=seq%>">
			  <input type="hidden" name="page" value="<%=cPage%>">
            </form>
            
            <div class="text-right">
				<a href="#" id="modifyGtsm" class="btn btn-outline-primary">수정</a>
				<a href="#" id="deleteGtsm" class="btn btn-outline-danger">삭제</a>
				<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
			  </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file = "../inc/footer.jsp" %>
<script>
	$(function() {
		let regEmail =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		$("#modifyGtsm").on("click", function(event) {
			event.preventDefault();
			
			if($("#name").val().trim().length==0){
				$("#nameMessage").html("<span class='text-danger'>이름을 입력하세요</span>");
				$("#name").addClass("is-invalid");
				$("#name").focus();
				return;
			}
			
			if($("#email").val().trim().length==0){
				$("#emailMessage").html("<span class='text-danger'>이메일을 입력하세요</span>");
				$("#email").addClass("is-invalid");
				$("#email").focus();
				return;
			}
			
			if(regEmail.test($("#email").val().trim())==false){
				$("#emailMessage").html("<span class='text-danger'>올바른 이메일 형식이 아닙니다</span>");
				$("#email").addClass("is-invalid");
				$("#email").focus();
				return;
			}
			
			if($("#checkEmail").val()=="no"){
				return;
			}
			
			f.action = "modify.jsp";
			f.submit();
		});
		
		$("#deleteGtsm").on("click", function(event) {
			event.preventDefault();
			if (confirm('정말로 삭제 하시겠습니까?')) {
				f.action = "delete.jsp";
				f.submit();
			}
		});
		
		$("#email").on("keyup",function(){
			$("#email").removeClass("is-invalid");
			$("#emailMessage").html('');
			if(regEmail.test($("#email").val().trim())==true && $("#email").val().trim() != '<%=email%>'){
				$.ajax({
					type: 'GET',
					url: 'check_email_ajax.jsp?email='+$("#email").val().trim(),
					dataType : 'json',
					error : function(){
						alert('error');
					},
					success : function(json){
						if(json.result == "fail"){
							$("#emailMessage").html("<span class='text-danger'>이미 등록된 이메일입니다</span>");
							$("#email").addClass("is-invalid");
							$("#checkEmail").val("no");
						}else{
							$("#emailMessage").html("<span class='text-success'>등록 가능한 이메일입니다.</span>");
							$("#checkEmail").val("yes");
						}
					}
				});
			}
		}); //end of email check
	});
</script>
<%}else{%>
	<script>
	alert("회원 정보가 없습니다.");
	history.back(-1);
	</script>
<%}%>