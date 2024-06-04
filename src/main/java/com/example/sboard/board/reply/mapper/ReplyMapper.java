package com.example.sboard.board.reply.mapper;

import com.example.sboard.board.reply.domain.Reply;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	int getLastIndex();

	void insert(Reply reply);

}
