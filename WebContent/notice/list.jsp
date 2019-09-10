<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<%
	String tempPage = request.getParameter("page");
	int cPage =0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	
	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
		cPage = 1;
	}
	int length = 3;
	int blockLength = 5;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage-1)*length;
	
	
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.select(start,length);
	
	int totalRows = dao.getRows();
	
	totalPage = totalRows%length == 0 ? totalRows/length : totalRows/length +1;
	
	if(totalPage == 0){
		totalPage = 1;
	}
	
	
	int currentBlock = cPage % blockLength == 0 ? cPage/blockLength : cPage/blockLength + 1;
	int totalBlock = totalPage% blockLength == 0 ? totalPage/blockLength : totalPage/blockLength + 1;
	// 1 11 21 .......
	startPage = 1 + (currentBlock - 1)* blockLength;
	// 10 20 30 ......
	endPage = blockLength + (currentBlock - 1) * blockLength;
	
	if(currentBlock == totalBlock){
		endPage = totalPage;
	}
%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Notice</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시판</h5>
					<div class="table-responsive-md" id="page_table">
						<table class="table table-hover" >
							<colgroup>
								<col width="10%" />
								<col width="12%" />
								<col width="63%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr class="text-center">
									<th scope="col">#</th>
									<th scope="col">작성자</th>
									<th scope="col">제목</th>
									<th scope="col">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											NoticeDto dto = list.get(i);
											int num = dto.getNum();
											String writer = dto.getWriter();
											String title = dto.getTitle();
											String regdate = dto.getRegdate();
								%>
								<tr>
									<th scope="row"><%=num%></th>
									<td><%=writer%></td>
									<td><a href="view.jsp?num=<%=num%>"><%=title%></a></td>
									<td><%=regdate%></td>
								</tr>
								<%
									}
									} else {
								%>
								<tr>
									<td class="text-center" colspan="4" scope="row">공지된 게시물이
										없습니다.</td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								<%if(currentBlock != 1) {%>
									<li class="page-item"><a class="page-link" href="javascript:util.pageLoading('<%=startPage-1%>','<%=length%>');" tabindex="-1">&laquo;</a></li>
								<%} else { %>
									<li class="page-item disabled"><a class="page-link"href="#" tabindex="-1">&laquo;</a></li>
								<%} %>
								<% for(int i = startPage ; i <= endPage ; i++) {%>
									<%if(cPage == i) { %>
										<li class="page-item active"><a class="page-link" href="javascript:void(0);"><%=i%></a></li>
									<%} else { %>
										<li class="page-item"><a class="page-link" href="javascript:util.pageLoading('<%=i%>','<%=length%>');"><%=i%></a></li>
									<%} %>
									
								<%} %>
								<%if(currentBlock != totalBlock) {%>
									<li class="page-item"><a class="page-link" href="javascript:util.pageLoading('<%=endPage+1%>','<%=length%>');">&raquo;</a>
								<%} else { %>
									<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
								<%} %>
								
							</ul>
						</nav>

					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<script>
	const util = { "pageLoading" : function(p,len){
		console.log(p);
		let url = 'http://localhost/notice/list.jsp?page='+p+'&length='+len;
		history.pushState(null,null,url);
		$.ajax({
			type : 'GET',
			url : 'list_ajax.jsp?page='+p+'&length='+len,
			dataType : 'html',
			error : function(){
				elert("error");
			},
			success : function(html){
				$("#page_table").children().remove();
				$("#page_table").html(html);
			}
		});
	}};
</script>
<%@ include file="../inc/footer.jsp"%>