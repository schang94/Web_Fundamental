<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%

		
%>
<script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Shorten URL</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Shorten URL</h5>
					<form name="f" method="post" action="check_login.jsp">
						<div class="form-group">
							<input id="url" name="url" type="text" class="form-control"
								placeholder="Your URL *" value="http://" />
						</div>
						<div class="form-row d-flex align-items-center">
							<div class="form-group col-md-11">
				                <p id="shortenUrl">shorten url</p> 
				            </div>
				            <div class="form-group col-md-1">
				                <button id="clip_copy" data-toggle="tooltip" data-placement="bottom"  data-clipboard-target="#shortenUrl"  class="btn btn-info btn-lg btn-block"><i class="fa fa-clipboard" aria-hidden="true"></i></button>
				            </div>
						</div>
						<div class="form-group">
							<a href="" id="refreshNumber"
									class="btn btn-info btn-lg btn-block"><i
									class="fa fa-refresh" aria-hidden="true"></i> GENERATOR</a>
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
									url : 'createShortenUrl.jsp?url='+$("#url").val(),
									dataType : 'json',
									success : function(json){
										if(json.shortUrl.message == "ok"){
											let surl = json.shortUrl.result.url;
											$("#shortenUrl").html(surl);
										} else{
											alert("생성되지 않았습니다.")
										}
									},
									error : function(json){
										
										console.log("error");
									}
								});
							});
							
							$("#clip_copy").on("click",function(e){
		            			e.preventDefault();
		            			var clipboard = new ClipboardJS('#clip_copy');

			            		clipboard.on('success', function(e) {
			            		    //console.info('Action:', e.action);
			            		    //console.info('Text:', e.text);
			            		    //console.info('Trigger:', e.trigger);

			            		    e.clearSelection();
			            		    
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