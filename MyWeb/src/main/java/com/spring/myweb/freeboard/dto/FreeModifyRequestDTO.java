package com.spring.myweb.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class FreeModifyRequestDTO {

	private int bno;
	private String writer; //임시
	private String title;
	private String content;
	
}
