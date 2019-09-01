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
            <h5 class="card-title">회원정보</h5>
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
              </div>
              <div class="form-group">
                <label class="col-form-label" for="id">아이디</label>
                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
              </div>
              <div class="form-group">
                <label for="email">이메일 주소</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소를 입력해주세요">
              </div>
              <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
              </div>
              <div class="form-group">
                <label for="repwd">비밀번호 확인</label>
                <input type="password" class="form-control" name="repwd" id="repwd"
                  placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
              </div>
              <div class="form-group">
                <label for="inputMobile">휴대폰 번호</label>
                <input type="tel" class="form-control" name="tel" id="tel" placeholder="휴대폰번호를 입력해 주세요">
              </div>
              <div class="form-group text-center">
                <a href="" id="join-submit" class="btn btn-primary">
                  회원수정<i class="fa fa-check spaceLeft"></i>
                </a>
                <a href="list.jsp" class="btn btn-warning">
                  회원목록<i class="fa fa-times spaceLeft"></i>
                </a>
              </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
  <%@ include file = "../inc/footer.jsp" %>