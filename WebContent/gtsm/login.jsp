<%@ page pageEncoding ="utf-8" %>
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
            <h5 class="card-title">GTSM Login</h5>
            <form>
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Your Email *" value="" />
              </div>
              <div class="form-group">
                <input type="password" class="form-control" placeholder="Your Password *" value="" />
              </div>
              <div class="text-right">
              	<input type="submit" class="btn btn-outline-primary" value="Login" />
				<a href="list.jsp" class="btn btn-outline-success">리스트</a>
			  </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file="../inc/footer.jsp" %>