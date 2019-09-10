<%@ page pageEncoding="utf-8" %>
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
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
              </div>
              <div class="form-group">
                <label class="col-form-label" for="email">이메일</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해 주세요">
              </div>
              <div class="form-group">
                <label for="regdate">최종 수정일</label>
                <input type="text" class="form-control" name="regdate" id="regdate" placeholder="최종수정일을 입력해주세요">
              </div>
              
              <div class="text-right">
				<a href="#" class="btn btn-outline-primary">수정</a>
				<a href="#" class="btn btn-outline-danger">삭제</a>
				<a href="list.jsp" class="btn btn-outline-success">리스트</a>
			  </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file = "../inc/footer.jsp" %>