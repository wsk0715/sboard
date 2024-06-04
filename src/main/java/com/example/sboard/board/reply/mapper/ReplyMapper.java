package com.example.sboard.board.reply.mapper;

import com.example.sboard.board.reply.domain.Reply;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	Reply get(int replyNo);

	List<Reply> getAllByBoardNo(int boardNo);

	int getLastIndex();

	void insert(Reply reply);

	void delete(int replyNo);

}
