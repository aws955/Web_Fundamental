<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
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
					<h5 class="card-title">회원가입</h5>
					<form class="form-horizontal" role="form" name="f" method="post" action="save.jsp">
						<div class="form-group">
							<label class="col-form-label" for="name">성명</label> <input
								type="text" class="form-control" name="name" id="name"
								placeholder="이름을 입력해 주세요">
						</div>
						<div class="form-group">
							<label class="col-form-label" for="id">아이디</label> <input
								type="text" class="form-control" name="id" id="id"
								placeholder="아이디를 입력해 주세요">
						</div>
						<div class="form-group">
							<label for="email">이메일 주소</label> <input type="email"
								class="form-control" name="email" id="email"
								placeholder="이메일 주소를 입력해주세요">
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호</label> <input type="password"
								class="form-control" name="pwd" id="pwd"
								placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="form-group">
							<label for="repwd">비밀번호 확인</label> <input type="password"
								class="form-control" name="repwd" id="repwd"
								placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
						</div>
						<div class="form-group">
							<label for="phone">휴대폰 번호</label> <input type="tel"
								class="form-control" name="phone" id="phone"
								placeholder="휴대폰번호를 입력해 주세요">
						</div>

						<%-- 
              <div class="form-group text-center">
                <button type="submit" id="join-submit" class="btn btn-primary">
                  회원가입<i class="fa fa-check spaceLeft"></i>
                </button>
                <button type="reset" class="btn btn-warning">
                  가입취소<i class="fa fa-times spaceLeft"></i>
                </button>
                
              </div>
             --%>
					</form>
					<div class="text-right">
						<a href="" id="saveMember" class="btn btn-outline-primary">등록</a>
						<a href="list.jsp" class="btn btn-outline-success">리스트</a>
					</div>
					<script>
						$(function() {
							$("#saveMember").on('click', function(event) {
								event.preventDefault();
								//유효성 검사 하기
								let name = $('#name').val();
								let id = $('#id').val();
								let email = $('#email').val();
								let pwd = $('#pwd').val();
								let repwd = $('#repwd').val();
								let phone = $('#phone').val();
								
								if (!name) {
									alert('값을 입력하세요');
									$('#name').focus();
								} else if(!id){
									alert('값을 입력하세요');
									$('#id').focus();
								} else if(!email){
									alert('값을 입력하세요');
									$('#email').focus();
								} else if(!pwd){
									alert('값을 입력하세요');
									$('#pwd').focus();
								} else if(!repwd){
									alert('값을 입력하세요');
									$('#repwd').focus();
								} else if(pwd != repwd){
									alert('비밀번호와 비밀번호 확인을 같게 하세요')
								} else if(!phone){
									alert('값을 입력하세요');
									$('#phone').focus();
								} else {
									f.submit();
								}	
							});

						});
					</script>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>