package com.spring.basic.score.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.basic.score.dto.ScoreListResponseDTO;
import com.spring.basic.score.dto.ScoreRequestDTO;
import com.spring.basic.score.entity.Score;
import com.spring.basic.score.repository.IScoreRepository;

import lombok.RequiredArgsConstructor;

//컨트롤러와 레파지토리 사이에 배치되어 기타 비즈니스 로직 처리
//ex) 값을 가공, 예외 처리, dto로 변ㄴ환, 트랜잭션 등등...
@Service //빈 등록
@RequiredArgsConstructor
public class ScoreService {
	
	private final IScoreRepository scoreRepository;

	//등록 중간처리
	//컨트롤러가 DTO를 줬지만
	//온전한 학생의 정보를 가지는 객체는 Score (Entity)
	//Entity를 만들어서 넘기자.
	public void insertScore(ScoreRequestDTO dto) {
		Score score = new Score(dto);
		//Entity를 완성했으니 Repository에 전달해서 DB에 넣자.
		scoreRepository.save(score);
	}

	/*
	 컨트롤러가 데이터베이스를 통해 성적 정보 리스트 얻으려고 할 때
	 Repository는 학생 정보가 모두 포함된 리스트를 가지고 있으므로
	 현재 요청에 어울리는 응답 화면에 맞는 DTO로 변경해서 준다.
	 */
	public List<ScoreListResponseDTO> getList() {
		List<ScoreListResponseDTO> dtoList = new ArrayList<>();
		List<Score> scoreList = scoreRepository.findAll();
		for(Score s : scoreList) {
			ScoreListResponseDTO dto = new ScoreListResponseDTO(s); //Entity를 DTO로 변환
			dtoList.add(dto); //변경한 DTO를 DTO List에 추가
		}
		return dtoList;
		
	}

	//학생 점수 개별 조회
	public Score retrieve(int stuNum) {
		//응답하는 화면에 맞는 DTO를 선언해서 주어야 하는 것이 원칙.
		//만약 Score 전체 데이터가 필요한 것이 아니라면
		//몇 개만 추리고 가공할 수 있는 DTO를 설계해서 리턴하는 것이 맞습니다.
		return scoreRepository.findByStuNum(stuNum);
	}

	public void delete(int stuNum) {
		scoreRepository.deleteByStuNum(stuNum);
	}
	
	public void modify(int stuNum, ScoreRequestDTO dto) {
		Score score = scoreRepository.findByStuNum(stuNum);
		score.changeScore(dto);
		scoreRepository.modify(score);
	}
}
