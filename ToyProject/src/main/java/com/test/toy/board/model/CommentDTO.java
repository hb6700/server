package com.test.toy.board.model;

import lombok.Data;

@Data
public class CommentDTO {
	private String seq;
	private String content;
	private String regdate;
	private String id;
	private String bseq;
	
	//글쓴 사람 이름 
	private String name;
}

//필요한 데이터(SQL)
//seq number not null,
//content varchar2(1000) not null,
//regdate date default sysdate not null,
//id varchar2(50) not null,                   -- 회원       
//bseq number not null,                       -- 부모 글 번호