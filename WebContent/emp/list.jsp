<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	int  tempPage = 0;
	if(!request.getParameter("page").equals("")){
		tempPage = Integer.parseInt(request.getParameter("page"));
	}
	int  paging = tempPage;
	EmpDao dao = EmpDao.getInstance();
	ArrayList<EmpDto> list = dao.select((paging-1)*10, 10);
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
					<h5 class="card-title">직원 명단</h5>
					<div class="table-responsive-md">
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr class="text-center">
									<th scope="col">직원 번호</th>
									<th scope="col">직원 이름</th>
									<th scope="col">직책</th>
									<th scope="col">사수 번호</th>
									<th scope="col">고용일</th>
									<th scope="col">급여</th>
									<th scope="col">상여금</th>
									<th scope="col">부서 번호</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											EmpDto dto = list.get(i);
											int num = dto.getNum();
											String name = dto.getName();
											String job = dto.getJob();
											int  mgr = dto.getMgr();
											String hiredate = dto.getHiredate();
											int sal = dto.getSal();
											int comm = dto.getComm();
											int d_num = dto.getD_num();
								%>
								<tr>
									<th class="text-center" scope="row"><a href="view.jsp?num=<%=num%>" id="viewEmp"><%=num%></a></th>
									<td><%=name%></td>
									<td><%=job%></td>
									<td class="text-center"><%=mgr%></td>
									<td><%=hiredate%></td>
									<td class="text-center"><%=sal%></td>
									<td class="text-center"><%=comm%></td>
									<td class="text-center"><%=d_num%></td>
								</tr>
								
								
								<%
										}
									} else {
								%>
								<tr>
									<td class="text-center" colspan="4" scope="row">등록된 직원이
										없습니다.</td>
								</tr>
								<%}%>

							</tbody>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">				
								<%@ include file="../inc/paging.jsp"%>
							</ul>
						</nav>
						<div class="text-right">
							<a href="write.jsp" id="saveEmp" class="btn btn-outline-primary">직원등록</a> 
							<a href="" class="btn btn-outline-success">리스트</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>