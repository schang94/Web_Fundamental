<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@ page contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/*
		page = 1 => 1 ~ 10 limit 0,10
		page = 2 => 11 ~ 20 limit 10,10
		page = 3 => 21 ~ 30 limit 20,10
		등차수열 공식 => An = a1 + (n-1)*d
	*/
	NoticeDao dao = NoticeDao.getInstance();

	int cPage = Integer.parseInt(request.getParameter("page"));
	int length = Integer.parseInt(request.getParameter("length"));

	int blockLength = 10;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage - 1) * length;

	ArrayList<NoticeDto> list = dao.select(start, length);

	int totalRows = dao.getRows();

	totalPage = totalRows % length == 0 ? totalRows / length : totalRows / length + 1;

	if (totalPage == 0) {
		totalPage = 1;
	}

	int currentBlock = cPage % blockLength == 0 ? cPage / blockLength : cPage / blockLength + 1;
	int totalBlock = totalPage % blockLength == 0 ? totalPage / blockLength : totalPage / blockLength + 1;
	// 1 11 21 .......
	startPage = 1 + (currentBlock - 1) * blockLength;
	// 10 20 30 ......
	endPage = blockLength + (currentBlock - 1) * blockLength;

	if (currentBlock == totalBlock) {
		endPage = totalPage;
	}
%>
<div class="table-responsive-md" id="page_table">
	<table class="table table-hover">
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