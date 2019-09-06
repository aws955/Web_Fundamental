<%@ page pageEncoding = "utf-8"%>
<%@ include file = "../inc/header.jsp" %>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Member</li>
	</ol>
</nav>

<div class="container">

	<form class="mt-5 mb-5" name="f" action="makeshort.jsp" method="POST">
		<div class="row">
			<div class="col-lg-8">
				<input class="form-control form-control-lg" type="text" name="url" id="url" placeholder="URL을 입력하세요">
			</div>
			<div class="col-lg-4">
				<button type="submit" id="makeurl" class="btn btn-primary btn-lg btn-block">Magic of URL</button>
			</div>
		</div>
	</form>
	
	<div class="row">
		
	</div>
</div>

<%@ include file = "../inc/footer.jsp" %>
<script>
	$(function(){
		$("#makeurl").click(function(event){
			//event.preventEvent();
		});
		
		$("#url").on('keyup',function(){
			$.ajax({
				url : 'checkurl_ajax.jsp?text='+$("#url").val().trim(),
				type : 'GET',
				dataType : 'json',
				error : function(){
					alert('check url error');
				},
				success : function(){
					alert('check url');
				}
			});
		});
	});
</script>