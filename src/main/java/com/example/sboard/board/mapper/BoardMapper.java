package com.example.sboard.board.mapper;

import com.example.sboard.board.domain.Board;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	Board get(int boardNo);

	List<Board> getAll();

	int getLastIndex();

	void insert(Board board);

	void modify(Board board);

	void delete(int boardNo);

}

