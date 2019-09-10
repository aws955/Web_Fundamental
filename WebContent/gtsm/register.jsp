<%@ page pageEncoding = "utf-8" %>
<%@ include file="../inc/header.jsp" %>

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
            <h5 class="card-title">GTSM Register</h5>
            
            <input type="hidden" name ="checkEmail" id="checkEmail" value="no">
            
            <form class="form-horizontal" role="form" name="f" action="save.jsp" method="POST" >
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
                <div id = "nameMessage"></div>
              </div>
              <div class="form-group">
                <label for="email">이메일 주소</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소를 입력해주세요">
                <div id = "emailMessage"></div>
              </div>
              <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
                <div id = "pwdMessage"></div>
              </div>
              <div class="form-group">
                <label for="repwd">비밀번호 확인</label>
                <input type="password" class="form-control" name="repwd" id="repwd"
                  placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                <div id = "repwdMessage"></div>
              </div>
			
            </form>
            <div class="text-right">
				<a href="" id="saveGtsm" class="btn btn-outline-primary">가입</a>
				<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
			 </div>
          </div>
        </div>
      </div>

    </div>
  </div>
<%@ include file="../inc/footer.jsp" %>
<script>
	$(function(){
		let regEmail =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		$("#saveGtsm").on('click',function(event){
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
			
			if($("#pwd").val().trim().length==0){
				$("#pwdMessage").html("<span class='text-danger'>비밀번호를 입력하세요</span>");
				$("#pwd").addClass("is-invalid");
				$("#pwd").focus();
				return;
			}
			
			if($("#repwd").val().trim().length==0){
				$("#repwdMessage").html("<span class='text-danger'>비밀번호 확인 입력하세요</span>");
				$("#repwd").addClass("is-invalid");
				$("#repwd").focus();
				return;
			}
			
			if($("#pwd").val().trim().length<4||$("#pwd").val().trim().length>16){
				$("#pwdMessage").html("<span class='text-danger'>비밀번호는 4자이상 16자이하입니다.</span>");
				$("#pwd").addClass("is-invalid");
				$("#pwd").focus();
				return;
			}
			
			if($("#pwd").val().trim() != $("#repwd").val().trim()){
				$("#repwdMessage").html("<span class='text-danger'>비밀번호 확인과 비밀번호를 일치하세요</span>");
				$("#repwd").addClass("is-invalid");
				$("#repwd").focus();
				return;
			}
			
			f.submit();
		});
		
		$("#name").on("keyup",function(){
			$("#name").removeClass("is-invalid");
			$("#nameMessage").html('');
		});
		
		$("#email").on("keyup",function(){
			$("#email").removeClass("is-invalid");
			$("#emailMessage").html('');
			if(regEmail.test($("#email").val().trim())==true){
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
		
		$("#pwd").on("keyup",function(){
			$("#pwd").removeClass("is-invalid");
			$("#pwdMessage").html('');
		});
		
		$("#repwd").on("keyup",function(){
			$("#repwd").removeClass("is-invalid");
			$("#repwdMessage").html('');
		});
	});
</script>