<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
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
%>
<%
	String tempNum = request.getParameter("num");
	
	int num = 0;
	try {
		num = Integer.parseInt(tempNum);
	} catch(NumberFormatException e) {
		num = 0;
	} 
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = dao.select(num);
	
	if(dto != null){
		String name = dto.getName();
		String job = dto.getJob();
		int  mgr = dto.getMgr();
		String hiredate = dto.getHiredate();
		int sal = dto.getSal();
		int comm = dto.getComm();
		int d_num = dto.getD_num();
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
						<h5 class="card-title">부서</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="num">직원 번호</label>
								<div class="col-sm-10">
									<p><%=num%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">직원 이름</label>
								<div class="col-sm-10">
									<p><%=name%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="job">직책</label>
								<div class="col-sm-10">
									<p><%=job%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">사수 번호</label>
								<div class="col-sm-10">
									<p><%=mgr%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="hiredate">고용일</label>
								<div class="col-sm-10">
									<p><%=hiredate%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">급여</label>
								<div class="col-sm-10">
									<p><%=sal%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">상여금</label>
								<div class="col-sm-10">
									<p><%=comm%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="d_num">부서 번호</label>
								<div class="col-sm-10">
									<p><%=d_num%></p>
								</div>
							</div>
							<input type="hidden" name="page" value="<%=cPage%>"/>
						</form>

						<div class="text-right">
							<a href="list.jsp?page=<%=cPage %>" id="listEmp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function(){
								$("#modifyEmp").on('click',function(){
									event.preventDefault();
									// 유효성 검사
									let name = $("#name").val();
									let job = $("#job").val();
									let mgr = $("#mgr").val();
									let sal = $("#sal").val();
									let dnum = $("#dnum").val();
									
									if(!name){
										alert("직원 이름을 입력해세주요.");
										$("#name").focus();
										return;
									} else if(!job){
										alert("직책을 입력해세주요.");
										$("#job").focus();
										return;
									} else if(!mgr){
										alert("사수 번호를 입력해세주요.");
										$("#mgr").focus();
										return;
									} else if(!sal){
										alert("급여를 입력해세주요.");
										$("#sal").focus();
										return;
									}  else if(!d_num){
										alert("부서 번호를 입력해세주요.");
										$("#d_num").focus();
										return;
									}
									
									f.action="modify.jsp";
									f.submit();
								});
								$("#deleteEmp").on('click',function(){
									event.preventDefault();	
									
									f.action="delete.jsp";
									f.submit();
								});
							});
						</script>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file = "../inc/footer.jsp" %>
	
	<%} else{%>
	<script>
		alert("없는 글입니다.");
		history.back(-1);
	</script>
	<% } %>