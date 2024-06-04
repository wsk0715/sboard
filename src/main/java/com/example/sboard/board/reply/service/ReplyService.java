package com.example.sboard.board.reply.service;

import com.example.sboard.board.reply.domain.Reply;
import java.util.List;

public interface ReplyService {
	Reply get(int replyNo);

	List<Reply> getAllByBoardNo(int boardNo);

	int getLastIndex();

	void insert(Reply reply);

	void delete(int replyNo);

}
