package com.example.sboard.board.reply.mapper;

import com.example.sboard.board.reply.domain.Reply;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReplyMapper {
	Reply get(int replyNo);

	List<Reply> getAllByBoardNo(@Param("boardNo") int boardNo,
								@Param("pageSize") int pageSize,
								@Param("pageValue") int pageValue);

	int getTotalElements(int boardNo);

	int getLastIndex();

	void insert(Reply reply);

	void delete(int replyNo);

	void deleteAllByBoardNo(int boardNo);

}
