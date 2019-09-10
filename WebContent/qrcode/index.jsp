<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%

		
%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Qrcode</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Qrcode Generator</h5>
					<form name="f" method="post" action="check_login.jsp">
						<div class="form-group">
							<input id="url" name="url" type="text" class="form-control"
								placeholder="Your URL *" value="http://" />
						</div>
						<div class="form-row d-flex align-items-center">
							<div class="form-group col-md-8">
								<img class="form-control" src="" id="img_form_url" />
							</div>
							<div class="form-group col-md-4">
								<a href="" id="refreshNumber"
									class="btn btn-info btn-lg btn-block"><i
									class="fa fa-refresh" aria-hidden="true"></i> GENERATOR</a>
							</div>
						</div>
					</form>			
					<script>
						$(function(){
							$("#refreshNumber").on("click",function(e){
								e.preventDefault();
								if($("#url").val()==""){
									alert("url를 입력하시오.");
									$("#url").focus();
									return
								}
								
								$.ajax({
									type : 'GET',
									url : 'createImage.jsp?url='+$("#url").val(),
									dataType : 'json',
									success : function(json){
										console.log($("#url").val());
										console.log(json);
										if(json.result == "ok"){
											let imageSrc = json.path;
											$("#img_form_url").attr("src",imageSrc);
										} else{
											alert("Qrcode가 생성되지 않았습니다.")
										}
									}
								});
							});
						});
					</script>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>