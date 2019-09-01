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
            <h5 class="card-title">로그인</h5>
            <form>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email *" value="" />
              </div>
              <div class="form-group">
                <input type="password" class="form-control" placeholder="Your Password *" value="" />
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login" />
              </div>
              <div class="form-group">
                <a href="#" class="ForgetPwd">Forget Password?</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file = "../inc/footer.jsp" %>