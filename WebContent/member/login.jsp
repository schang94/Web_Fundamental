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
					<%
						if (memberDto == null) {
					%>
					<h5 class="card-title">로그인</h5>
					<form name="f" method="post" action="check_login.jsp">
						<div class="form-group">
							<input id="email" name="email" type="email" class="form-control"
								placeholder="Your Email *" value="" />
							<div id="emailMessage"></div>
						</div>
						<div class="form-group">
							<input id="pwd" name="pwd" type="password" class="form-control"
								placeholder="Your Password *" value="" />
							<div id="pwdMessage"></div>
						</div>
						<div class="form-row d-flex align-items-center">
							<div class="form-group col-md-8">
								<img class="form-control" src="" id="img_form_url" />
							</div>
							<div class="form-group col-md-4">
								<a href="" id="refreshNumber"
									class="btn btn-info btn-lg btn-block"><i
									class="fa fa-refresh" aria-hidden="true"></i> REFRESH</a>
							</div>
						</div>
						<div class="form-group">
							<input type="text" name="captchaCode" id="captchaCode"
								class="form-control" placeholder="캡차코드를 입력하세요" value="" />
						</div>
						<div class="form-group text-right">
							<input type="submit" id="checkLogin" class="btn btn-primary"
								value="Login" />
						</div>
						<div class="form-group text-right">
							<a href="" id="forgetPwd" class="ForgetPwd">Forget Password?</a>
						</div>
					</form>
				</div>
				<script>
					$(function() {
						let captchaKey = "";
						let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
						$("#checkLogin").on("click",function(event) {
							event.preventDefault();
							if ($("#email").val().length == 0) {
								$("#emailMessage").html('<span class="text-danger">이메일을 입력하시오.</span>');
								$("#email").addClass("is-invalid");
								$("#email").focus();
								return;
							} else {
								$("#email").removeClass("is-invalid");
								$("#emailMessage").html('');
							}

							if ($("#pwd").val().length == 0) {
								$("#pwdMessage").html('<span class="text-danger">비밀번호를 입력하시오.</span>');
								$("#pwd").addClass("is-invalid");
								$("#pwd").focus();
								return;
							} else {
								$("#pwd").removeClass("is-invalid");
								$("#pwdMessage").html('');
							}

							if ($("#captchaCode").val().length == 0) {
								alert("캡차코드를 입력하시오.")
								$("#captchaCode").focus();
								return;
							}
							
							$.ajax({
								type : 'GET',
								url : 'captcha/getKeyResult.jsp?key='+captchaKey+'&value='+$("#captchaCode").val(),
								dataType : 'json',
								success : function(json){
									console.log(json);
									if(json.result === true){
										f.submit();
									} else {
										alert("챕차코드가 잘못 입력 되었습니다.");
										$("#captchaCode").focus();
										$("#captchaCode").val(' ');
									}
								}
							});
						});

						$("#email").on("keyup", function() {
							$('#emailMessage').html('');
							$("#email").removeClass("is-invalid");
						});
						$("#pwd").on("keyup", function() {
							$('#pwdMessage').html('');
							$("#pwd").removeClass("is-invalid");
						});
						
						$("#refreshNumber").on("click",function(e){
							e.preventDefault();
							loadImage();
						});
						var loadImage = function() {
							$.ajax(
								{
									type : 'GET',
									url : 'captcha/getKey.jsp',
									dataType : 'json',
									timeout : 1000,//최대시간설정(밀리세컨드로 설정)
									error : function() {
										alert('Error loading JSON');
									},
									success : function(json) {
										captchaKey = json.key;
										$.ajax(
											{
												type : 'GET',
												url : 'captcha/getImage.jsp?key='+ captchaKey,
												xhrFields : { // ajax로 이미지 받을 때 
													responseType : 'blob'
												},
												success : function(data) {
													const blobData = data;
													const url = window.URL || window.webkitURL;
													const src = url.createObjectURL(data);
													$('#img_form_url').attr("src",src);
											}
										});//end of inner ajax
									}//end of success
								});//end of outter ajax
						}//end of loadImage function
						loadImage();
					}); // enf of load event
				</script>
				<%
					} else {
				%>
				<h5 class="card-title">로그인하셨습니다</h5>
				<%
					}
				%>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>