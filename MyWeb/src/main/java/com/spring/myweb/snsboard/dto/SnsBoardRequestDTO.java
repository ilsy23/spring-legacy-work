package com.spring.myweb.snsboard.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SnsBoardRequestDTO {

	private String content;
	private String writer;
	private MultipartFile file;
	
}
