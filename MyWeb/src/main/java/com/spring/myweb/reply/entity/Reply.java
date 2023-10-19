package com.spring.myweb.reply.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reply {

	private int replyNo;
	private int bno;
	private String replyText;
	private String replyWriter;
	private String replyPw;
	private LocalDateTime replyDate;
	private LocalDateTime updateDate;
	
}
