package com.example.sboard.board.domain;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String memberId;
	private String boardTitle;
	private String boardBody;
	private String boardDate;

}
