﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7 col-xs-10 login-form">
                    <div class="titlebox">
                        로그인
                    </div>
                    <form method="post" name="loginForm">
                        <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">아이디</label>
                            <input type="text" name="userId" class="form-control" id="id" placeholder="아이디">
                         </div>
                         <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">비밀번호</label>
                            <input type="password" class="form-control" id="id" name="userPw" placeholder="비밀번호">
                         </div>
                         <div class="form-group">
                            <button type="button" id="loginBtn" class="btn btn-info btn-block">로그인</button>
                            <button type="button" id="joinBtn" class="btn btn-primary btn-block">회원가입</button>
                         </div>
                    </form>                
                </div>
            </div>
        </div>
    </section>

    <script>

        // 회원 가입 완료 후 addFlashAttribute로 msg라는 이름의 데이터가 전달됐는지 확인
        const msg = '${msg}';
        if(msg === 'joinSuccess'){
            alert('회원 가입을 환영합니다!');
        } else if(msg == 'loginFail'){
            alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');
        }

        // id, pw 입력란이 공백인지 확인한 후, 공백이 아니라면 submit을 진행
        // 요청 url은 /user/userLogin -> post로 갑니다. (비동기 아님)
        const $form = document.loginForm;
        document.getElementById('loginBtn').onclick = () => {
            if($form.userId.value === '') {
                alert('아이디를 입력해주세요.')
                return;
            }
            if($form.userPw.value === '') {
                alert('비밀번호를 입력해주세요.')
                return;
            }

            $form.submit();
        }

        document.getElementById('joinBtn').onclick = () => {
            location.href='${pageContext.request.contextPath}/user/userJoin';
        }


    </script>

    <%@ include file="../include/footer.jsp" %>