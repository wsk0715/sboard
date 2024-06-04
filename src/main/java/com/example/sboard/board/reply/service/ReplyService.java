package com.example.sboard.board.reply.service;

import com.example.sboard.board.reply.domain.Reply;

public interface ReplyService {
	int getLastIndex();

	void insert(Reply reply);

}
