package com.spring.myweb.freeboard.dto.response;

import java.time.format.DateTimeFormatter;

import com.spring.myweb.freeboard.entity.FreeBoard;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString @EqualsAndHashCode
public class FreeDetailResponseDTO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private String date;
	
	
	
	public FreeDetailResponseDTO(FreeBoard board) {
		this.bno = board.getBno();
		this.title = board.getTitle();
		this.writer = board.getWriter();
		this.content = board.getContent();
		this.date = dateSet(board);
	}



	private String dateSet(FreeBoard board) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		
		if(board.getUpdateDate()==null) return dtf.format(board.getRegDate());
		else return dtf.format(board.getUpdateDate()) + " (수정됨)";
		
	}
	
}
