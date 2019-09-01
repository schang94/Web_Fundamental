<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	int  tempPage = 0;
	if(!request.getParameter("page").equals("")){
		tempPage = Integer.parseInt(request.getParameter("page"));
	}
	int  paging = tempPage;
	DeptDao dao = DeptDao.getInstance();
	ArrayList<DeptDto> list = dao.select((paging-1)*10, 10);
	int count = dao.db_count();
%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Department</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">부서 명단</h5>
					<div class="table-responsive-md">
						<table class="table table-hover">
							<colgroup>
								<col width="15%" />
								<col width="40%" />
								<col width="35%" />
							</colgroup>
							<thead>
								<tr class="text-center">
									<th scope="col">부서 번호</th>
									<th scope="col">부서 이름</th>
									<th scope="col">부서 지역</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											DeptDto dto = list.get(i);
											int num = dto.getNum();
											String name = dto.getName();
											String loc = dto.getLoc();
								%>
								<tr>
									<th scope="row"><a href="view.jsp?num=<%=num%>"><%=num%></a></th>
									<td><%=name%></td>
									<td><%=loc%></td>
									
								</tr>
								<%
									}
									} else {
								%>
								<tr>
									<td class="text-center" colspan="4" scope="row">등록된 부서가
										없습니다.</td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								<%@ include file="../inc/paging.jsp"%>
							</ul>
						</nav>

						<div class="text-right">
							<a href="write.jsp" class="btn btn-outline-primary">부서등록</a> <a
								href="" class="btn btn-outline-success">리스트</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>