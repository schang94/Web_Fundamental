<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
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
						<h5 class="card-title">회원리스트</h5>

						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="20%" />
									<col width="20%" />
									<col width="30%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">이름</th>
										<th scope="col">아이디</th>
										<th scope="col">이메일</th>
										<th scope="col">핸드폰번호</th>
										<th scope="col">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>성영한</td>
										<td><a href="view.jsp">syh1011</a></td>
										<td>syh@hbilab.org</td>
										<td>01030241703</td>
										<td>2018/08/29</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td>성영한</td>
										<td>syh1011</td>
										<td>syh@hbilab.org</td>
										<td>01030241703</td>
										<td>2018/08/29</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td>성영한</td>
										<td>syh1011</td>
										<td>syh@hbilab.org</td>
										<td>01030241703</td>
										<td>2018/08/29</td>
									</tr>
								</tbody>
							</table>

							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">6</a></li>
									<li class="page-item"><a class="page-link" href="#">7</a></li>
									<li class="page-item"><a class="page-link" href="#">8</a></li>
									<li class="page-item"><a class="page-link" href="#">9</a></li>
									<li class="page-item"><a class="page-link" href="#">10</a></li>
									<li class="page-item">
										<a class="page-link" href="#">&raquo;</a>
									</li>
								</ul>
							</nav>

							<div class="text-right">
								<a href="#" class="btn btn-outline-primary">등록</a>
								<a href="#" class="btn btn-outline-success">리스트</a>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file = "../inc/footer.jsp" %>