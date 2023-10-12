package com.spring.myweb.freeboard;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.myweb.freeboard.mapper.IFreeBoardMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PageAlgorithmTest {
	
	@Autowired
	private IFreeBoardMapper mapper;
	
	@Test
	@DisplayName("페이지 버튼 알고리즘 테스트")
	void pageTest() {
		int page = 16; // 사용자가 요청한 페이지
		int cpp = 20; // 한 화면에 보여줄 게시물 개수
		int btnNum = 5; // 한 화면에 보여줄 버튼 개수
		
		int articleTotalCount = mapper.getTotal();
		System.out.println("총 게시물 수: " + articleTotalCount);
		
		// 끝 페이지 번호 구하기
		int endPage = (int) (Math.ceil(page / (double) btnNum) * btnNum);
		System.out.println("보정 전 끝 페이지 번호: " + endPage);
		
		// 시작 페이지 번호 구하기
		int beginPage = endPage - btnNum + 1;
		System.out.println("시작 페이지 번호: " + beginPage);
		
		boolean prev = (beginPage == 1) ? false : true;
		boolean next = (articleTotalCount <= (endPage * cpp)) ? false : true;
		
		System.out.println("이전 버튼 활성화: " + prev);
		System.out.println("다음 버튼 활성화: " + next);
		
		if(!next) {
			endPage = (int) Math.ceil(articleTotalCount / (double) cpp);
		}
		
		System.out.println("보정 후 끝 페이지 번호: " + endPage);
		
	}

}
