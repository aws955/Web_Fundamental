<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">로그인</h5>
            
            <form name="f" method="POST" action="checklogin.jsp" onsubmit="return check()">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email *" value="" name="id"/>
                <span class="text-danger" id="idMessage"></span>
              </div>
              
              
              <div class="form-group">
                <input type="password" class="form-control" placeholder="Your Password *" value="" name="pwd"/>
                <span class= "text-danger" id="pwdMessage"></span>
              </div>
              
              <div class="form-group">
              	<input type="submit" id="saveMember" class="btn btn-primary" value="Login" />
              </div>
              <div class="form-group">
                <a href="#" class="ForgetPwd">Forget Password?</a>
             </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file="../inc/footer.jsp" %>

<script>
	
		function check(){
			if(f.id.value==""){
				$("#idMessage").html("아이디를 입력하세요");
				$(".form-group input[name=id]").addClass("is-invalid");
				f.id.focus();
				return false;
			}else if(f.pwd.value==""){
				$("#pwdMessage").html("비밀번호을 입력하세요");
				$(".form-group input[name=pwd]").addClass("is-invalid");
				f.pwd.focus();
				return false;
			}else {
				return true;
			}
		}
		
		$(".form-group input[name=id]").on("keyup",function(){
			$("#idMessage").html("");
			$(".form-group input[name=id]").removeClass("is-invalid");
		});
		
		$(".form-group input[name=pwd]").on("keyup",function(){
			$("#pwdMessage").html("");
			$(".form-group input[name=pwd]").removeClass("is-invalid");
		});
		
		
	
</script>