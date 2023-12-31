package com.spring.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hw")
public class LoginController {

	/*
    1번요청: 로그인 폼 화면 열어주기
    - 요청 URL : /hw/s-login-form : GET
    - 포워딩 jsp파일 경로:  /WEB-INF/views/response/s-form.jsp
    - html form: 아이디랑 비번을 입력받으세요.

    2번요청: 로그인 검증하기
    - 로그인 검증: 아이디를 grape111이라고 쓰고 비번을 ggg9999 라고 쓰면 성공
    - 요청 URL : /hw/s-login-check : POST
    - 포워딩 jsp파일 경로:  /WEB-INF/views/chap03/s-result.jsp
    - jsp에게 전달할 데이터: 로그인 성공여부, 아이디 없는경우, 비번 틀린경우
    - 로그인 여부를 "success", "f-pw", "f-id"문자열로 전송
    
    s-result.jsp에서 전송된 고그인 여부를 확인해서 적절한 화면을 응답하시면 되겠습니다.
    응답 형태는 자유롭게 작성하세요.

	 */
	
	//로그인 양식 화면을 열어주는 요청 처리
	@GetMapping("/s-login-form")
	public String sLoginForm(){
		return "response/s-form";
	}
	
	//로그인 검증 요청 처리
	@PostMapping("/s-login-check")
	public String sLoginCheck(String id, String pw, Model model) {
		String loginResult;
		if(!id.equals("grape111")) {
			loginResult = "f-id";
		} else if (!pw.equals("ggg9999")) {
			loginResult = "f-pw";
		} else {
			loginResult = "success";
		}
		model.addAttribute("loginResult", loginResult);
		return "response/s-result";
	}
	
	
}
