<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

	<%@ include file="../include/header.jsp" %>
	<section>
        <!--Toggleable / Dynamic Tabs긁어옴-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-lg-9 myInfo">
                    <div class="titlebox">
                        MEMBER INFO                    
                    </div>
                    
                    <ul class="nav nav-tabs tabs-style">
                        <li class="active"><a data-toggle="tab" href="#info">내정보</a></li>
                        <li><a data-toggle="tab" href="#myBoard">내글</a></li>
                        <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="info" class="tab-pane fade in active">
                            <form name="myForm" method="post">
                            <table class="table">
                                <tbody class="m-control">
                                    <tr>
                                        <td class="m-title">ID</td>
                                        <td><input class="form-control input-sm" name="userId" value="${login}" readonly></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">이름</td>
                                        <td><input class="form-control input-sm" name="userName" value="${userInfo.userName}"></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title" >비밀번호</td>
                                        <td>
                                            <button id="pw-page-btn" type="button" class="btn btn-primary">비밀번호 변경</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">E-mail</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control input-sm" name="userEmail1" value="${userInfo.userEmail1}" onkeyup="afterChange(this.value)">
                                                <select class="form-control input-sm sel" name="userEmail2" onchange="onkeyup(this.value)">
                                                    <option ${userInfo.userEmail2 == '@naver.com' ? 'selected' : '' }>@naver.com</option>
                                                    <option ${userInfo.userEmail2 == '@daum.net' ? 'selected' : '' }>@daum.net</option>
                                                    <option ${userInfo.userEmail2 == '@gmail.com' ? 'selected' : '' }>@gmail.com</option>
                                                </select>
                                                <button id="mail-check-btn" type="button" class="btn btn-primary" value="unchecked">이메일 인증</button>
                                                <span id="mail-check-state"></span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="mail-check-row" style="display: none; visibility: hidden;">
                                        <td></td>
                                        <td>
                                            <div class="mail-check-box">
                                                <input type="text" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력하세요."
                                                    maxlength="6">
                                                <span id="mail-check-warn"></span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">휴대폰</td>
                                        <td>
                                            <select class="form-control input-sm sel" name="userPhone1">
                                                <option ${userInfo.userPhone1 == '010' ? 'selected' : ''}>010</option>
                                                <option ${userInfo.userPhone1 == '011' ? 'selected' : ''}>011</option>
                                                <option ${userInfo.userPhone1 == '017' ? 'selected' : ''}>017</option>
                                                <option ${userInfo.userPhone1 == '018' ? 'selected' : ''}>018</option>
                                            </select>
                                            <input class="form-control input-sm" name="userPhone2" value="${userInfo.userPhone2}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">우편번호</td>
                                        <td><input class="form-control input-sm" name="addrZipNum" value="${userInfo.addrZipNum}" readonly>
                                        	<button type="button" class="btn btn-primary" id="addBtn" onclick="searchAddress()">주소찾기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">주소</td>
                                        <td><input class="form-control input-sm add" name="addrBasic" value="${userInfo.addrBasic}" readonly></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">상세주소</td>
                                        <td><input class="form-control input-sm add" name="addrDetail" value="${userInfo.addrDetail}"></td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>

                            <div class="titlefoot">
                                <button id="updateBtn" class="btn">수정</button>
                                <button class="btn">목록</button>
                            </div>
                        </div>
                        <!-- 첫번째 토글 끝 -->
                        
                        <!-- 두번째 토글 메뉴 시작 -->
                        <div id="myBoard" class="tab-pane fade">
                            <p>*내 게시글 관리</p>
                            <form>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td>번호</td>
                                        <td>제목</td>
                                        <td>작성일</td>
                                    </tr>
                                </thead>
                                <tbody>
									<c:forEach var="b" items="${userInfo.userBoardList}">
										<tr>
	                                        <td>${b.bno}</td>
	                                        <td><a href="##">${b.title}</a></td>
	                                        <td>${b.date }</td>
	                                    </tr>
									</c:forEach>
                                </tbody>
                            </table>
                            </form>
                        </div>
                        <!-- 두번째 토글 끝 -->
                        <div id="menu2" class="tab-pane fade">
                            <h3>Menu 2</h3>
                            <p>Some content in menu 2.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="../include/footer.jsp" %>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        let code = '';
        let checked = false;
        let email1 = document.myForm.userEmail1.value;
        let email2 = document.myForm.userEmail2.value;


        // 이메일 인증 상태 메시지
        function emailCheckMsg(state){
            const $resultMsg = document.getElementById('mail-check-state');
            if(state) $resultMsg.textContent = '';
            if(!state){ 
                $resultMsg.textContent = '이메일 인증을 완료해 주세요.';
                $resultMsg.style.color = 'red';
            }
        }
        
        // 이메일 변경 상태 체크
        function afterChange(val){
            if(val===email1 || val===email2){
                checked = true;
                emailCheckMsg(checked);
                return;
            }
            checked = false;
            emailCheckMsg(checked);
        }

        // 이메일 인증 버튼 클릭
        document.getElementById('mail-check-btn').onclick = function(){
            if(checked) return;
            document.getElementById('mail-check-row').removeAttribute('style');
            const email = document.myForm.userEmail1.value + document.myForm.userEmail2.value;

            console.log('완성된 email: ' + email);
            fetch('${pageContext.request.contextPath}/user/email', {
                method: 'post',
                headers: {
                    'Content-Type': 'text/plain'
                },
                body: email
            })
            .then(res => res.text())
            .then(data => {
                console.log('인증번호: ', data);
                code = data; // 서버가 전달한 인증번호를 전역변수에 저장.
                alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력해주세요');
            })
            .catch(err => {
                console.log(err);
                alert('알 수 없는 오류가 발생했습니다. 관리자에게 문의하세요!');
            }); // 비동기 끝.
        }

         // 인증번호 검증
        document.querySelector('.mail-check-input').onblur = function(e) {
            // console.log('blur 이벤트 발생 확인!');
            const inputCode = e.target.value; // 사용자가 입력한 인증번호.
            const $resultMsg = document.getElementById('mail-check-warn'); // span

            if(inputCode === code){
                email1 = document.myForm.userEmail1.value;
                email2 = document.myForm.userEmail2.value;
                checked = true;
                document.querySelector('.mail-check-input').value = '';
                $resultMsg.textContent = '';

                alert('이메일 인증이 완료되었습니다.');
                document.getElementById('mail-check-row').style.display = 'none';
                document.getElementById('mail-check-row').style.visibility = 'hidden';
            } else {
                $resultMsg.textContent = '인증번호가 일치하지 않습니다.';
                $resultMsg.style.color = 'red';
                document.querySelector('.mail-check-input').value = '';
                e.target.focus();
            } 
        } 

        document.querySelector('.mail-check-input').onkeydown = function(){
            document.getElementById('mail-check-warn').textContent = '';
        }
        // 인증번호 검증 끝

         // 다음 주소 api  사용해 보기 (script src 추가 해야 함)
         function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.myForm.addrZipNum.value = data.zonecode;
                    document.myForm.addrBasic.value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.myForm.addrDetail.focus();
                }
            }).open();
        } // 주소 찾기 api 끝.

        // 폼 데이터 검증 및 제출
        document.getElementById('updateBtn').onclick = function(){
            
        }

    </script>
    