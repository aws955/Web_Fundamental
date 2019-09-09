<%@page import="kr.co.kic.dev1.dto.GtsmDto"%>
<%@page import="kr.co.kic.dev1.dao.GtsmDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>

<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	String cPage = request.getParameter("page");
	GtsmDao gtsmdao = GtsmDao.getInstance();
	GtsmDto gtsmdto = gtsmdao.select(seq);
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
            <h5 class="card-title">GTSM View</h5>
            
            <form class="form-horizontal" role="form" name="f" method="POST" action="">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="<%=gtsmdto.getName()%>">
              </div>
              <div class="form-group">
                <label class="col-form-label" for="email">이메일</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="<%=gtsmdto.getEmail()%>">
              </div>
              <div class="form-group">
                <label for="regdate">최종 수정일</label>
                <input type="text" class="form-control" name="regdate" id="regdate" placeholder="<%=gtsmdto.getRegdate()%>" disabled>    
              </div>
              
              <div class="text-right">
				<a href="#" class="btn btn-outline-primary">수정</a>
				<a href="#" class="btn btn-outline-danger">삭제</a>
				<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
			  </div>
            </form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file = "../inc/footer.jsp" %>