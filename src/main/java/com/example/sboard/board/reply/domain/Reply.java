package com.example.sboard.board.reply.domain;

import lombok.Data;

@Data
public class Reply {
	private int replyNo;
	private String boardNo;
	private String memberId;
	private String replyBody;
	private String replyDate;

}
