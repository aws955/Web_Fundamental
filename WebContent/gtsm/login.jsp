<%@ page pageEncoding ="utf-8" %>
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
            <h5 class="card-title">GTSM Login</h5>
            
            <form name="f" method="POST" action="check_login.jsp">
              <div class="form-group">
                <input type="email" class="form-control" id="email" name="email" placeholder="Your Email *" value="" />
              	<div id = "emailMessage"></div>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Your Password *" value="" />
              	<div id = "pwdMessage"></div>
              </div>
              <div class="text-right">
              	<input type="submit" id="checkLogin" class="btn btn-outline-primary" value="Login" />
				<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
			  </div>
            </form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file="../inc/footer.jsp" %>
<script>
	$(function(){
		$("#checkLogin").on('click',function(){
			event.preventDefault();
			if($("#email").val().trim().length==0){
				$("#emailMessage").html("<span class='text-danger'>이메일을 입력하세요</span>");
				$("#email").addClass("is-invalid");
				$("#email").focus();
				return;
			}
			if($("#pwd").val().trim().length==0){
				$("#pwdMessage").html("<span class='text-danger'>비밀번호를 입력하세요</span>");
				$("#pwd").addClass("is-invalid");
				$("#pwd").focus();
				return;
			}
			f.submit();
		});
		
		$("#email").on("keyup",function(){
			$("#email").removeClass("is-invalid");
			$("#emailMessage").html('');
		});
		
		$("#pwd").on("keyup",function(){
			$("#pwd").removeClass("is-invalid");
			$("#pwdMessage").html('');
		});
	});
</script>